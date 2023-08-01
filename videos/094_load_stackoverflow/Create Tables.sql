/*
Create the tables for each file to be imported
*/

DROP TABLE IF EXISTS badges;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS post_history;
DROP TABLE IF EXISTS post_links;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS votes;


CREATE TABLE badges (
  id INT,
  user_id INT,
  badge_name VARCHAR(500),
  badge_date DATETIME,
  class INT,
  tag_based VARCHAR(10)
);

CREATE TABLE comments (
	id INT,
    post_id INT,
    score INT,
    comment_text VARCHAR(4000),
    creation_date DATETIME,
    user_id INT,
    content_license VARCHAR(100)
    
);

CREATE TABLE post_history (
  id INT,
  post_history_type_id INT,
  post_id INT,
  revision_guid VARCHAR(100),
  creation_date DATETIME,
  user_id INT,
  post_text VARCHAR(10000),
  content_license VARCHAR(100)
);

CREATE TABLE post_links (
	id INT,
    creation_date DATETIME,
    post_id INT,
    related_post_id INT,
    link_type_id INT
);

CREATE TABLE posts (
	id INT,
    post_type_id INT,
    accepted_answer_id INT,
    parent_id INT,
    creation_date DATETIME,
    score INT,
    view_count INT,
    post_body VARCHAR(10000),
    owner_user_id INT,
    last_editor_user_id INT,
    last_edit_date DATETIME,
    last_activity_date DATETIME,
    post_title VARCHAR(500),
    tags VARCHAR(500),
    answer_count INT,
    comment_count INT,
    content_license VARCHAR(100)
);

CREATE TABLE tags (
	id INT,
    tag_name VARCHAR(100),
    tag_count INT,
    except_post_id INT,
    wiki_post_id INT
);

CREATE TABLE users (
	id INT,
    reputation INT,
    creation_date DATETIME,
    display_name VARCHAR(200),
    last_access_date DATETIME,
    website_url VARCHAR(1000),
    location VARCHAR(200),
    about_me VARCHAR(10000),
    views INT,
    upvotes INT,
    downvotes INT,
    account_id INT
);


CREATE TABLE votes (
	id INT,
    post_id INT,
    vote_type_id INT,
    creation_date DATETIME
);





