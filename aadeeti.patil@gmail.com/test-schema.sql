
-- ADMIN TABLE

CREATE TABLE `admin_users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(200) NOT NULL,
  `role` varchar(200) NOT NULL
);


-- QUESTIONS TABLE

CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `image` varchar(200) NOT NULL,
  `option_a` text NOT NULL,
  `option_b` text NOT NULL,
  `option_c` text NOT NULL,
  `option_d` text NOT NULL,
  `answer` varchar(1) NOT NULL
);

-- SUBJECTS TABLE

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `subject` varchar(200) NOT NULL
);

-- TEST TABLE 

CREATE TABLE `test` (
  `test_id` int(11) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `test_name` varchar(50) NOT NULL,
  `sdatetime` datetime NOT NULL,
  `edatetime` datetime NOT NULL,
  `test_duration` int(11) NOT NULL,
  `attempts` int(11) NOT NULL,
  `yes_no` varchar(3) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- TEST_RESULT TABLE
CREATE TABLE `test_result` (
  `result_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `right_ans` int(11) NOT NULL,
  `wrong_ans` int(11) NOT NULL,
  `no_attempt` int(11) NOT NULL,
  `score` float NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- USERS TABLE

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL
);

-- KEY INDEXES FOR ALL TABLES
-- ADMIN TABLE
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`user_id`);

-- QUESTIONS TABLE
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`);

-- SUBJECTS TABLE
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`);

-- TEST TABLE
ALTER TABLE `test`
  ADD PRIMARY KEY (`test_id`);

-- TEST_RESULT TABLE
ALTER TABLE `test_result`
  ADD PRIMARY KEY (`result_id`);

-- USERS TABLE
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);