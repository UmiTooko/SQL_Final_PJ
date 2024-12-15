USE abc;
SHOW TABLES;

INSERT INTO _User(
	UserDisplayName		,
    UserFirstName 		,	
    UserLastName		,
    UserBirth			,
    UserGender			,
    UserCountry			,
    UserAboutMe			,
    UserAvatar			,
    UserBanner			,
    UserCreatedDate
    )
VALUE(
	"Umi-chan", 
	NULL,
    NULL,
    '2002-09-01',
    'F',
    'Vietnam',
    'I like cha-han so much wwwwwww',
    'https://imgur.com/btCDPi2',
    'https://imgur.com/f6Oqytv',
    '2014-11-09'
),(
	"UmiTooko", 
	'Ngac Anh',
    'Kiet',
    '2003-03-31',
    'M',
    'Vietnam',
    'Killin myself',
    'https://imgur.com/omwAp6h',
    'https://imgur.com/f6Oqytv',
    '2011-10-20'
),(
	'Nahiu',
    'Na',
    'Hieu',
    '2005-05-05',
    'M',
	'Vietnam',
    'fumo',
    'https://imgur.com/omwAp6h',
    NULL,
    '2011-10-20'
),(
	'Sigma',
    'Sig',
    'ma',
    '2002-10-31',
    'F',
	'Vietnam',
    'S I G M A :fire:',
    NULL,
    NULL,
    '2018-10-20'
),(
	'Explota',
    'Hx',
    'Truong',
    '2003-01-01',
    'M',
	'Vietnam',
    'I feel so sigma',
    NULL,
    NULL,
    '2019-10-20'
),(
	'Cnuy De Thanh',
    'CUN',
    'NYYYYYYYYYY',
    '2002-12-12',
    'F',
    'China',
    'If her age is on the clock',
    NULL,
    'https://imgur.com/ekWOZkc',
    '2001-04-21'
);

INSERT INTO _Role(
    RoleName		,			
    RoleColor			
)
VALUE(
	'SuperAdmin',
    'ff1e3d'
),(
	'Moderator',
    'fd831e'
),(
	'Staff',
    'ffcb09'
),(
	'Senior',
    '1d9cff'
),(
	'Junior',
    '0fff0f'
),(
	'Walk-in',
    'bd90e5'
),(
	'Ninja',
	'8c8c8c'
),(
	'Đeadge',
    'FFFFFF'
);

INSERT INTO UserToRole(
	UserID, 
    RoleID
) VALUE(
	1,1
),(
	2,3
),(
	1,4
),(
	2,2
),(
	5,4
),(
	6,4
);

INSERT INTO Box(
	BoxName,
    BoxAvatar,
    BoxBanner,
    BoxAdminID,
    BoxCreatedDate
) VALUE (
	'TheGuys',
    NULL,
    NULL,
    3,
    '2009-09-12'
),(
	'TokaiFC',
    NULL,
    NULL,
    1,
    '2019-01-01'
),(
	'uwuoowooooh',
    NULL,
    NULL,
    6,
    '2015-12-09'
);

INSERT INTO BoxToUser(
	UserID,
    BoxID
) VALUE (
	1,1
),(
	3,1
),(
	3,2
),(
	4,2
),(
	6,3
);

INSERT INTO Post(
    PostUserID		,	
    PostBoxID		,	
	PostText		,		
    PostDate	
)
VALUE(
	3,
    2,
    'Exploring new ideas and sharing thoughts. Today, I reflected on the importance of creativity in our daily lives. It’s amazing how a small spark of inspiration can lead to big changes in perspective.',
	'2021-04-22'
),(
	2,
    1,
    'Reflections on life and its journey. Life has its ups and downs, but each moment teaches us something valuable. I’m grateful for the lessons and the growth they bring.',
	'2011-10-21'
 ),(
	2,
    3,
    'A memorable moment worth documenting. Today was one of those days that remind me of the beauty of small joys—a kind smile, a warm cup of coffee, and a meaningful conversation.',
	'2012-02-24'
),(
	5,
    2,
    'A day to be grateful and share positivity. As I look around, I’m reminded of the kindness and resilience of people. It inspires me to pay it forward and make a difference.',
	'2020-10-11'
),(
	1,
    2,
    'Looking back at the lessons from 2020. It was a challenging year for many, but it also showed us the strength we hold within. I’m carrying forward these lessons into a brighter future.',
    '2020-2-2'
),(
	6,
    2,
    'Cherishing achievements of May 2023. This month has been a journey of hard work and success. I’m proud of the milestones reached and excited for the adventures ahead.',
    '2023-05-30'
),(
	6,
    2,
	'New beginnings with the start of 2021. Every new year brings hope and opportunities. I’m setting goals and looking forward to making meaningful memories.',
	'2021-01-02'
),(
	1,
    1,
    'Fresh perspectives in February 2023. It’s a time to realign with my aspirations and focus on personal growth. Grateful for the support and inspiration around me.'
    '2023-02-02'
);

INSERT INTO Violation(
	ViolationUserID,
    ViolationLevel,
    ViolationNote,
    ViolationDate
) VALUES (
	6,
    1,
    "SPAM",
    NOW()
),(
	5,
    3,
    "racist",
    '2021-01-01'
);

INSERT INTO _Comment(
    CommentPostID,
    CommentUserID,
    CommentParentsID,
    CommentContent,
    CommentDate
) VALUES
(
	3,
    1,
    NULL,
    "Thank you for this insightful post!",
    '2015-12-01'
),
(
	4,
    4,
    1,
    "This made me laugh out loud, great post!",
    '2022-11-21'
),
(
	1,
    2,
    NULL,
    "This is such an interesting perspective, thank you for sharing!",
    '2024-09-11'
),
(
	3,
    3,
    NULL,
    'Let’s keep the discussion respectful and constructive.',
    '2013-06-19'
),
(
	7,
    2,
    NULL,
    'This really resonates with me, thank you!',
    '2021-11-11'
),
(
	6,
    1,
    NULL,
    'I appreciate your insights, they are truly valuable.',
    '2024-02-21'
),
(
	7,
    2,
    5,
    "Following up to keep the conversation going!",
    '2021-11-12'
);


INSERT INTO Image(
    ImagePostID,
    ImageCommentID,
    ImageContent,
	ImageDescription
) VALUES(
	1,
    NULL,
    "https://imgur.com/zu9YjQT",
    "Nah"
),(
	2,
    NULL,
    "https://imgur.com/btCDPi2",
    "Custom Pipidon"
),(
	NULL,
    3,
    "https://imgur.com/ABNow3v",
    NULL
),(
	5,
    NULL,
    "https://imgur.com/tPLjitp",
    NULL
);

COMMIT;