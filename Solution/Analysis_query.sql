--View the first 100 rows of the dataset to understand its structure. 
SELECT TOP 100* 
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
--2.Count the total number of players in the dataset. 
SELECT COUNT(*) AS total_players
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
--3.List all unique teams in the league.
SELECT DISTINCT team
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
ORDER BY team;
--4. Count how many players are in each team.
SELECT team,
      COUNT(*) AS players_per_team
      FROM [dbo].[ketro_sa_soccer_dataset_advanced]
      GROUP BY team
      ORDER BY players_per_team DESC;
--5. Identify the top 10 players with the most goals.
SELECT TOP 10 player_name,
      team,
      goals
      FROM [dbo].[ketro_sa_soccer_dataset_advanced]
      ORDER BY goals DESC;
--6. Find the average salary for players in each team. 
SELECT team,
    AVG(average_salary_zar) AS avg_salary
    FROM [dbo].[ketro_sa_soccer_dataset_advanced]
    GROUP BY team
    ORDER BY avg_salary DESC;
--7. Retrieve the top 10 players with the highest market value. 
SELECT TOP 10 player_name,
              team,
              market_value_zar
    FROM [dbo].[ketro_sa_soccer_dataset_advanced]
    ORDER BY market_value_zar;
--8. Calculate the average passing accuracy for each position.
SELECT position,
       AVG(passing_accuracy) AS avg_passing_accuracy
     FROM [dbo].[ketro_sa_soccer_dataset_advanced]
     GROUP BY position
     ORDER BY avg_passing_accuracy;

--9. Compare shot accuracy with goals to find correlations. 
SELECT player_name,
       team,
       goals,
       shot_accuracy
   FROM [dbo].[ketro_sa_soccer_dataset_advanced]
   ORDER BY shot_accuracy DESC;
--10.Compute total goals and assists for each team.
SELECT team,
    SUM(goals) AS goals_scored,
    SUM(assists) AS total_assists
  FROM [dbo].[ketro_sa_soccer_dataset_advanced]
  GROUP BY team
  ORDER BY goals_scored DESC;
--11. Count players by their marital status. 
SELECT marital_status,
    COUNT(*) AS total_players
  FROM [dbo].[ketro_sa_soccer_dataset_advanced]
  GROUP BY marital_status
  ORDER BY total_players;
--12. Count players by nationality. 
SELECT nationality,
    COUNT(*) AS players_count
   FROM [dbo].[ketro_sa_soccer_dataset_advanced]
   GROUP BY nationality
   ORDER BY players_count;
--13. Find average market value grouped by nationality. 
SELECT nationality,
    AVG(market_value_zar) AS avg_market_value
  FROM [dbo].[ketro_sa_soccer_dataset_advanced]
  GROUP BY nationality
  ORDER BY avg_market_value;
--14. Determine how many player contracts end in each year. 
SELECT contract_end_year,
    COUNT(*) AS players_with_contract_end
   FROM [dbo].[ketro_sa_soccer_dataset_advanced]
   GROUP BY contract_end_year
   ORDER BY contract_end_year;
--15. Identify players whose contracts end next year. 
SELECT player_name,
       team,
       contract_end_year
   FROM [dbo].[ketro_sa_soccer_dataset_advanced]
   WHERE contract_end_year='2026';
--16. Summarize the number of players by injury status. 
SELECT injury_status,
    COUNT(*) AS number_of_players
  FROM [dbo].[ketro_sa_soccer_dataset_advanced]
  GROUP BY injury_status;
      
--17. Calculate goals per match ratio for each player. 
SELECT player_name,
        goals,
       matches_played,
  ROUND(goals/NULLIF(matches_played,0),2) AS goals_per_match_ratio
   FROM [dbo].[ketro_sa_soccer_dataset_advanced];

--18. Count how many players are managed by each agent. 
SELECT agent,
     COUNT(*) AS number_of_players
   FROM [dbo].[ketro_sa_soccer_dataset_advanced]
   GROUP BY agent
   ORDER BY number_of_players;
--19. Calculate average height and weight by player position. 
SELECT position,
    AVG(height_cm) AS avg_height_cm,
    AVG(weight_kg) AS avg_weight_kg
  FROM [dbo].[ketro_sa_soccer_dataset_advanced]
  GROUP BY position
  ORDER BY position;
--20. Identify players with the highest combined goals and assists.
SELECT TOP 10 
            player_name,
             team,
             goals,
             assists,
   (goals+assists) AS total_contribution
    FROM [dbo].[ketro_sa_soccer_dataset_advanced]
    ORDER BY total_contribution DESC;
