DROP DATABASE IF EXISTS abc;
SET autocommit=0;
CREATE DATABASE IF NOT EXISTS abc;
SHOW DATABASES;
USE abc;
SHOW TABLES;

CREATE TABLE _User(
	UserID					INT 				PRIMARY KEY AUTO_INCREMENT,
    UserDisplayName			VARCHAR(20)			NOT NULL,
    UserPassword			VARCHAR(20),
    UserFirstName 			VARCHAR(20),
    UserLastName			VARCHAR(20),
    UserBirth				DATETIME,
    UserGender				ENUM('M', 'F', 'O'),
    UserCountry				VARCHAR(20),
    UserAboutMe				TEXT,
    UserAvatar				TEXT,
    UserBanner				TEXT,
    UserCreatedDate			DATETIME			NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE OldName(
	OldNameID				INT					PRIMARY KEY AUTO_INCREMENT,
    OldNameUserID			INT,
    OldNameDisplayName		VARCHAR(20),
    OldNameChangedDate		DATETIME			DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Violation(
	ViolationID				INT					PRIMARY KEY AUTO_INCREMENT,
    ViolationUserID			INT,
    ViolationLevel			SMALLINT,
    ViolationNote			TEXT,
    ViolationDate			DATETIME		
);

CREATE TABLE DeletedUser(
	DeletedUserID			INT					PRIMARY KEY,
    DeletedUserDate			DATETIME			DEFAULT NULL,
    DeletedUserReason		TEXT
);

CREATE TABLE _Role(
	RoleID					INT					PRIMARY KEY AUTO_INCREMENT,
    RoleName				VARCHAR(40)			NOT NULL,		
    RoleColor				VARCHAR (7)			#Should be hexa
);

CREATE TABLE Post(
	PostID					INT					PRIMARY KEY AUTO_INCREMENT,
    PostUserID				INT					NOT NULL,
    PostBoxID				INT					NOT NULL,
	PostText				TEXT,
    PostDate				DATETIME			NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE _Comment(
	CommentID				INT 				PRIMARY KEY AUTO_INCREMENT,
    CommentPostID			INT					NOT NULL,
    CommentParentsID		INT,
    CommentUserID			INT					NOT NULL,
																										  
    CommentContent			TEXT,
    CommentDate				DATETIME			NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Image(
	ImageID					INT					PRIMARY KEY AUTO_INCREMENT,
    ImagePostID				INT,
    ImageCommentID			INT,				
    ImageContent			TEXT				NOT NULL,
	ImageDescription		TEXT
);

CREATE TABLE Box(
	BoxID					INT					PRIMARY KEY AUTO_INCREMENT,
    BoxName					VARCHAR(30)			NOT NULL,
    BoxAvatar				BLOB,
    BoxBanner				BLOB,
    BoxAdminID				INT					NOT NULL,
    BoxCreatedDate			DATETIME			NOT NULL DEFAULT CURRENT_TIMESTAMP
);


/* Brigde tables to ensure 2NF */

CREATE TABLE UserToRole(
	UserID					INT,
    RoleID					INT,
    PRIMARY KEY(UserID, RoleID)
);

CREATE TABLE BoxToUser(
    UserID					INT,
	BoxID					INT,
    PRIMARY KEY(BoxID, UserID)
);
    
    
/* Add Foreign keys */
ALTER TABLE OldName
	ADD FOREIGN KEY (OldNameUserID)		REFERENCES _User(UserID)			ON UPDATE CASCADE;

ALTER TABLE Violation
	ADD FOREIGN KEY (ViolationUserID) 	REFERENCES _User(UserID)			ON UPDATE CASCADE;
    
ALTER TABLE DeletedUser
	ADD FOREIGN KEY (DeletedUserID) 	REFERENCES _User(UserID)			ON UPDATE CASCADE;
    

ALTER TABLE Post
	ADD FOREIGN KEY (PostBoxID) 		REFERENCES Box(BoxID)				ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Post
	ADD FOREIGN KEY (PostUserID) 		REFERENCES _User(UserID)			ON UPDATE CASCADE;
    
ALTER TABLE Image
	ADD FOREIGN KEY (ImagePostID) 		REFERENCES Post(PostID)				ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Image
	ADD FOREIGN KEY (ImageCommentID) 	REFERENCES _Comment(CommentID)		ON UPDATE CASCADE ON DELETE CASCADE;
    
ALTER TABLE UserToRole
	ADD FOREIGN KEY (UserID) 			REFERENCES _User(UserID) 			ON UPDATE CASCADE;
ALTER TABLE UserToRole
    ADD FOREIGN KEY (RoleID) 			REFERENCES _Role(RoleID)			ON UPDATE CASCADE;
    

ALTER TABLE BoxToUser
	ADD FOREIGN KEY (UserID) 			REFERENCES _User(UserID) 			ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE BoxToUser
    ADD FOREIGN KEY (BoxID) 			REFERENCES Box(BoxID)				ON UPDATE CASCADE ON DELETE CASCADE;
    
ALTER TABLE _Comment
	ADD FOREIGN KEY (CommentParentsID)	REFERENCES _Comment(CommentID)		ON UPDATE CASCADE ON DELETE CASCADE;
    
ALTER TABLE _Comment
	ADD FOREIGN KEY (CommentUserID)		REFERENCES _User(UserID)			ON UPDATE CASCADE;
    
ALTER TABLE _Comment
	ADD FOREIGN KEY (CommentPostID) 	REFERENCES Post(PostID)				ON UPDATE CASCADE ON DELETE CASCADE;


    

    