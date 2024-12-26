USE abc;
SHOW TABLES;

# Check triggers (not all commands run)

SELECT * FROM ActiveUserList;
SELECT * FROM _User;
SELECT * FROM DeletedUser;
SELECT * FROM Violation;
SELECT * FROM Oldname;
SELECT * FROM POST;
select * from box;
SELECT * FROM UsersAndPosts;
SELECT * FROM BoxToUser;
DELETE FROM _user where userid = 3;
UPDATE _User SET UserDisplayName = "Explotano catto" WHERE UserID = 4;
SELECT * FROM OldName;
UPDATE DeletedUser SET DeletedUserDate = NOW() WHERE DeletedUserID = 2;
UPDATE DeletedUser SET DeletedUserDate = NOW() WHERE DeletedUserID = 5;
 
#INNER JOIN
SELECT u.UserDisplayName, r.RoleName
FROM _user u
INNER JOIN usertorole ur ON u.UserID = ur.UserID
INNER JOIN _role r ON ur.RoleID = r.RoleID;

SELECT p.PostText, c.CommentContent
FROM post p
INNER JOIN _comment c ON p.PostID = c.CommentPostID;

#OUTER JOIN
SELECT u.UserDisplayName, b.BoxName
FROM _user u
LEFT OUTER JOIN boxtouser bu ON u.UserID = bu.UserID
LEFT OUTER JOIN box b ON bu.BoxID = b.BoxID;

SELECT u.UserDisplayName, i.ImageContent
FROM _user u
LEFT OUTER JOIN image i ON u.UserID = i.ImagePostID
ORDER BY u.UserDisplayName;

#SUBQUERY IN WHERE
SELECT UserDisplayName, UserCountry
FROM _user
WHERE UserID IN (
    SELECT BoxAdminID
    FROM box
    WHERE BoxName = 'TheGuys'
);

SELECT BoxName, BoxCreatedDate
FROM box
WHERE BoxAdminID = (
    SELECT UserID
    FROM _user
    WHERE UserDisplayName = 'Nahiu'
);

#SUBQUERY IN FROM
SELECT u.UserDisplayName, temp.TotalPosts
FROM _user u
INNER JOIN (
    SELECT PostUserID, COUNT(*) AS TotalPosts
    FROM post
    GROUP BY PostUserID
) temp ON u.UserID = temp.PostUserID;

SELECT u.UserID, u.UserDisplayName, temp.TotalComments
FROM _user u
LEFT JOIN (
    SELECT CommentUserID, COUNT(*) AS TotalComments
    FROM _comment
    GROUP BY CommentUserID
) temp ON u.UserID = temp.CommentUserID
ORDER BY temp.TotalComments DESC;

#GROUP BY
SELECT u.UserCountry, COUNT(*) AS TotalUsers
FROM _user u
GROUP BY u.UserCountry
ORDER BY TotalUsers DESC;

SELECT b.BoxName, COUNT(*) AS TotalUsersInBox
FROM box b
INNER JOIN boxtouser bu ON b.BoxID = bu.BoxID
GROUP BY b.BoxID, b.BoxName
ORDER BY TotalUsersInBox DESC;



# Rollback
DELETE FROM Box WHERE BoxID = 1;
ROLLBACK;

# Call procedure
CALL UserJoinBox(1,2);
CALL UserInfo(1);
