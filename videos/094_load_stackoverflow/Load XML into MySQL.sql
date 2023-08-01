SHOW VARIABLES LIKE "secure_file_priv";

TRUNCATE badges;
TRUNCATE comments;
TRUNCATE post_history;
TRUNCATE post_links;
TRUNCATE posts;
TRUNCATE tags;
TRUNCATE users;
TRUNCATE votes;

LOAD XML
INFILE '/Users/BB/se_xml/Badges.xml'
INTO TABLE badges (
	@Id, @UserID, @Name, @Date, @Class, @TagBased
)
SET id = @Id,
user_id = @UserID,
badge_name = @Name,
badge_date = @Date,
class=@Class,
tag_based=@TagBased;


LOAD XML
INFILE '/Users/BB/se_xml/Comments.xml'
INTO TABLE comments (
	@Id, @PostId, @Score, @Text, 
    @CreationDate, @UserId, @ContentLicense
)
SET id = @Id, 
post_id = @PostId, 
score = @Score, 
comment_text = @Text, 
creation_date=@CreationDate, 
user_id=@UserId, 
content_license=@ContentLicense;


LOAD XML
INFILE '/Users/BB/se_xml/PostHistory.xml'
INTO TABLE post_history (
	@Id, @PostHistoryTypeId, @PostId, @RevisionGUID,
    @CreationDate, @UserId, @Text, @ContentLicense
)
SET id = @Id, 
post_history_type_id = @PostHistoryTypeId,
post_id = @PostId, 
revision_guid = @RevisionGUID,
creation_date = @CreationDate, 
user_id = @UserId, 
post_text = SUBSTRING(@Text, 1, 10000),
content_license=@ContentLicense;


LOAD XML
INFILE '/Users/BB/se_xml/PostLinks.xml'
INTO TABLE post_links (
	@Id, @CreationDate, @PostId, @RelatedPostId, @LinkTypeId
)
SET id = @Id, 
creation_date = @CreationDate, 
post_id = @PostId, 
related_post_id = @RelatedPostId,
link_type_id = @LinkTypeId;

TRUNCATE posts;

LOAD XML
INFILE '/Users/BB/se_xml/Posts.xml'
INTO TABLE posts (
	@Id, @PostTypeId, @CreationDate, @ParentID, @AcceptedAnswerId, 
	@Score, @ViewCount, @Body, @OwnerUserId, @LastEditorUserId,
    @LastEditDate, @LastActivityDate, @Title, @Tags, @AnswerCount,
    @CommentCount, @ContentLicense
)
SET id = @Id, 
post_type_id = @PostTypeId, 
creation_date = @CreationDate, 
parent_id = @ParentID,
accepted_answer_id = @AcceptedAnswerId,
score = @Score,
view_count = @ViewCount,
post_body = SUBSTRING(@Body, 1, 10000),
owner_user_id = @OwnerUserId,
last_editor_user_id = @LastEditorUserId,
last_edit_date = @LastEditDate,
last_activity_date = @LastActivityDate,
post_title = @Title,
tags = @Tags,
answer_count = @AnswerCount,
comment_count = @CommentCount,
content_license = @ContentLicense;


LOAD XML
INFILE '/Users/BB/se_xml/Tags.xml'
INTO TABLE tags (
	@Id, @TagName, @Count, @ExcerptPostId, @WikiPostId
)
SET id = @Id, 
tag_name = @TagName, 
tag_count = @Count, 
except_post_id = @ExcerptPostId,
wiki_post_id = @WikiPostId;


LOAD XML
INFILE '/Users/BB/se_xml/Users.xml'
INTO TABLE users (
	@Id, @Reputation, @CreationDate, @DisplayName, 
    @LastAccessDate, @WebsiteUrl, @Location, @AboutMe, 
    @Views, @UpVotes, @DownVotes, @AccountId
)
SET id = @Id, 
reputation = @Reputation, 
creation_date = @CreationDate, 
display_name = @DisplayName,
last_access_date = @LastAccessDate,
website_url = @WebsiteUrl,
location = @Location,
about_me = @AboutMe,
views = @Views,
upvotes = @UpVotes,
downvotes = @DownVotes,
account_id = @AccountId;



LOAD XML
INFILE '/Users/BB/se_xml/Votes.xml'
INTO TABLE votes (
	@Id, @PostId, @VoteTypeId, @CreationDate
)
SET id = @Id, 
post_id = @PostId, 
vote_type_id = @VoteTypeId, 
creation_date = @CreationDate;



SELECT * FROM badges;
SELECT * FROM comments;
SELECT * FROM post_history;
SELECT * FROM post_links;
SELECT * FROM posts;
SELECT * FROM tags;
SELECT * FROM users;
SELECT * FROM votes;
