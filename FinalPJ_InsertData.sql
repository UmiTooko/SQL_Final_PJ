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
    'Killing myself',
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
    'If her age is on the clock...',
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
    'I can''t fucking take it anymore. This pokemon needs to be fucking gone. EVERY GOD FORSAKEN GAME HAS ZAMAZENTA. Out of your 6 pokemon, you need like 3 dudes just to beat one dog. It''s too bulky to be killed by most special moves, even some that are super-effective, and its blistering speed allows it to get Iron Defenses so fast your head will spin. preventing any physical attacker from KOing it. This doesn''t even address the fact that its uninvested attack stat allows it to bypass should-be counters with coverage. There''s such a small selection of things that actually beat it one on one that it''s so goddamn frustrating.\nHow is it that all the ban conversations I hear are about Darkrai, Kyurem, and Raging Bolt when all of these pokemon straight up lose to this dumb dog? "Oh, Kyurem runs a mixed coverage set that has loaded dice, icicle spear, and scale shot, that''s the real problem!\" Those pokemon at least have counter-play. I''d rather play against Unaware Dozo Clod Clef stall every matchup than play against one more drooling ladder player with that dumb Iron defense set where I have to guess if it has Heavy Slam to beat my Fairy type, Crunch to beat my ghost, or fucking Stone Edge to beat my Moltres. This all ignores the fact that no pokemon abuses Tera half as well as this obese bitch. Oh, how quaint, your Valiant outspeeds and has super effective moonblast? Tera Fire Iron Defense go brrrrrrrr. Don''t even get me started on those Life Orb attacker sets that have been popping up.\nIt''s enabled the most obnoxious, low IQ teambuilding. Now every damn team is Zama + Glowking + Twave spam. How is one team style running the meta healthy? How is it that Stall sucks? Why I am I running into niche pokemon picks that are chosen just to beat one pokemon, and how come it''s never enough? Did everyone forget how boring Gen 8 was? Are we all content to go back to that, where the fat legendary comes in and wins you the game?\nEveryday we stray further from Arceus and the beloved Son he sacrificed ''pon the cross, and when the day of reckoning comes, we will all deserve the damnation he will bring upon us. Do you think the creator of everything is happy when he looks at OU and sees that they unbanned this stupid boxart so that everyone can click Iron Defense in unison? Thou shalt not worship false swipe idols.\nZamzenta needs a suspect yesterday. If I''m wrong and the people choose to keep his dumbass in, fine, whatever, but there at least needs to be a vote. This isn''t healthy or fun. It''s macabre, sick, twisted, and perverse. If there''s any justice in this world, the Holy Smogon council will take swift action against this monster, and we''ll be better off for it.',
	'2021-04-22'
),(
	2,
    1,
    '‼️‼️HOLY FUCKING SHIT‼️‼️‼️‼️ IS THAT A MOTHERFUCKING JOJO REFERENCE??????!!!!!!!!!!11!1!1!1!1!1!1! 😱😱😱😱😱😱😱 JOJO IS THE BEST FUCKING ANIME 🔥🔥🔥🔥💯💯💯💯 JOSUKE IS SO BADASSSSS 😎😎😎😎😎😎😎👊👊👊👊👊 ORAORAORAORAORALORAORAORAORAORAORAORAORAORAORAORAORAORAORAORA 😩😩😩😩😩😩😩😩 😩😩😩😩 MUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDAMUDA 🤬😡🤬😡🤬😡🤬🤬😡🤬🤬😡WRYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY Yo Angelo!Yo Angelo!🗿 🗿 Yo Angelo!🗿 🗿 Yo Angelo! Yo Angelo!🗿 Yo Angelo! 🗿 Yo Angelo!🗿 🗿 Yo Angelo! 🗿 🗿 🗿 🗿 🗿 🗿 Yo Angelo!Yo Angelo!Yo Angelo! Yo Angelo!Yo Angelo!Yo Angelo! Yo Angelo!🗿 Yo Angelo! 🗿 Yo Angelo!Yo Angelo!🗿 🗿 Yo Angelo! 🗿 🗿 🗿 🗿 🗿 🗿 Yo Angelo! 🗿 Yo Angelo! 🗿 Yo Angelo!🗿 🗿 🗿 🗿 Yo Angelo! 🗿 🗿 Yo Angelo!🗿 Yo Angelo! 🗿 🗿 Yo Angelo!🗿 🗿 Yo Angelo! 🗿 Yo Angelo!Yo Angelo! 🗿 🗿 🗿 🗿 🗿 🗿 🗿 Yo Angelo!🗿 🗿 🗿 Yo Angelo!🗿 🗿 🗿 🗿 Yo Angelo! 🗿 Yo Angelo! Yo Angelo!Yo Angelo!Yo Angelo! Yo Angelo! 🗿 🗿 🗿 🗿 🗿 🗿 Oh you’re approaching me❓❓❓❓❓❓❓❓❓❓But it was me, Dio‼️‼️‼️‼️‼️‼️‼️‼️‼️‼️😂🤣😂🤣😂🤣😂😂😂🤣🤣🤣😂😂😂',
	'2011-10-21'
 ),(
	2,
    3,
    'I want to plug Rapi day in and day out. Forget every other woman in this game, she''s the best one by far. I love everything about Rapi and would do anything to make her happy. I haven''t seen Evangelion so I can''t say anything about the suit but I need to peel it off. I''m taking her straight to bed and claiming her. We''re going to be connected 24/7 and nothing is stopping us. I need to see Rapi bent over and how that suit hugs her curves. Does she sweat under that? Can I collect it? Did she shower? I need Rapi. ',
	'2012-02-24'
),(
	5,
    2,
    'Project moon has ruined me. Everywhere I go, I hear coin tosses and dice rolls. It can''t be stopped. I often snap my fingers to calm myself, I go shopping and I find a piano named Roland. I pass through a library and immediately think about Ruina. I can’t go to an office without thinking about full-stop office, I finally get to work and they installed Kali linux on every single computer and I can''t stop myself saying "HAHA MANAGER ESQUIRE, THIS IS THIS !" I look for clothes to have a new (todays) look, but hold on- is this made of nuovo fabric- oh no... I can’t greet people nowadays. Hello? Goodbye. I go to Mcdonalds (local HamHamPangPang) to wellcheer myself up, but while browsing through my phone watching Fullmetal Alchemist, they show the tree of life! And I can’t even play Persona without going into mementos and thinking oh this areas are based off the qliphoth tree. The entire Final Fantasy franchise is ruined for me, Sephiroth? One winged Angela?? Yesterday I was playing “im on observation duty”, and you have to watch out for Anomalies. Don’t they mean Abnormalities??? I can’t learn(2) any language because when it comes to numbers, there will always be a point where I will be reminded of an association or a sinner, I can’t enjoy nature without thinking about Dongbaek’s EGO, these flowers(hana) sure are nice, but wait is that a Hornet? Animals are banned, especially the ones that start with R. I can’t play other gachas besides limbus, I went to play Honkai and I saw there was a Kafka banner, so I logged off and went to Arknights, waiting as my assistant was.. you guessed it, Kafka, so I made the daring decision to go to the base and OH MY AYIN THEY HAVE A CONTROL DEPARTMENT, so I quickly went to change my agents, I mean operators and there he was, Mr Nothing. The phrase Nothing there triggers me like a lobotomized Agent so I shut down my phone. I went to play Devil May Cry, but couldn’t get past the introduction. I can’t see legs without thinking of blue star. I can’t write without thinking wow I’m making a key page! I can’t read to-do lists, but I also can’t read in general. I can’t think about myself because that would make me an egoist. I also can’t watch blue lock now that I think about it.. Colors are banned, but also black and white because that would be similar to T corp. so I have to just close both eyes (Angela reference?), and embrace the fear, and break the cycle. I can’t watch Ishmael porn anymore because if something is CENSORED I have a panic attack, cardiac arrest? More like Fervent Beats. I must E-endure… MY OWN BRAIN PRODUCES ENKEPHALIN ghghgh gigigig I only wanted peace, but after listening to the voices this City better Brace Up, for today a star shall rise ',
	'2020-10-11'
),(
	1,
    2,
    'SO SIGMA SO SIGMA SO SIGMA SO SIGMA SO SIGMA SO SIGMA SO SIGMA SO SIGMA SO SIGMA SO SIGMA SO SIGMA SO SIGMA SO SIGMA SO SIGMA SO SIGMA SO SIGMA SO SIGMA SO SIGMA!!',
    '2020-2-2'
),(
	6,
    2,
    'This is Mavuika ❤️‍🔥Pyro Queen 👸 370 Base Atk 🌩🤺 250% crit damage 🏋‍♂️ extra 40% crit rate from Codex 🎖Best Pyro on fielder 🌶 Best Pyro off fielder 👹 Buff team damage 🕶 buff more with cinder 🥋 No ICD 🤹‍♀️ exploration God 🏍 can retire Xiangling 👩‍🍳 AAAAAAAAAAAAAAA',
    '2023-05-30'
),(
	6,
    2,
    'I''ve become so much like Aqua Hoshino, it''s scary. I don''t have any friends and talk quietly. I can''t connect on an emotional level to anyone and I''m distant even with my own family. When people gather in large groups, I''m the one sitting alone in the corner. I worry about my sister too much and would sacrifice myself for her in a heartbeat. I have blonde hair, wear blue clothes and sometimes a black hoodie. I can''t help but smile whenever I see Kana. She is the light of my world. I am immediately interested in a video when I see it mention Kana. I''m bad with modern technology, like touchscreens, and say ''cheese'' when I''m photographing someone. Sometimes I even stretch my hand up to the sky and say "The boundary between ''me'' and ''Hoshino Aqua'' is steadily vanishing.',
	'2021-01-02'
),(
	1,
    1,
    "I love cha-han",
    "2023-02-02"
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
    CommentContent	,
    CommentDate
) VALUES(
	3,
    1,
    NULL,
    "Ok I see",
    '2015-12-01'
),(
	4,
    4,
    1,
    "Lmao!",
    '2022-11-21'
),
(
	1,
    2,
    NULL,
    "ẺUHƯLFHQLIÈUHQƯLI ÙHQƯLÌUQƯNLF ỊQƯLÌUQLFQHBLQBE",
    '2024-09-11'
),(
	3,
    3,
    NULL,
    'ĐỪNG',
    '2013-06-19'
),(
	7,
    2,
    NULL,
    'hazuhazu desuu',
    '2021-11-11'
),(
	6,
    1,
    NULL,
    'Cảm ơn chia sẻ của bạn nhé',
    '2024-02-21'
),(
	7,
    2,
    5,
    "bump by myself haha",
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
    "d"
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