CREATE DATABASE library_db;
USE library_db;

CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    total_copies INT
);

CREATE TABLE members (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE borrows (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    member_id INT,
    borrow_date DATE,
    due_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (member_id) REFERENCES members(id)
);

INSERT INTO books (title, author, total_copies) VALUES
('Python Basics', 'John Doe', 5),
('C# Guide', 'Jane Smith', 3),
('MySQL Mastery', 'David Lee', 4),
('Data Science', 'Andrew Ng', 2);

INSERT INTO members (name, email) VALUES
('Afsar', 'afsar@gmail.com'),
('Rahul', 'rahul@gmail.com'),
('Kumar', 'kumar@gmail.com');

INSERT INTO borrows (book_id, member_id, borrow_date, due_date, return_date) VALUES
(1, 1, '2026-04-01', '2026-04-10', NULL),
(2, 2, '2026-04-02', '2026-04-12', '2026-04-05'),
(3, 1, '2026-04-03', '2026-04-15', NULL),
(1, 3, '2026-04-01', '2026-04-07', NULL),
(4, 2, '2026-04-01', '2026-04-05', NULL),
(2, 1, '2026-04-01', '2026-04-08', '2026-04-06');

SELECT b.title, m.name
FROM borrows br
JOIN books b ON br.book_id = b.id
JOIN members m ON br.member_id = m.id
WHERE br.return_date IS NULL;

SELECT b.title
FROM borrows br
JOIN books b ON br.book_id = b.id
JOIN members m ON br.member_id = m.id
WHERE m.name = 'Afsar';

SELECT b.title, COUNT(*) AS borrow_count
FROM borrows br
JOIN books b ON br.book_id = b.id
GROUP BY b.title
ORDER BY borrow_count DESC
LIMIT 1;

SELECT m.name, COUNT(*) AS active_borrows
FROM borrows br
JOIN members m ON br.member_id = m.id
WHERE br.return_date IS NULL
GROUP BY m.name;

SELECT b.title, m.name, br.due_date
FROM borrows br
JOIN books b ON br.book_id = b.id
JOIN members m ON br.member_id = m.id
WHERE br.return_date IS NULL
AND br.due_date < CURDATE();