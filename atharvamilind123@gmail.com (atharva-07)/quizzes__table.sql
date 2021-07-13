CREATE TABLE quizzes (
	quiz_id BIGSERIAL PRIMARY KEY,
	quiz_name VARCHAR(50) NOT NULL,
	package_id BIGINT NOT NULL,
	CONSTRAINT fk_quizzes_packages
		FOREIGN KEY (package_id)
		REFERENCES packages (package_id)
);