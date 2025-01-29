USE sql_portfolio_project;
CREATE TABLE badges (
    id INT PRIMARY KEY,
    user_id INT,
    name VARCHAR(255),
    date DATE
);

INSERT INTO badges (id, user_id, name, date) VALUES
(1, 1001, 'Gold Contributor', '2024-01-01'),
(2, 1002, 'Silver Helper', '2024-01-05'),
(3, 1003, 'Bronze Reviewer', '2024-02-10'),
(4, 1001, 'Silver Helper', '2024-03-15'),
(5, 1004, 'Gold Contributor', '2024-04-20'),
(6, 1001, 'Gold Contributor', '2024-05-05'),
(7, 1002, 'Bronze Reviewer', '2024-06-10'),
(8, 1003, 'Silver Helper', '2024-07-10'),
(9, 1004, 'Gold Contributor', '2024-08-01'),
(10, 1001, 'Bronze Reviewer', '2024-09-01');


CREATE TABLE comments (
    id INT PRIMARY KEY,
    post_id INT,
    user_id INT,
    creation_date DATE,
    text TEXT
);

INSERT INTO comments (id, post_id, user_id, creation_date, text) VALUES
(1, 2001, 1001, '2024-01-01', 'Great explanation!'),
(2, 2002, 1002, '2024-01-05', 'This helped a lot.'),
(3, 2003, 1003, '2024-01-10', 'Can you clarify?'),
(4, 2004, 1001, '2024-01-15', 'Excellent resource.'),
(5, 2005, 1004, '2024-01-20', 'Thank you for sharing.'),
(6, 2001, 1002, '2024-01-25', 'I agree, very useful.'),
(7, 2003, 1003, '2024-02-01', 'This solved my issue.'),
(8, 2004, 1001, '2024-02-05', 'Thanks for the info.'),
(9, 2005, 1004, '2024-02-10', 'Could use more detail.'),
(10, 2006, 1002, '2024-02-15', 'Good job on this one!');


CREATE TABLE post_history (
    id INT PRIMARY KEY,
    post_history_type_id INT,
    post_id INT,
    user_id INT,
    text TEXT,
    creation_date DATE
);

INSERT INTO post_history (id, post_history_type_id, post_id, user_id, text, creation_date) VALUES
(1, 1, 2001, 1001, 'Initial post creation', '2024-01-01'),
(2, 2, 2002, 1002, 'Edited post for clarity', '2024-01-05'),
(3, 3, 2003, 1003, 'Comment added by moderator', '2024-01-10'),
(4, 1, 2004, 1001, 'First version of the post', '2024-01-15'),
(5, 2, 2005, 1004, 'Reworded answer', '2024-01-20'),
(6, 3, 2001, 1002, 'User updated answer with additional info', '2024-01-25'),
(7, 1, 2003, 1003, 'Post originally created', '2024-02-01'),
(8, 3, 2004, 1001, 'Moderators edited content', '2024-02-05'),
(9, 2, 2005, 1004, 'User revised explanation', '2024-02-10'),
(10, 3, 2006, 1002, 'Moderators flagged inappropriate content', '2024-02-15');


CREATE TABLE post_links (
    id INT PRIMARY KEY,
    post_id INT,
    related_post_id INT,
    link_type_id INT
);

INSERT INTO post_links (id, post_id, related_post_id, link_type_id) VALUES
(1, 2001, 2002, 1),
(2, 2002, 2003, 2),
(3, 2003, 2004, 1),
(4, 2004, 2005, 3),
(5, 2005, 2006, 2),
(6, 2001, 2004, 3),
(7, 2002, 2006, 1),
(8, 2003, 2005, 2),
(9, 2004, 2006, 3),
(10, 2005, 2001, 2);


CREATE TABLE posts_answers (
    id INT PRIMARY KEY,
    post_type_id INT,
    creation_date DATE,
    score INT,
    view_count INT,
    owner_user_id INT
);

INSERT INTO posts_answers (id, post_type_id, creation_date, score, view_count, owner_user_id) VALUES
(1, 1, '2024-01-01', 10, 100, 1001),
(2, 2, '2024-01-05', 20, 150, 1002),
(3, 1, '2024-01-10', 5, 50, 1003),
(4, 2, '2024-01-15', 15, 120, 1001),
(5, 1, '2024-01-20', 30, 200, 1004),
(6, 2, '2024-01-25', 25, 180, 1002),
(7, 1, '2024-02-01', 40, 300, 1003),
(8, 2, '2024-02-05', 10, 80, 1001),
(9, 1, '2024-02-10', 8, 90, 1004),
(10, 2, '2024-02-15', 50, 400, 1002);

CREATE TABLE tags (
    id INT PRIMARY KEY,
    tag_name VARCHAR(255)
);

