create database session03_ex04;
use session03_ex04;


create table class(
classId int auto_increment primary key,
className varchar(100),
startDate varchar(255),
status bit
);

create table student(
studentId int auto_increment primary key,
studentName varchar(100),
address varchar(255),
phone varchar(11),
class_id int,
status bit
);

ALTER TABLE student
MODIFY class_id int,
ADD CONSTRAINT class_id
FOREIGN KEY (class_id) REFERENCES class(classId);

create table subject(
subject_id int auto_increment primary key,
subjectName varchar(100),
credit int,
status bit
);

create table mark(
markId int auto_increment primary key,
student_id int, foreign key(student_id) references student(studentId),
subject_id int,foreign key(subject_id) references subject(subject_id),
mark double,
examTime datetime
);


insert into class(className,startDate,status) values('HN-JV231103','03/11/2023',1);
insert into class(className,startDate,status) values('HN-JV2312293','29/12/2023',1);
insert into class(className,startDate,status) values('HN-JV230615','15/06/2023',1);



insert into student(studentName,address,phone,class_id , status) values('ho da hung', 'ha Noi' ,'0987554321','1',1);
insert into student(studentName,address,phone,class_id , status) values('phan van giang', 'da nang' ,'0987554321','1',1);
insert into student(studentName,address,phone,class_id , status) values('duong my huyen', 'ha Noi' ,'0987554321','2',1);

insert into subject(subjectName,credit,status) values('toan', '3' ,1);
insert into subject(subjectName,credit,status) values('van', '3' ,1);
insert into subject(subjectName,credit,status) values('anh', '2' ,1);

insert into mark(student_id,subject_id,mark,examTime) values('1','1', 7,'2024-05-12');
insert into mark(student_id,subject_id,mark,examTime) values('1','1', 7,'2024-03-15');
insert into mark(student_id,subject_id,mark,examTime) values('1','1', 7,'2024-05-12');
insert into mark(student_id,subject_id,mark,examTime) values('2','3', 9,'2024-05-12');
insert into mark(student_id,subject_id,mark,examTime) values('3','3', 10,'2024-11-02');


select * from class order by className desc ;
select * from student where address = 'ha noi';
select * from student join class where class.className = 'HN-JV231103';

SELECT student.studentId, student.studentName, student.address, student.phone, class.className
FROM student
JOIN class ON student.class_id = class.classId
WHERE class.className = 'HN-JV231103';

select * from subject where credit > 2;


select * from student where phone like '09%';