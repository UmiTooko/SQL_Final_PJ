USE abc;
SHOW TABLES;

SELECT * FROM _User;
SELECT * FROM DeletedUser;
SELECT * FROM Violation;
SELECT * FROM Oldname;
SELECT * FROM POST;
select * from box;
SELECT * FROM UsersAndPosts;

DELETE FROM _user where userid = 3;
UPDATE _User SET UserDisplayName = "Explotano catto" WHERE UserID = 5;
SELECT * FROM OldName;
UPDATE DeletedUser SET DeletedUserDate = NOW() WHERE DeletedUserID = 6;

DELETE FROM Box WHERE BoxID = 1;