INSERT INTO tags (id, tag_name) VALUES
(1, 'SQL'),
(2, 'JavaScript'),
(3, 'React'),
(4, 'Python'),
(5, 'AI'),
(6, 'Machine Learning'),
(7, 'Node.js'),
(8, 'CSS'),
(9, 'HTML'),
(10, 'Database');


CREATE TABLE users (
    id INT PRIMARY KEY,
    display_name VARCHAR(255),
    reputation INT,
    creation_date DATE
);

INSERT INTO users (id, display_name, reputation, creation_date) VALUES
(1001, 'Alice', 1500, '2024-01-01'),
(1002, 'Bob', 1200, '2024-01-05'),
(1003, 'Charlie', 800, '2024-01-10'),
(1004, 'Dave', 1800, '2024-01-15'),
(1005, 'Eve', 1000, '2024-01-20'),
(1006, 'Frank', 2000, '2024-01-25'),
(1007, 'Grace', 1300, '2024-02-01'),
(1008, 'Hank', 1100, '2024-02-05'),
(1009, 'Ivy', 900, '2024-02-10'),
(1010, 'Jack', 1600, '2024-02-15');


CREATE TABLE votes (
    id INT PRIMARY KEY,
    post_id INT,
    vote_type_id INT,
    creation_date DATE
);

INSERT INTO votes (id, post_id, vote_type_id, creation_date) VALUES
(1, 2001, 1, '2024-01-01'),
(2, 2002, 2, '2024-01-05'),
(3, 2003, 1, '2024-01-10'),
(4, 2004, 2, '2024-01-15'),
(5, 2005, 1, '2024-01-20'),
(6, 2001, 2, '2024-01-25'),
(7, 2003, 1, '2024-02-01'),
(8, 2004, 2, '2024-02-05'),
(9, 2005, 1, '2024-02-10'),
(10, 2006, 2, '2024-02-15');


CREATE TABLE posts (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    post_type_id INT,
    creation_date DATE,
    score INT,
    view_count INT,
    owner_user_id INT
);

INSERT INTO posts (id, title, post_type_id, creation_date, score, view_count, owner_user_id)
VALUES
(2001, 'How to solve SQL JOIN issues?', 1, '2023-01-01', 10, 100, 1),
(2002, 'Best practices for writing SQL queries', 2, '2023-01-02', 15, 150, 2),
(2003, 'Understanding INNER JOIN in SQL', 1, '2023-01-03', 20, 200, 3),
(2004, 'What is a LEFT JOIN?', 2, '2023-01-04', 25, 250, 4),
(2005, 'Database indexing techniques', 1, '2023-01-05', 30, 300, 5),
(2006, 'Explaining SQL subqueries', 2, '2023-01-06', 35, 350, 6),
(2007, 'How to optimize SQL queries?', 1, '2023-01-07', 40, 400, 7),
(2008, 'Database normalization concepts', 2, '2023-01-08', 45, 450, 8),
(2009, 'SQL Aggregate Functions explained', 1, '2023-01-09', 50, 500, 9),
(2010, 'Introduction to SQL Window Functions', 2, '2023-01-10', 55, 550, 10);


-- Part 1
-- 1. Loading and Exploring Data
select * from badges;
select * from comments;
select * from post_history;
select * from post_links;
select * from posts;
select * from posts_answers;
select * from tags;
select * from users;
select * from votes;

-- 2. Filtering and Sorting

select * from posts where view_count >100;

select creation_date,  year(creation_date) from comments where  year(creation_date)=2005;

-- 3. Simple Aggregations
select * from badges;
select count(id) from badges;

select * from posts_answers;
select post_type_id, avg(score) from posts_answers group by post_type_id;
-- ------------------------------------------------------------------------------------------------------------------------
-- Part 2
-- 1. Basic Joins
select * from post_history;
select ph.id, ph.post_id, p.title , ph.text, ph.creation_date from post_history ph join posts p on p.id= ph.post_id order by post_id;

select * from users;
select b.user_id, u.display_name ,group_concat(b.name)  from badges b  join users u on b.user_id=u.id group by b.user_id;

-- 2. Multi-Table Joins
select * from comments;
select * from users;
select u.display_name, p.title, c.text from users u join comments c on c.user_id= u.id join posts p on c.post_id = p.id
order by display_name;

select * from post_links;	
select * from posts;

select * from posts p left join post_links pl on p.id=pl.post_id;
-- couldn't find questions in post answers, assuming that post_links contains links to related posts
select p.id, pl.related_post_id, p.title from post_links pl left join posts p on pl.related_post_id=p.id; 
select * from post_history;


select * from users;
select * from comments;
select * from badges;
-- comments separated by , and badges separated by ,
select u.display_name, u.id, group_concat(distinct c.text) as comments, group_concat(distinct b.name)
 as badges from users u left join comments c on u.id=c.user_id join badges b on 
