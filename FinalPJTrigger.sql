USE abc;
SHOW TABLES;

#====================================================
# To make sure PostDate is later than UserCreatedDate
#====================================================
DELIMITER ?
CREATE TRIGGER CheckDatePostToUser
BEFORE INSERT ON Post
FOR EACH ROW
BEGIN
	DECLARE TriggerUserCreatedDate DATETIME;
    SELECT UserCreatedDate INTO TriggerUserCreatedDate FROM _User WHERE UserID = NEW.PostUserID;
    
    IF NEW.PostDate <= TriggerUserCreatedDate THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'PostDate can not be earlier than UserCreatedDate.';
    END IF;
END ?



#====================================================
# To make sure CommentDate is later than UserCreatedDate
#====================================================
DELIMITER ?
CREATE TRIGGER CheckDateCommentToUser
BEFORE INSERT ON _Comment
FOR EACH ROW
BEGIN
	DECLARE TriggerUserCreatedDate DATETIME;
    SELECT UserCreatedDate INTO TriggerUserCreatedDate FROM _User WHERE UserID = NEW.CommentUserID;
    
    IF NEW.CommentDate <= TriggerUserCreatedDate THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'CommentDate can not be earlier than UserCreatedDate.';
    END IF;
END ?


#======================================
# Check CommentDate later than post date
#======================================
DELIMITER ?
CREATE TRIGGER CheckDateCommentToPost
BEFORE INSERT ON _Comment
FOR EACH ROW
BEGIN
	DECLARE TriggerPostDate DATETIME;
											
	SELECT PostDate INTO TriggerPostDate FROM Post WHERE PostID = NEW.CommentPostID;
  
	IF NEW.CommentDate <= TriggerPostDate THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'CommentDate need to be later than PostDate.';
		 
	END IF;
END ?

#====================================================
# To make sure ViolationDate is later than UserCreatedDate
#====================================================
DELIMITER ?
CREATE TRIGGER CheckDateViolationToUser
BEFORE INSERT ON Violation
FOR EACH ROW
BEGIN
	DECLARE TriggerUserCreatedDate DATETIME;
    SELECT UserCreatedDate INTO TriggerUserCreatedDate FROM _User WHERE UserID = NEW.ViolationUserID;
    
    IF NEW.ViolationDate <= TriggerUserCreatedDate THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ViolationDate can not be earlier than UserCreatedDate.';
    END IF;
END ?

#====================================================
# Make sure no duplicated UserName
#====================================================
DELIMITER ?
CREATE TRIGGER CheckDuplicateUserDisplayName
BEFORE INSERT ON _User
FOR EACH ROW
BEGIN
    DECLARE UserExists INT;
    SELECT COUNT(*) INTO UserExists FROM _User WHERE UserDisplayName = NEW.UserDisplayName;
    
    IF UserExists > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'UserDisplayName already exists, Please choose a different username.';
    END IF;
END ?


#===============================================================================
# Automatically insert data into DeletedUser table when _User table has new data
#===============================================================================
DELIMITER ?
CREATE TRIGGER AutoInsertUser
AFTER INSERT ON _User
FOR EACH ROW
BEGIN
	INSERT INTO DeletedUser(DeletedUserID, DeletedUserDate, DeletedUserReason) VALUES(NEW.UserID, NULL, "");
END ?


#=======================================
# Update DeletedTable for Soft-deletion
#=======================================
DELIMITER ?
CREATE TRIGGER UserDeleteLog
BEFORE DELETE ON _User
FOR EACH ROW
BEGIN

	SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Please do the soft-deletion by updating the DeletedUserDate in DeletedUser table;';
END ?


#===================================================
# Update UserOldName when UserDisplayName is updated 
#===================================================
DELIMITER ?
CREATE TRIGGER AutoInsertOldName
AFTER UPDATE ON _User
FOR EACH ROW
BEGIN
	IF OLD.UserDisplayName <> NEW.UserDisplayName THEN
		INSERT INTO OldName( OldNameUserID, OldNameDisplayName, OldNameChangedDate) VALUES(NEW.UserID, OLD.UserDisplayName, NOW());
	END IF;
END ?



#========================================================
# Prevent deleting User who is an admin of at least one box
#=========================================================
DELIMITER ?
CREATE TRIGGER PreventAdminUserDeleting
BEFORE UPDATE ON DeletedUser
FOR EACH ROW
BEGIN
	DECLARE CheckAdmin INT;
    SELECT COUNT(*) INTO CheckAdmin FROM Box WHERE BoxAdminID = OLD.DeletedUserID;
	IF CheckAdmin > 0 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'This user is currently an admin of at least one box and can not delete his account.';
	END IF;
END ?



#===================
# Make sure Image only have one ID is not null, the other one must be null (One image can only belongs to a post, or a comment)
#===================
DELIMITER ?

CREATE TRIGGER ImageSourceValidating
BEFORE INSERT ON Image
FOR EACH ROW
BEGIN
    -- Check that exactly one of the two columns is NULL
    IF (NEW.ImagePostID IS NULL AND NEW.ImageCommentID IS NULL) OR
       (NEW.ImagePostID IS NOT NULL AND NEW.ImageCommentID IS NOT NULL) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'An image can only belong to a post or a comment.';
    END IF;
END ?