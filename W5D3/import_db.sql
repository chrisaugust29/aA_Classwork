DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

PRAGMA foreign_keys = ON;

CREATE TABLE users(   
    id INTEGER PRIMARY KEY,
    fname TEXT,
    lname TEXT 
); 

CREATE TABLE questions(
    id INTEGER PRIMARY KEY,
    title TEXT,
    body TEXT, 
    author_id INTEGER, 
    FOREIGN KEY(author_id) REFERENCES users(id)
); 

CREATE TABLE question_follows(
    id INTEGER PRIMARY KEY, 
    user_id INTEGER, 
    question_id INTEGER,
    FOREIGN KEY(user_id)  REFERENCES users(id),
    FOREIGN KEY(question_id) REFERENCES questions(id) 

);

CREATE TABLE replies(
    id INTEGER PRIMARY KEY,
    body TEXT, 
    author_id INTEGER, 
    parent_id INTEGER,
    question_id INTEGER,
    FOREIGN KEY(author_id) REFERENCES users(id),
    FOREIGN KEY(question_id) REFERENCES questions(id),
    FOREIGN KEY(parent_id) REFERENCES replies(id)

);

CREATE TABLE question_likes(
    id INTEGER PRIMARY KEY,
    user_id INTEGER, 
    question_id INTEGER,
    FOREIGN KEY(user_id)  REFERENCES users(id),
    FOREIGN KEY(question_id) REFERENCES questions(id) 


);

INSERT INTO 
    users(fname,lname) 
VALUES 
    ('ali', 'ibsen'),  
    ('chris', 'low'),
    ('third','name');

INSERT INTO 
    questions(title, body, author_id)
VALUES
    ('First Question', 'This is question', 
    (SELECT id
    FROM users 
    WHERE users.fname = 'ali' AND users.lname = 'ibsen')
    );

INSERT INTO 
    questions(title, body, author_id)
VALUES
    ('Second Question', 'This is second question', 
    (SELECT id 
    FROM users 
    WHERE users.fname = 'chris' AND users.lname = 'low')
    );

INSERT INTO 
    questions(title, body, author_id)
VALUES
    ('Third Question', 'This is third question', 
    (SELECT id 
    FROM users 
    WHERE users.fname = 'third' AND users.lname = 'name')
    );

INSERT INTO 
    question_follows(user_id,question_id)
VALUES
    ((SELECT id 
    FROM users 
    WHERE users.fname = 'ali' AND users.lname = 'ibsen'
    ),
    (SELECT id
    FROM questions
    WHERE title = 'First Question'
    ));

INSERT INTO 
    replies (author_id, question_id, parent_id, body)
VALUES (

    (SELECT id 
    FROM users 
    WHERE users.fname = 'chris' AND users.lname = 'low'),

    (SELECT id
    FROM questions
    WHERE title = 'Second Question'),

    NULL,

    'this is body of reply'
    ); 

INSERT INTO 
    replies(author_id,question_id,parent_id,body)
VALUES
   ((SELECT id 
    FROM users 
    WHERE users.fname = 'chris' AND users.lname = 'low'
    ),
    (SELECT id
    FROM questions
    WHERE title = 'Second Question'
    ),
    (SELECT id
    FROM replies
    WHERE body = 'this is body of reply'),
    'this is reply of self reply'
    ); 

INSERT INTO 
    question_likes(user_id, question_id)
VALUES
     ((SELECT id 
    FROM users 
    WHERE users.fname = 'chris' AND users.lname = 'low'
    ),
    (SELECT id
    FROM questions
    WHERE title = 'Second Question'
    ));
    
