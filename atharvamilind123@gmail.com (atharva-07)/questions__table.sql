CREATE TABLE questions (
	question_id BIGSERIAL PRIMARY KEY,
	question_text VARCHAR(500) NOT NULL,
	quiz_id BIGINT NOT NULL,
	CONSTRAINT fk_questions_quizzes
		FOREIGN KEY (quiz_id)
		REFERENCES quizzes (quiz_id)
);