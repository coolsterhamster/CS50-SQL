/* In 10.sql, write SQL query to answer a question of your choice. This query should:
Make use of AS to rename a column
Involve at least condition, using WHERE
Sort by at least one column using ORDER BY */

SELECT CONCAT(first_name, " " ,last_name) AS players, CONCAT(birth_year, "-", birth_month, "-", birth_day) AS birthday
FROM players
WHERE birth_month = 12
ORDER BY birth_day
