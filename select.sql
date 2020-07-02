# 1.Query the existence of 1 course;
select * from student_course where courseId=1;

# 2.Query the presence of both 1 and 2 courses;
select * from (select * from student_course where courseId=1) as a,
(select * from student_course where courseId=2) as b where a.studentId=b.studentId;

# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
select c.studentId,s.name,avg(c.score) from student_course as c join student as s where s.id=c.studentId group by c.studentId HAVING avg(c.score)>=60;

# 4.Query the SQL statement of student information that does not have grades in the student_course table
select * from student as s left join student_course as sc on s.id=sc.studentId having sc.score is NULL;

# 5.Query all SQL with grades
select * from student as s,student_course as sc where s.id=sc.studentId;

# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
select s.id,s.name,s.age,s.sex from (select * from student_course where courseId=1) as a,
(select * from student_course where courseId=2) as b,student as s where a.studentId=b.studentId and s.id =a.studentId;

# 7.Retrieve 1 student score with less than 60 scores in descending order
select s.id,s.name,s.age,s.sex from student_course as sc join student as s where sc.studentId=s.id and 
sc.courseId=1 order by score desc;

# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
select c.courseId,avg(c.score) from student_course as c GROUP BY courseId order by avg(c.score) DESC,courseId ASC;

# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
select c.name,s.name,sc.score from student as s join course as c join student_course as sc
where s.id=sc.studentId and sc.courseId=c.id and c.name="Math" and sc.score<60;


# 1.查询存在1课程的情况

# 2.查询同时存在1课程和2课程的情况

# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩

# 4.查询在student_course表中不存在成绩的学生信息的SQL语句

# 5.查询所有有成绩的SQL

# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息

# 7.检索1课程分数小于60，按分数降序排列的学生信息

# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列

# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
