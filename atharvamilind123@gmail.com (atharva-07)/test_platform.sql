CREATE TABLE students (
	student_id BIGSERIAL PRIMARY KEY,
	firstname VARCHAR(50) NOT NULL,
	lastname VARCHAR(50) NOT NULL,
	username VARCHAR(20) UNIQUE NOT NULL,
	email VARCHAR(60) UNIQUE NOT NULL,
	user_password VARCHAR(20) NOT NULL, -- Encrypt in the backend before storing
	contact_no CHARACTER(10) UNIQUE NOT NULL,
	date_of_birth DATE NOT NULL,
	country VARCHAR(56) NOT NULL
);

-- (a 'package' categorizes a set of 'quizzes' (or tests))
CREATE TABLE packages (
	package_id BIGSERIAL PRIMARY KEY,
	package_name VARCHAR(50) NOT NULL
);

CREATE TABLE quizzes (
	quiz_id BIGSERIAL PRIMARY KEY,
	quiz_name VARCHAR(50) NOT NULL,
	package_id BIGINT NOT NULL,
	CONSTRAINT fk_quizzes_packages
		FOREIGN KEY (package_id)
		REFERENCES packages (package_id)
        ON DELETE CASCADE
);

CREATE TABLE questions (
	question_id BIGSERIAL PRIMARY KEY,
	question_text VARCHAR(500) NOT NULL,
	quiz_id BIGINT NOT NULL,
	CONSTRAINT fk_questions_quizzes
		FOREIGN KEY (quiz_id)
		REFERENCES quizzes (quiz_id)
        ON DELETE CASCADE
);

CREATE TABLE question_options (
	option_id BIGSERIAL PRIMARY KEY,
	option_text VARCHAR(300) NOT NULL,
	is_right BOOLEAN NOT NULL DEFAULT FALSE,
	question_id BIGINT NOT NULL,
	CONSTRAINT fk_question__options_questions
		FOREIGN KEY (question_id)
		REFERENCES questions (question_id)
        ON DELETE CASCADE
);

CREATE TABLE student_answers (
	_id BIGSERIAL PRIMARY KEY,
	student_id BIGINT NOT NULL,
	quiz_id BIGINT NOT NULL,
	question_id BIGINT NOT NULL,
	student_chosen_option BIGINT NOT NULL,
	correct_option BIGINT NOT NULL,
	CONSTRAINT fk_student__answers_students
		FOREIGN KEY (student_id)
		REFERENCES students (student_id)
        ON DELETE CASCADE,
	CONSTRAINT fk_student__answers_questions
		FOREIGN KEY (question_id)
		REFERENCES questions (question_id)
        ON DELETE CASCADE,
	CONSTRAINT fk_student__answers_quizzes
		FOREIGN KEY (quiz_id)
		REFERENCES quizzes (quiz_id)	
        ON DELETE CASCADE
);

CREATE TABLE tests_given (
	attempt_id BIGSERIAL PRIMARY KEY,
	student_id BIGINT NOT NULL,
	package_id BIGINT NOT NULL,
	quiz_id BIGINT NOT NULL,
	performance INT DEFAULT NULL,
	attempt_date TIMESTAMP,
	CONSTRAINT fk_tests__given_students
		FOREIGN KEY (student_id)
		REFERENCES students (student_id)
        ON DELETE CASCADE,
	CONSTRAINT fk_tests__given_packages
		FOREIGN KEY (package_id)
		REFERENCES packages (package_id)
        ON DELETE CASCADE,
	CONSTRAINT fk_tests__given_quizzes
		FOREIGN KEY (quiz_id)
		REFERENCES quizzes (quiz_id)
        ON DELETE CASCADE	
);
