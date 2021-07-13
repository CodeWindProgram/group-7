CREATE TABLE student_answers (
	_id BIGSERIAL PRIMARY KEY,
	student_id BIGINT NOT NULL,
	quiz_id BIGINT NOT NULL,
	question_id BIGINT NOT NULL,
	student_chosen_option BIGINT NOT NULL,
	correct_option BIGINT NOT NULL,
	CONSTRAINT fk_student__answers_students
		FOREIGN KEY (student_id)
		REFERENCES students (student_id),
	CONSTRAINT fk_student__answers_questions
		FOREIGN KEY (question_id)
		REFERENCES questions (question_id),
	CONSTRAINT fk_student__answers_quizzes
		FOREIGN KEY (quiz_id)
		REFERENCES quizzes (quiz_id)	
);