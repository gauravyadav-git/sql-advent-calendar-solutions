-- SQL Advent Calendar - Day 18
-- Title: 12 Days of Data - Progress Tracking
-- Difficulty: hard
--
-- Question:
-- Over the 12 days of her data challenge, Data Dawn tracked her daily quiz scores across different subjects. Can you find each subject's first and last recorded score to see how much she improved?
--
-- Over the 12 days of her data challenge, Data Dawn tracked her daily quiz scores across different subjects. Can you find each subject's first and last recorded score to see how much she improved?
--

-- Table Schema:
-- Table: daily_quiz_scores
--   subject: VARCHAR
--   quiz_date: DATE
--   score: INTEGER
--

-- My Solution:

WITH per_subject_dates AS (
    SELECT subject,
            MAX(quiz_date) AS last_quiz_date,
            MIN(quiz_date) AS first_quiz_date
    FROM daily_quiz_scores
    GROUP BY subject
  )
SELECT p.subject,
        p.first_quiz_date,
        p.last_quiz_date,
        d.score
FROM per_subject_dates p JOIN daily_quiz_scores d ON p.subject = d.subject
AND (d.quiz_date = p.first_quiz_date OR d.quiz_date = p.last_quiz_date);
