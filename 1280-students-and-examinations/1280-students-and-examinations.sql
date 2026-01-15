WITH crossjoin_students AS (
    SELECT
        s.student_id,
        s.student_name,
        sj.subject_name
    FROM
        students s
    CROSS JOIN
        subjects sj
)

SELECT
    c.student_id,
    c.student_name,
    c.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM
    crossjoin_students c
LEFT JOIN
    examinations e
    ON
        c.student_id = e.student_id
        AND c.subject_name = e.subject_name
GROUP BY
    c.student_id,
    c.student_name,
    c.subject_name
ORDER BY
    c.student_id,
    c.subject_name;