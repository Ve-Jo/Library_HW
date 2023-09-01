-- 1:
SELECT
    t.first_name AS teacher_first_name,
    t.last_name AS teacher_last_name,
    b.name AS book_name
FROM
    Teacher t
JOIN
    T_Cards tc ON t.id = tc.id_teacher
JOIN
    Book b ON tc.id_book = b.id;

-- 2:
SELECT
    s.first_name AS student_first_name,
    s.last_name AS student_last_name
FROM
    Student s
JOIN
    S_Cards sc ON s.id = sc.id_student
WHERE
    sc.date_in IS NULL;

-- 3:
SELECT
    s.first_name AS student_first_name,
    s.last_name AS student_last_name
FROM
    Student s
LEFT JOIN
    S_Cards sc ON s.id = sc.id_student
WHERE
    sc.id IS NULL;

-- 4:
SELECT
    l.id AS librarian_id,
    l.first_name AS librarian_first_name,
    l.last_name AS librarian_last_name,
    COUNT(sc.id) AS books_given_out
FROM
    Librarian l
JOIN
    S_Cards sc ON l.id = sc.id_librarian
GROUP BY
    l.id, l.first_name, l.last_name
ORDER BY
    books_given_out DESC

-- 5:
SELECT
    l.id AS librarian_id,
    l.first_name AS librarian_first_name,
    l.last_name AS librarian_last_name,
    COUNT(sc.id) AS books_returned
FROM
    Librarian l
JOIN
    S_Cards sc ON l.id = sc.id_librarian
WHERE
    sc.date_in IS NOT NULL
GROUP BY
    l.id, l.first_name, l.last_name
ORDER BY
    books_returned DESC