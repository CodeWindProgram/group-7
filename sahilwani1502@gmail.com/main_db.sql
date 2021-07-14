-- creating database
CREATE DATABASE codewind;

CREATE SCHEMA logins;
CREATE TABLE logins.students (
    stud_id smallint(255) NOT NULL,
    stud_name varchar(100) NOT NULL,
    seat_no int NOT NULL,
    sub_name char(10) NOT NULL,
    course_name char(10) NOT NULL,
    block_no smallint(10) NOT NULL
);

CREATE TABLE logins.admin_users (
    username varchar(20) NOT NULL,
    userid smallint(10) NOT NULL,
    passcode varchar(100) NOT NULL,
    user_role varchar(11) NOT NULL, 
    lastlogin datetime NOT NULL
);

CREATE SCHEMA test;

CREATE TABLE test.subjects (
    sub_id smallint NOT NULL,
    sub_name varchar(11)NOT NULL
);

CREATE TABLE test.examinfo (
    exam_id smallint(11),
    admin_id smallint(11),
    exam_title varchar(20),
    exam_datetime datetime,
    exam_duration varchar,
    total_questions int,
    marks_per_right_ans decimal,
    marks_per_wrong_ans decimal,
    exam_code varchar
);

CREATE TABLE test.questions (
    question_id int(10) NOT NULL,
    question text(255) NOT NULL,
    option_a text NOT NULL,
    option_b text NOT NULL,
    option_c text NOT NULL,
    option_d text NOT NULL,
    correct_option varchar
);

CREATE SCHEMA response;
CREATE TABLE response.user_resp (
    response_id smallint NOT NULL,
    userid smallint NOT NULL,
    question_id int NOT NULL,
    user_answer_response text NOT NULL,
    marks varchar
);

CREATE SCHEMA studentresult;
CREATE TABLE studentresult.result (
    resultid smallint,
    userid smallint,
    correct_ans smallint,
    wrong_ans smallint,
    attempts smallint,
    score decimal,
    timetaken time,
);


--adding primary keys
ALTER TABLE logins.students 
    ADD CONSTRAINT PRIMARY KEY(stud_id),

ALTER TABLE logins.admin_users 
    ADD CONSTRAINT PRIMARY KEY(userid);

ALTER TABLE test.subjects
    ADD CONSTRAINT PRIMARY KEY(sub_id);

ALTER TABLE test.examinfo 
    ADD CONSTRAINT PRIMARY KEY(exam_id);

ALTER TABLE test.questions 
    ADD CONSTRAINT PRIMARY KEY(question_id);

ALTER TABLE response.user_resp 
    ADD CONSTRAINT PRIMARY KEY(response_id);


--adding foreign keys
ALTER TABLE test.subjects
    ADD CONSTRAINT fk_sub FOREIGN KEY (exam_id) REFERENCES test.examinfo(exam_id) ON DELETE CASCADE 

 ALTER TABLE test.questions
    ADD CONSTRAINT fk_exam FOREIGN KEY (exam_id) REFERENCES test.examinfo(exam_id) ON DELETE CASCADE 

ALTER TABLE response.user_resp
    ADD CONSTRAINT fk_examid FOREIGN KEY (exam_id) REFERENCES test.examinfo(exam_id) ON DELETE CASCADE 

ALTER TABLE studentresult.result
    ADD CONSTRAINT fk_examid FOREIGN KEY (exam_id) REFERENCES test.examinfo(exam_id) ON DELETE CASCADE 

ALTER TABLE test.questions
    ADD CONSTRAINT fk_sub FOREIGN KEY (sub_id) REFERENCES test.subjects(sub_id) ON DELETE CASCADE 

ALTER TABLE response.user_resp
    ADD CONSTRAINT fk_sub FOREIGN KEY (question_id) REFERENCES test.questions(question_id) ON DELETE CASCADE 

ALTER TABLE studentresult.result
    ADD CONSTRAINT fk_result FOREIGN KEY (exam_id) REFERENCES test.examinfo(exam_id) ON DELETE CASCADE 

ALTER TABLE studentresult.result
    ADD CONSTRAINT fk_result FOREIGN KEY (sub_id) REFERENCES test.subjects(sub_id) ON DELETE CASCADE 

ALTER TABLE studentresult.result
    ADD CONSTRAINT fk_result FOREIGN KEY (stud_id) REFERENCES logins.students(stud_id) ON DELETE CASCADE 

