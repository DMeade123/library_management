---create database
CREATE DATABASE library_management_system;

---create author table
CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

---Insert sample author data
INSERT INTO authors (name) VALUES ('Sarah J. Maas');
INSERT INTO authors (name) VALUES ('Ellen Hopkins');
INSERT INTO authors (name) VALUES ('Geneva Monroe');
INSERT INTO authors (name) VALUES ('Stephenie Meyer');
INSERT INTO authors (name) VALUES ('Rick Riordan');


---create books table
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    author_id INTEGER REFERENCES authors(id)
);

---insert sample data in books table
INSERT INTO books (title, author_id)
    VALUES ('A Court of Thornes and Roses', 1);
INSERT INTO books (title, author_id)
    VALUES ('A Court of Mist and Fury', 1);
INSERT INTO books (title, author_id)
    VALUES ('A Court of Wings and Ruin', 1);
INSERT INTO books (title, author_id)
    VALUES ('A Court of Frost and Starlight', 1);
INSERT INTO books (title, author_id)
    VALUES ('A Court of Silver Flames', 1);
INSERT INTO books (title, author_id)
    VALUES ('SMOKE', 2);
INSERT INTO books (title, author_id)
    VALUES ('BURNED', 2);
INSERT INTO books (title, author_id)
    VALUES ('TRAFFICK', 2);
INSERT INTO books (title, author_id)
    VALUES ('FALLOUT', 2);
INSERT INTO books (title, author_id)
    VALUES ('Sun Serpent', 3);
INSERT INTO books (title, author_id)
    VALUES ('Star Spear', 3);
INSERT INTO books (title, author_id)
    VALUES ('Silver Shard', 3);
INSERT INTO books (title, author_id)
    VALUES ('Twilight Saga: Twilight', 4);
INSERT INTO books (title, author_id)
    VALUES ('Twilight Saga: New Moon', 4);
INSERT INTO books (title, author_id)
    VALUES ('Twilight Saga: Eclipse', 4);
INSERT INTO books (title, author_id)
    VALUES ('Twilight Saga: Breaking Dawn', 4);
INSERT INTO books (title, author_id)
    VALUES ('Percy Jackson and The Olympians: The Lighting Thief', 5);
INSERT INTO books (title, author_id)
    VALUES ('Percy Jackson and The Olympians: The Sea of Monsters', 5);
INSERT INTO books (title, author_id)
    VALUES ('Percy Jackson and The Olympians: The Titans Curse', 5);
INSERT INTO books (title, author_id)
    VALUES ('Percy Jackson and The Olympians: The Battle of the Labyrinth', 5);
INSERT INTO books (title, author_id)
    VALUES ('Percy Jackson and The Olympians: The Last Olympian', 5);

---create members table
CREATE TABLE members (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    membership_date DATE
);

---insert sample data into members table
INSERT INTO members (first_name, last_name, membership_date)
    VALUES ('Donte', 'Meade', '2025-04-22');
INSERT INTO members (first_name, last_name, membership_date)
    VALUES ('Gabrielle', 'Meade', '2025-04-22');
INSERT INTO members (first_name, last_name, membership_date)
    VALUES ('Crystal', 'Meade', '2025-04-25');
INSERT INTO members (first_name, last_name, membership_date)
    VALUES ('Victor', 'Meade', '2025-04-25');

---create loans table
CREATE TABLE loans (
    id SERIAL PRIMARY KEY,
    members_id INTEGER REFERENCES members(id),
    books_id INTEGER REFERENCES books(id),
    borrow_date DATE,
    return_date DATE
);

---insert sample data into loans table
INSERT INTO loans (members_id, books_id, borrow_date, return_date)
    VALUES (3, 10, '2025-04-26', '2026-04-26');
INSERT INTO loans (members_id, books_id, borrow_date, return_date)
    VALUES (4, 19, '2025-04-26', '2026-04-26');
INSERT INTO loans (members_id, books_id, borrow_date, return_date)
    VALUES (1, 9, '2025-04-22', '2026-04-22');
INSERT INTO loans (members_id, books_id, borrow_date, return_date)
    VALUES (1, 5, '2025-04-23', '2026-04-23');
INSERT INTO loans (members_id, books_id, borrow_date, return_date)
    VALUES (2, 1, '2025-04-22', '2026-04-22');
INSERT INTO loans (members_id, books_id, borrow_date, return_date)
    VALUES (2, 21, '2025-04-24', '2026-04-24');

---Sample join to show books out on rent and potential return date
SELECT
    loans.id AS loan_id,
    members.first_name,
    members.last_name,
    members.membership_date,
    books.title AS book_title,
    authors.name AS author_name,
    loans.borrow_date,
    loans.return_date
FROM loans
JOIN members ON loans.members_id = members.id
JOIN books ON loans.books_id = books.id
JOIN authors ON books.author_id = authors.id;