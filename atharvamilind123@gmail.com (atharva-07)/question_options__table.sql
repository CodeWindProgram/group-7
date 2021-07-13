CREATE TABLE question_options (
	option_id BIGSERIAL PRIMARY KEY,
	option_text VARCHAR(300) NOT NULL,
	is_right BOOLEAN NOT NULL DEFAULT FALSE,
	question_id BIGINT NOT NULL,
	CONSTRAINT fk_question__options_questions
		FOREIGN KEY (question_id)
		REFERENCES questions (question_id)
);