-- SQL Advent Calendar - Day 24
-- Title: New Year Goals - User Type Analysis
-- Difficulty: hard
--
-- Question:
-- As the New Year begins, the goals tracker team wants to understand how user types differ. How many completed goals does the average user have in each user_type?
--
-- As the New Year begins, the goals tracker team wants to understand how user types differ. How many completed goals does the average user have in each user_type?
--

-- Table Schema:
-- Table: user_goals
--   user_id: INT
--   user_type: VARCHAR
--   goal_id: INT
--   goal_status: VARCHAR
--

-- My Solution:

SELECT user_type,
  avg(Completed_goals_per_year) AS avg_completed_goals_per_user_type
FROM 
  (
    SELECT user_id,
      user_type,
      COUNT (*) AS Completed_goals_per_year
    from user_goals
    WHERE goal_status = 'Completed'
    group by user_id, user_type  
  ) AS new_table
GROUP BY user_type;
