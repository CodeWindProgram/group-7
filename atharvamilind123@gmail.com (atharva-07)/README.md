# Task: Create different schemas required for the test platform database
## @atharva-07 - atharvamilind123@gmail.com

- Created 7 tables
   - students
   - packages (a 'package' categorizes a set of 'quizzes' (or tests). eg: All the 'Python' related tests are stored with 'package_id' of Python package.)
   - quizzes
   - questions
   - question_options
   - student_answers
   - tests_given
- Built necessary relationships between the tables using Primary and Foreign keys to avoid redundant duplication of data leading to lesser consumption of space.
- Created the relations in a way which makes it easier to implement aggregation.
- Tested JOIN operations with different inputs for relations between all the tables.
