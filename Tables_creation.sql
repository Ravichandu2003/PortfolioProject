USE sql_project;
DROP TABLE coviddeaths;
CREATE TABLE coviddeaths
(
	iso_code VARCHAR(30),
	continent VARCHAR(30),
	location VARCHAR(30),
	/*date DATE,*/
	population INT,
	total_cases	INT,
    new_cases INT,
	new_cases_smoothed FLOAT,
	total_deaths INT,
	new_deaths INT,
	new_deaths_smoothed FLOAT,
	total_cases_per_million FLOAT,
	new_cases_per_million FLOAT,
	new_cases_smoothed_per_million FLOAT,
	total_deaths_per_million FLOAT,
	new_deaths_per_million FLOAT,
	new_deaths_smoothed_per_million FLOAT,
	reproduction_rate FLOAT,
	icu_patients INT,
	icu_patients_per_million FLOAT,
	hosp_patients INT,
	hosp_patients_per_million FLOAT,
	weekly_icu_admissions INT,
	weekly_icu_admissions_per_million FLOAT,
	weekly_hosp_admissions INT,
	weekly_hosp_admissions_per_million FLOAT
);
DROP TABLE covidvaccination;
CREATE TABLE covidvaccination
(
	iso_code varchar(10) NOT NULL,
    continent varchar(20) NOT NULL,
    location varchar(20) NOT NULL,
    /*date DATE NOT NULL,*/
    population INT NOT NULL,
    total_cases INT DEFAULT NULL,
	new_cases INT DEFAULT NULL,
    total_tests_per_thousand FLOAT DEFAULT NULL,
	new_tests_per_thousand FLOAT DEFAULT NULL,
	new_tests_smoothed INT DEFAULT NULL,
	new_tests_smoothed_per_thousand  FLOAT DEFAULT NULL,
	positive_rate FLOAT DEFAULT NULL,
	tests_per_case FLOAT DEFAULT NULL,
	tests_units VARCHAR(20) DEFAULT NULL,
	total_vaccinations INT DEFAULT NULL,
	people_vaccinated INT DEFAULT NULL,
	people_fully_vaccinated INT DEFAULT NULL,
	new_vaccinations INT DEFAULT NULL,
	new_vaccinations_smoothed INT DEFAULT NULL,
	total_vaccinations_per_hundred FLOAT DEFAULT NULL,
	people_vaccinated_per_hundred FLOAT DEFAULT NULL,
	people_fully_vaccinated_per_hundred FLOAT DEFAULT NULL,
	new_vaccinations_smoothed_per_million INT DEFAULT NULL,
	stringency_index FLOAT DEFAULT NULL,
	population_density FLOAT DEFAULT NULL,
	median_age FLOAT DEFAULT NULL,
	aged_65_older FLOAT DEFAULT NULL,
	aged_70_older FLOAT DEFAULT NULL,
	gdp_per_capita FLOAT DEFAULT NULL,
	extreme_poverty FLOAT DEFAULT NULL,
	cardiovasc_death_rate FLOAT DEFAULT NULL,
	diabetes_prevalence FLOAT DEFAULT NULL,
	female_smokers FLOAT DEFAULT NULL,
	male_smokers FLOAT DEFAULT NULL,
	handwashing_facilities FLOAT DEFAULT NULL,
	hospital_beds_per_thousand FLOAT DEFAULT NULL,
	life_expectancy FLOAT DEFAULT NULL,
	human_development_index FLOAT DEFAULT NULL
)
/*
SELECT * FROM coviddeaths;
SELECT * FROM covidvaccination;*/