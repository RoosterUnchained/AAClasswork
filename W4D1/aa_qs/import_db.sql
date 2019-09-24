PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;




CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    author_id INTEGER NOT NULL,
    parent_reply_id INTEGER,
    body TEXT NOT NULL,


    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
    FOREIGN KEY (author_id) REFERENCES users(id)   
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),  
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO 
    users (fname, lname)
VALUES 
    ('Nemo', 'Ahab'),
    ('Mufasa', 'Majesty'),
    ('Quasimodo', 'Cooke'),
    ('Spongebob', 'Star'),
    ('Groot', 'Iam')
;

INSERT INTO 
    questions (title, body, author_id)
VALUES 
    ('Gorilla body-fat percentage?', 
    'What is the body-fat percentage of a silverback gorilla?, I''m wondering what''s natty acheivable; asking for a friend', 
    (SELECT users.id FROM users WHERE fname = 'Quasimodo' )),
    ('Stampeding herds don''t kill people, angry tyrannical lion dictators do, right?', 
    'Scar''s a murderer right?, the stampede was just doing it''s thing, right?',
    (SELECT users.id FROM users WHERE fname = 'Mufasa' )),
    ('How to model peanut plant growth?', 
    'How do I model peanut plant growth in large scale agriculture using ruby?', 
    (SELECT users.id FROM users WHERE fname = 'Groot' )),
    ('How do I model marine ecology concerning the predatory relationship of Sharks to Clownfish?', 
    'How do I model marine ecology concerning the predatory relationship of Hammerhead Sharks to Clownfish?', 
    (SELECT users.id FROM users WHERE fname = 'Nemo' )),
    ('Spongeystar customer satisfaction model?', 
    'How do I model customer satisfaction based on dinner orders at my new SpongeyStar restaurant?', 
    (SELECT users.id FROM users WHERE fname = 'Spongebob' ))
;

INSERT INTO
    question_follows (user_id, question_id)
VALUES
    (1, 4),
    (4, 4),
    (5, 4),
    (2, 1),
    (5, 3),
    (5, 1),
    (3, 2),
    (3, 1)
;

INSERT INTO 
  replies (question_id, author_id, parent_reply_id, body) 
VALUES 
    (1, 5, NULL, 'You need to focus on hard training and eating lots of peanuts, stop looking at gorilla and expecting the same results, Groot learn English same way he learn lifting, hard work'),
    (2, 3, NULL, 'Mufasa you are the lion! Scar didn''t deserve the crown. And yes, he murdered you, although the stampede was to blame too, talk about a herd mentality.'),
    (3, 4, NUll, 'My hubby Patrick has been working on statistical modelling for complex ecosystems lately, maybe he can help with the peanut farm too Groot'),
    (2, 1, 2, 'I hate cats, you guys eat fish, I hope both you AND Scar bite the DUST and I hope that another giant cat evolves to eat lions so you know the pain of fish >:('),
    (4, 4, NULL, 'Patrick is already helping you, I''m not sure what to say Nemo.'),
    (5, 1, NULL, 'Maybe if you wasted less time on your stupid restaurant Patrick would be able to finish my ecological modelling software >:('),
    (4, 1, 5, 'Maybe if you wasted less time on your stupid restaurant Patrick would be able to finish my ecological modelling software >:(')
;

INSERT INTO
    question_likes (user_id, question_id)
VALUES
    (1, 4),
    (4, 4),
    (5, 4),
    (2, 1),
    (5, 3),
    (5, 1),
    (3, 2),
    (3, 1)
;