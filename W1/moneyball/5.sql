/*It’s a bit of a slow day in the office. Though Satchel no longer plays,
in 5.sql, write a SQL query to find all teams that Satchel Paige played for.
Your query should return a table with a single column, one for the name of the teams.
*/

SELECT DISTINCT t.name
FROM players p
JOIN performances pp ON p.id = pp.player_id
JOIN teams t ON pp.team_id = t.id
WHERE p.first_name = 'Satchel' AND p.last_name = 'Paige'
