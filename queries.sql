USE Course_Registration_Processing_System;

SELECT student_name FROM student WHERE level = 'SR' AND student_id IN (
    SELECT student_id FROM enrolled NATURAL JOIN semester_course WHERE prof_id = '1'
);

SELECT student_name, course.name FROM student LEFT JOIN enrolled ON student.student_id = enrolled.student_id 
LEFT JOIN course ON enrolled.course_code = course.course_code;
