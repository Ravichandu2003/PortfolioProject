USE sql_project;
SELECT location,date,total_cases,new_cases,total_deaths,population
FROM coviddeaths
ORDER BY 1,2;

/*Looking at total_cases vs total_deaths*/
SELECT location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 AS death_percentage
FROM coviddeaths
WHERE location='India'
ORDER BY 1,2;

/*Looking at total_cases vs population*/
SELECT location,date,total_cases,population,(total_cases/population)*100 AS percentage_effected
FROM coviddeaths
WHERE location ='India'
ORDER BY 1,2;

/*Looking for country with MAX cases*/
SELECT location,population,MAX(total_cases) AS highestInfectionCount, MAX(total_cases/population)*100 AS percentageEffected
FROM coviddeaths
GROUP BY location,population
ORDER BY percentageEffected DESC;

/*Looking for country with MAX death*/
SELECT location,population,MAX(total_deaths) AS highestDeathCount, MAX(total_deaths/population)*100 AS percentagedied
FROM coviddeaths
WHERE continent!=location
GROUP BY location,population
ORDER BY 1;

/*Show by continent with highest death count*/
SELECT continent,MAX(total_deaths) AS MaxDeaths
FROM coviddeaths
GROUP BY 1
ORDER BY 1 DESC;

/*Show by continent with highest death count per population*/
SELECT continent,MAX(total_deaths),MAX(total_deaths/population) AS deathRate 
FROM coviddeaths
GROUP BY 1
ORDER BY 2 DESC;

/*Global Numbers*/

SELECT date, SUM(new_cases)
FROM coviddeaths
GROUP BY date
ORDER BY 1,2;

SELECT date, SUM(new_cases),SUM(new_deaths)
FROM coviddeaths
GROUP BY date
ORDER BY 1,2;

SELECT date, SUM(new_cases),SUM(new_deaths),(SUM(new_deaths)/SUM(new_cases)*100) AS deathRate
FROM coviddeaths
GROUP BY date
ORDER BY 1,2;

SELECT SUM(new_cases),SUM(new_deaths),(SUM(new_deaths)/SUM(new_cases)*100) AS deathRate
FROM coviddeaths
ORDER BY 1,2;



/* Vaccinations*/
SELECT * FROM covidvaccination;

/*Join two tables on location and date*/
SELECT *
FROM coviddeaths cd
JOIN covidvaccination cv
ON cd.location=cv.location
and cd.date=cv.date;

/*Looking population vs total_vaccination*/
SELECT cd.continent,cd.location,cd.date,cd.population,cv.new_vaccinations,cv.people_vaccinated
FROM coviddeaths cd
JOIN covidvaccination cv
ON cd.location=cv.location
and cd.date=cv.date
ORDER BY 1,2,3;

/*Partition*/
SELECT cd.continent,cd.location,cd.date,cd.population,cv.new_vaccinations,
SUM(CV.new_vaccinations) OVER(partition by cd.location ORDER BY cd.location,cd.date) AS rollingPeopleVacinated
FROM coviddeaths cd
JOIN covidvaccination cv
ON cd.location=cv.location
and cd.date=cv.date
ORDER BY 1,2,3;

/*Use CTE*/
WITH popvsvac (continent,location,date,population,new_vaccinations,roolingPeopleVacinated)
as
(SELECT cd.continent,cd.location,cd.date,cd.population,cv.new_vaccinations,
SUM(CV.new_vaccinations) OVER(partition by cd.location ORDER BY cd.location,cd.date) AS rollingPeopleVacinated
FROM coviddeaths cd
JOIN covidvaccination cv
ON cd.location=cv.location
and cd.date=cv.date
ORDER BY 1,2,3)
SELECT *,(roolingPeopleVacinated/population)*100
FROM popvsvac;

/*Temp table*/
DROP TABLE IF EXISTS PercentPopulationVacccinated;
CREATE table PercentPopulationVacccinated
(
continent varchar(255),
location varchar(255),
date date,
population numeric,
new_vaccinations numeric,
rollingPeopleVacinated numeric
);
INSERT INTO PercentPopulationVacccinated
SELECT cd.continent,cd.location,cd.date,cd.population,cv.new_vaccinations,
SUM(CV.new_vaccinations) OVER(partition by cd.location ORDER BY cd.location,cd.date) AS rollingPeopleVacinated
FROM coviddeaths cd
JOIN covidvaccination cv
ON cd.location=cv.location
and cd.date=cv.date;
SELECT *
FROM PercentPopulationVacccinated;

/*Creating view to store data for later visualization*/
CREATE VIEW PercentPopulation_Vacccinated AS
SELECT cd.continent,cd.location,cd.date,cd.population,cv.new_vaccinations,
SUM(CV.new_vaccinations) OVER(partition by cd.location ORDER BY cd.location,cd.date) AS rollingPeopleVacinated
FROM coviddeaths cd
JOIN covidvaccination cv
ON cd.location=cv.location
and cd.date=cv.date;
