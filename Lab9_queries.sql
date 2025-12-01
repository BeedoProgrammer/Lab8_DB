USE Course_Registration_Processing_System;

SELECT course_code, course.name, COUNT(student_id) FROM course 
NATURAL JOIN enrolled WHERE enrolled.year = '2016' AND enrolled.quarter = 'spring'
GROUP BY course_code, course.name HAVING COUNT(student_id) > 2;

/*
Use division

Original Logic:

    "Find students who have enrolled in all courses taught by Professor 2."

Double Negative Logic:

    "Find students where there does not exist any course taught by Professor 2 that the student has not enrolled in."
*/
SELECT S.student_name
FROM student as S
WHERE NOT EXISTS (
    SELECT SC.course_code
    FROM semester_course AS SC
    WHERE SC.prof_id = 2
    AND NOT EXISTS (
        SELECT E.course_code
        FROM enrolled as E
        WHERE E.student_id = S.student_id
        AND E.course_code = SC.course_code
    )
);


SELECT professor.prof_name, professor.prof_id, COUNT(course_code) FROM professor LEFT JOIN semester_course ON professor.prof_id = semester_course.prof_id
WHERE dept_id = 1 OR dept_id = 2 OR dept_id = 3 OR dept_id = 4
GROUP BY professor.prof_id, professor.prof_name HAVING COUNT(course_code) < 2;

SELECT prof_id, prof_name, course_code, course.name FROM professor NATURAL JOIN semester_course 
NATURAL JOIN course GROUP BY prof_id, prof_name, course_code, course.name HAVING COUNT(*) >= 2;