u.id=b.user_id group by u.id;


-- ----------------------------------------------------------------------------------------------------------------------------

-- Part 3: Subqueries

-- 1. Single-Row Subqueries
select * from users;
select * from users where reputation = (select max(reputation) from users);

select * from posts where score in
(select max(score) from posts group by post_type_id);

-- 2. Correlated Subqueries
select title, p.id, t.related_posts from posts p,
(select post_id, count(related_post_id) as related_posts from post_links  group by post_id) t  where p.id = t.post_id;

-- -------------------------------------------------------------------------------------------------------------------
-- Part 4: Common Table Expressions (CTEs)
-- 1. Non-Recursive CTE

select * from users;

select * from posts;

select * from users;
select * from post_history ph join posts p on ph.post_id=p.id;


-- i am not getting avg =>50 so I will assume lesser avg
select * from users;

with score as (
select user_id, count(post_id) as posts, avg(score) as avg
from post_history ph join posts p on ph.post_id=p.id 
group by user_id)
 
 select s.user_id, u.display_name, s.posts, s.avg, dense_rank() over(order by avg, posts desc)
 from score s join users u on u.id=s.user_id having avg>10;
 
--  2. Recursive CTE


select * from post_links;
with recursive cte(post_id, related_post_id, link_type_id, level)
as
(select post_id, related_post_id, link_type_id, 1 as level from post_links
where post_id = 2001
union all
select pl.post_id, pl.related_post_id, pl.link_type_id, cte.level+1 from post_links pl
join cte on pl.post_id = cte.related_post_id
where cte.level<10
)
select * from cte;
-- -------------------------------------------------------------------------------------------

-- Part 5: Advanced Queries
-- 1. Window Functions
select * from posts;
select *, rank() over( partition by year(creation_date) order by 
	score desc)  from posts;
select *, rank() over( partition by post_type_id order by 
	score desc)  from posts;
    
select user_id, date, name, count((name)) over (partition by user_id order by id) from badges;

-- ● Which users have contributed the most in terms of comments, edits, and votes?
select * from users;
select * from comments;

-- In terms of comments 
-- Alice and Bob have contributed the most 

-- User     comments
-- Alice	3
-- Bob	    3
-- Charlie	2
-- Dave	    2
select u.display_name, count(c.id) as comments
from users u join comments c on u.id=c.user_id group by c.user_id;

-- In terms of votes
-- 6	1001	Alice
-- 4	1002	Bob
-- 4	1003	Charlie
-- 4	1004	Dave
select * from post_history;
select  count(v.vote_type_id) as votes, ph.user_id, u.display_name
 from votes v left join post	_history ph on
v.post_id = ph.post_id join users u on ph.user_id=u.id group by ph.user_id, u.display_name
order by votes desc;

-- In terms of edits
select count(ph.id) as edits, ph.user_id, u.display_name from post_history ph join
users u on ph.user_id=u.id group by ph.user_id;
-- edits_made uid name
-- 3	1001	Alice
-- 3	1002	Bob
-- 2	1003	Charlie
-- 2	1004	Dave

select count(id), name from badges group by name;
-- most common is to get a gold contributor
-- 4	Gold Contributor
-- 3	Silver Helper
-- 3	Bronze Reviewer

select count(b.id) as badges_received, b.user_id, group_concat(b.name), display_name from badges b join
users u on b.user_id= u.id
 group by b.user_id;
-- 4	1001	Gold Contributor,Silver Helper,Gold Contributor,Bronze Reviewer	Alice
-- 2	1002	Silver Helper,Bronze Reviewer	Bob
-- 2	1003	Bronze Reviewer,Silver Helper	Charlie
-- 2	1004	Gold Contributor,Gold Contributor	Dave
 
 SELECT 
    p.id,
    p.title,
    t.id,
    t.tag_name,
    p.score
FROM 
    posts p
JOIN 
    tags t
ON 
    (p.title) LIKE CONCAT('%', (t.tag_name), '%')
    order by score desc limit 5;
    
    
-- id   title                                    id   tag_associated score
-- 2010	Introduction to SQL Window Functions	 1	 SQL	        55
-- 2009	SQL Aggregate Functions explained	     1	 SQL	        50
-- 2009	SQL Aggregate Functions explained	     5	 AI	            50
-- 2008	Database normalization concepts	         10	 Database	    45
-- 2007	How to optimize SQL queries?	         1	 SQL	        40

-- How often are related questions linked, and what does this say about knowledge
-- sharing?

-- This tells us that posts are equally being linked. Because the data is limited we 
-- will need to perform further analysis


select title, p.id, t.related_posts from posts p,
(select post_id, count(related_post_id) as related_posts from post_links  group by post_id) t  where p.id = t.post_id;
