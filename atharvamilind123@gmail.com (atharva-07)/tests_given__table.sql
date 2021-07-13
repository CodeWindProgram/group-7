CREATE TABLE tests_given (
	attempt_id BIGSERIAL PRIMARY KEY,
	student_id BIGINT NOT NULL,
	package_id BIGINT NOT NULL,
	quiz_id BIGINT NOT NULL,
	performance INT DEFAULT NULL,
	attempt_date TIMESTAMP,
	CONSTRAINT fk_tests__given_students
		FOREIGN KEY (student_id)
		REFERENCES students (student_id),
	CONSTRAINT fk_tests__given_packages
		FOREIGN KEY (package_id)
		REFERENCES packages (package_id),
	CONSTRAINT fk_tests__given_quizzes
		FOREIGN KEY (quiz_id)
		REFERENCES quizzes (quiz_id)	
);