USE abc;
SHOW TABLES;

#============
# View all active user (not deleted)
#============
CREATE VIEW UserList AS
SELECT _User.* 
FROM _User JOIN DeletedUser ON _User.UserID = DeletedUser.DeletedUserID 
WHERE DeletedUser.DeletedUserDate IS NULL;

#========================
# View all deleted user
#========================
CREATE VIEW DeletedUserList AS
SELECT _User.*, DeletedUser.DeletedUserDate, DeletedUser.DeletedUserReason
FROM _User JOIN DeletedUser ON _User.UserID = DeletedUser.DeletedUserID 
WHERE DeletedUser.DeletedUserDate IS NOT NULL;

#==============================================
# View all User and their history name changes
#==============================================
CREATE VIEW UserNameHistory AS
SELECT _User.*, DeletedUser.DeletedUserDate, DeletedUser.DeletedUserReason
FROM _User JOIN DeletedUser ON _User.UserID = DeletedUser.DeletedUserID 
WHERE DeletedUser.DeletedUserDate IS NOT NULL;


#==========================
# View all posts and its box
#==========================
CREATE VIEW PostAndBox AS
SELECT Post.* 
FROM Post JOIN _User ON Post.PostUserId = _User.UserID
JOIN DeletedUser ON _User.UserID = DeletedUser.DeletedUserID
WHERE DeletedUser.DeletedUserDate IS NULL;

#==============================
# View all user and their posts
#==============================
CREATE VIEW UsersAndPosts AS
SELECT _User.UserID, _User.UserDisplayname, Box.BoxID, Box.BoxName, Post.PostID, Post.PostText
FROM Box JOIN Post ON Box.BoxID = Post.PostBoxID
JOIN _User ON Post.PostUserId = _User.UserID
JOIN DeletedUser ON _User.UserID = DeletedUser.DeletedUserID
WHERE DeletedUser.DeletedUserDate IS NULL