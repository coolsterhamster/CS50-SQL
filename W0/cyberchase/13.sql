-- In 13.sql, write a SQL query to explore a question of your choice. This query should:
    -- Involve at least one condition, using WHERE with AND or OR

SELECT season, air_date
FROM episodes
WHERE air_date LIKE "%-30%" OR air_date LIKE "%01%"
