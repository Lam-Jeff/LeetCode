select Students.student_id, student_name, Subjects.subject_name, count(Examinations.subject_name) as attended_exams
from Students
cross join Subjects
left join Examinations on Examinations.student_id = Students.student_id
and Examinations.subject_name = Subjects.subject_name
group by  Students.student_name, Students.student_id, Subjects.subject_name
order by Students.student_id, Subjects.subject_name;
