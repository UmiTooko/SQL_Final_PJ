USE abc

DELIMITER ??
CREATE PROCEDURE UserJoinBox (IN InUserID INT, IN InBoxID INT)
BEGIN
	INSERT INTO BoxToUser(UserID, BoxID) VALUES (InUserID, InBoxID);
END??

DELIMITER ??
CREATE PROCEDURE UserAddRole (IN InUserID INT, IN InRoleID INT)
BEGIN
	INSERT INTO UserToRole(UserID, InRoleID) VALUES (InUserID, InRoleID);
END??


DELIMITER ??

CREATE PROCEDURE UserInfo (IN InUserID INT)
BEGIN
    SELECT 
        InUserID AS 'TheUserID', 
        (SELECT UserDisplayName FROM _User WHERE UserID = InUserID) AS DisplayName,
        (SELECT COUNT(BoxID) FROM BoxToUser 
         WHERE UserID = InUserID) AS NumberOfBoxesJoined,
		(SELECT COUNT(UserID) FROM UserToRole 
         WHERE UserID = InUserID) AS NumberOfRoles,
        (SELECT COUNT(PostID) FROM Post 
         WHERE PostUserID = InUserID) AS NumberOfPosts,
        (SELECT COUNT(CommentID) FROM _Comment 
         WHERE CommentUserID = InUserID) AS NumberOfComments,
        (SELECT COUNT(OldNameID) FROM OldName 
         WHERE OldNameUserID = InUserID) AS NumberOfOldNames,
        (SELECT COUNT(ViolationID) FROM Violation 
         WHERE ViolationUserID = InUserID) AS NumberOfViolations;
END??