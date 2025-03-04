with cte as (
    SELECT student_id
, subject
, FIRST_VALUE(score) OVER (PARTITION BY student_id, subject ORDER BY exam_date ASC) as first_score
, FIRST_VALUE(score) OVER (PARTITION BY student_id, subject ORDER BY exam_date DESC) as latest_score
FROM Scores
)
