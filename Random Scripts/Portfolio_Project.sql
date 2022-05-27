SELECT location, date, total_cases, new_cases, total_deaths, population
  FROM portfolio_project..covid_deaths
    where total_cases = 0;

SELECT location, date, total_cases, total_deaths, (total_deaths /total_cases)*100 AS death_percentage
  FROM portfolio_project..covid_deaths
 
 select * 
 from portfolio_project..covid_deaths