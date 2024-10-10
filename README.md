## 👋 Introduction

Hello! My expertise in ETL (data extraction, transformation, and loading) allowed me to build a comprehensive 2024 COVID-19 dataset from the Department of Health. This ensures clean and reliable data for insightful analysis of the pandemic's trends.



## 📖 Background
To enhance my understanding of covid's impact and explore career paths in covid response, I'm initiating a project that utilizes advanced data analysis tools to uncover trends within COVID-related datasets.

## 📈 Dashboard
![Covid_dashboard](https://github.com/Aldosee/SQL-Covid-2024/blob/main/assets/CovidPh_Dashboard_(Updated).png)
#### 📈 You can check the full dashboard: [PowerBI_CovidPh](assets/CovidPh_Dashboard_(Updated).png)


## 🤔💭 Questions for this analysis using SQL queries:

1. What region and province has the highest COVID cases in the Philippines?
2. What were the highest COVID cases reported and deaths?
3. What age group is infected the most in males and females?
4. What year has the highest COVID cases recorded and lowest?
5. What region has the highest and lowest case fatality rate?

## 🛠️ Tools
- SQL: For analysis and query database to answer the questions.
 - PostgreSQL: Database management system.
 - Visual Studio Code: Database management and executing SQL queries.
 - Git & GitHub: SQL scripts and analysis. Project tracking of updates.
 - PowerBI: Visualization and to give a comprehensive insight of analysis.

## 🔎 Analysis

### 1. Highest COVID cases in regions and provinces.

This SQL query calculates the total number of confirmed COVID-19 cases per region and province in the Philippines,  by aggregating data from a table named doh_covid_data_drop_20240103_05_doh_data_collect_daily_report. The query groups the data by region and province, sums the number of confirmed cases across different categories (asymptomatic, critical, mild, moderate, and severe), and sorts the results by region.

```
SELECT 
    region, 
    province,
    SUM(conf_asym + conf_crit + conf_mild + conf_mod + conf_severe) AS Grand_TotalCasesPerRegion
FROM 
    doh_covid_data_drop_20240103_05_doh_data_collect_daily_report
GROUP BY 
    region, 
    province
ORDER BY 
    region;

```
#### The result:
With the SQL query, load in PowerBI to have a comprehensive output of the data. The data showed that the region with the highest number of COVID-19 cases is the National Capital Region (NCR), specifically the NCR, Second District with 703,766 cases. Conversely, the province with the lowest number of cases is Tawi-Tawi in the Bangsamoro Autonomous Region in Muslim Mindanao (BARMM) with 109 cases.

![Highest](assets/Highest_Covid_Region_Province.png) 
![Lowest](assets/Lowest_Covid_Region_Province.png)

### 2. Highest COVID cases reported.

This SQL query calculates the daily total number of positive COVID-19 individuals  from a table named DOH_COVID_Data_Drop_20240103_07_Testing_Aggregates, excluding rows with null or zero values for daily_output_positive_individuals. It groups the data by report_date and calculates the sum of daily_output_positive_individuals for each date then retrieve the highest number of cases by using the DESC function.

```
SELECT 
    report_date, 
    SUM(daily_output_positive_individuals) AS Total_individual_positive
FROM 
    DOH_COVID_Data_Drop_20240103_07_Testing_Aggregates
WHERE 
    daily_output_positive_individuals IS NOT NULL AND daily_output_positive_individuals <> 0
GROUP BY 
    report_date
ORDER BY
    total_individual_positive DESC
LIMIT 
    10;

```
### The result:
The highest number of positive cases reported was on January 14, 2022, with 41,139 cases.
Daily cases peaked around that date, followed by a general decrease on different days.
Possible reasons for the surge;

- Increased transmission due to holiday gatherings during the Christmas and New Year season.
- The emergence of a new variant at the time.
- Delays in reporting or testing backlogs.



        | Report Date | Total Individual Positive |
        |-------------|----------------------------|
        | 2022-01-14  | 41,139                     |
        | 2022-01-13  | 40,460                     |
        | 2022-01-12  | 39,408                     |
        | 2022-01-11  | 39,216                     |
        | 2022-01-15  | 36,680                     |
        | 2022-01-08  | 36,335                     |
        | 2022-01-07  | 35,504                     |
        | 2022-01-06  | 35,203                     |
        | 2022-01-19  | 34,473                     |
        | 2022-01-18  | 33,584                     |

#### 📊Here's a visual presentation of covid 19 trend from 2020-2024:

![Highest_covid_spike](assets/Day_highest_covid_recorded.png) 


### 2.1 Highest death reported.
This SQL query utilizes a CTE (Common Table Expression) named combined_data_doh_health to efficiently calculate the number of COVID-19 deaths by region in the Philippines and focusing on confirmed regions and sorting the results by the highest death toll. (I also used the UNION function in CTE to combine the four separate Excel-formatted tables from DOH, it's probably the excel can't store much data that's why they batch it.)

```
WITH combined_data_doh_health AS
(
    SELECT 
        casecode, 
        RegionRes, 
        HealthStatus
    FROM 
        doh_covid_data_drop_20240103_04_case_info_0
    UNION
    SELECT 
        casecode, 
        RegionRes, 
        HealthStatus
    FROM 
        doh_covid_data_drop_20240103_04_case_info_1
    UNION   
    SELECT 
        casecode, 
        RegionRes,
        HealthStatus
    FROM 
        doh_covid_data_drop_20240103_04_case_info_2
    UNION
    SELECT 
        casecode, 
        RegionRes, 
        HealthStatus
    FROM 
        doh_covid_data_drop_20240103_04_case_info_3
    UNION
    SELECT 
        casecode, 
        RegionRes, 
        HealthStatus
    FROM 
        doh_covid_data_drop_20240103_04_case_info_4
)

    SELECT 
        RegionRes, 
        HealthStatus, 
        COUNT(HealthStatus) AS TotalStatus
    FROM
        combined_data_doh_health
    WHERE 
        RegionRes IS NOT NULL AND HealthStatus = 'DIED'
    GROUP BY
        HealthStatus, 
        RegionRes
    ORDER BY 
        Totalstatus DESC;
```

### The result:

National Capital Region (NCR): This region has the highest death toll with 13,897.
Possible reasons for higher death tolls in some regions could include:

- Population density: Regions with higher population density could have a higher chance of viral spread, potentially leading to more cases and deaths.
- Healthcare infrastructure: Regions with limited healthcare resources might have lower capacities to handle severe cases, impacting mortality rates.
- Testing and vaccination rates: Areas with lower testing or vaccination rates could have undetected cases or a higher proportion of vulnerable individuals, contributing to more deaths.
- Socioeconomic factors: Factors like poverty, access to nutrition, and underlying health conditions can influence vulnerability to severe illness and death from COVID-19.

    ### Deaths by Region

    | Region                                                         | Health Status | Total Status |
    |----------------------------------------------------------------|---------------|--------------|
    | NATIONAL CAPITAL REGION (NCR)                                  | DIED          | 13,897       |
    | REGION III (CENTRAL LUZON)                                     | DIED          | 8,812        |
    | REGION IV-A (CALABARZON)                                       | DIED          | 6,763        |
    | REGION VII (CENTRAL VISAYAS)                                   | DIED          | 6,693        |
    | REGION VI (WESTERN VISAYAS)                                    | DIED          | 5,780        |
    | REGION II (CAGAYAN VALLEY)                                     | DIED          | 4,961        |
    | REGION XI (DAVAO REGION)                                       | DIED          | 4,022        |
    | REGION I (ILOCOS REGION)                                       | DIED          | 3,255        |
    | CORDILLERA ADMINISTRATIVE REGION (CAR)                         | DIED          | 2,547        |
    | REGION XIII (CARAGA)                                           | DIED          | 1,811        |
    | REGION IX (ZAMBOANGA PENINSULA)                                | DIED          | 1,585        |
    | REGION XII (SOCCSKSARGEN)                                      | DIED          | 1,424        |
    | MIMAROPA REGION                                                | DIED          | 1,315        |
    | REGION V (BICOL REGION)                                        | DIED          | 1,235        |
    | REGION X (NORTHERN MINDANAO)                                   | DIED          | 1,157        |
    | REGION VIII (EASTERN VISAYAS)                                  | DIED          | 876          |
    | BANGSAMORO AUTONOMOUS REGION IN MUSLIM MINDANAO (BARMM)        | DIED          | 712          |

### 3. The age group that got infected the most in the male and female categories.

This SQL query combines data from five tables (doh_covid_data_drop_20240103_04_case_info_0 to _4) into a single dataset named "combined_data_doh". It then counts the number of male and female cases for each region and age group. (I also used the UNION function in CTE to combine the four separate Excel-formatted tables from DOH, it's probably the excel can't store much data that's why they batch it.)
- *CASE WHEN* statement is used to conditionally count cases based on gender. It checks if "Sex" is equal to 'FEMALE' and if true, counts the occurrence. Otherwise, it returns NULL. A separate CASE WHEN statement does the same for males.
- *HAVING* clause filters the grouped data. It ensures that only rows with non-null values for "RegionRes" and "AgeGroup" are included in the final result. This removes potential empty groups.

```

WITH combined_data_doh AS
(
    SELECT 
        casecode, 
        RegionRes, 
        AgeGroup, 
        Sex
    FROM 
        doh_covid_data_drop_20240103_04_case_info_0
    UNION
    SELECT 
        casecode, 
        RegionRes, 
        AgeGroup, 
        Sex
    FROM 
        doh_covid_data_drop_20240103_04_case_info_1
    UNION
    SELECT 
        casecode, 
        RegionRes, 
        AgeGroup, 
        Sex
    FROM 
        doh_covid_data_drop_20240103_04_case_info_2
    UNION
    SELECT 
        casecode, 
        RegionRes, 
        AgeGroup, 
        Sex
    FROM 
        doh_covid_data_drop_20240103_04_case_info_3
    UNION
    SELECT 
        casecode, 
        RegionRes, 
        AgeGroup, 
        Sex
    FROM 
        doh_covid_data_drop_20240103_04_case_info_4
)

    SELECT 
        RegionRes, 
        AgeGroup,
            CASE WHEN Sex = 'FEMALE' THEN COUNT(Sex) ELSE NULL END AS is_female,
            CASE WHEN Sex = 'MALE' THEN COUNT(Sex) ELSE NULL END AS is_male
    FROM 
        combined_data_doh
    GROUP BY 
        Sex, 
        RegionRes, 
        AgeGroup
    HAVING 
        RegionRes IS NOT NULL AND AgeGroup IS NOT NULL
    ORDER BY 
        RegionRes, 
        AgeGroup;
```

### The result:

Based on the vizualization using the population pyramid to identify what age group has the highest and lowest infection. Overall, the data showed that the age group from 25 to 29 years old appears to have the highest infection rate among males and females.

Conversely, the lowest infection rates seem to be in the following age groups: The age group from 75 to 79 years old appears to have the lowest infection rate among males and females.


![Highest_covid_spike](assets/age_group.png)

   ### Reasons for High Infection Rates in the 25 to 29 Age Group:

**High Mobility:** Individuals in this age group are typically more mobile, often commuting for work, education, and social activities, increasing their exposure to the virus.
    
**Social Interaction:** This age group tends to have a higher level of social interaction, both professionally and personally, which can lead to more opportunities for transmission.

**Workforce Participation:** Many individuals in this age group are active in the workforce, which may require them to be in environments where physical distancing is challenging.

### Age Group with the Lower Infections:

The age group 75 to 79 has the fewest infections for both males and females. This is shown by the shortest bars in this age range. Reasons for Low Infection:

**Lower Mobility:** Older adults tend to have lower levels of mobility, reducing their chances of exposure to the virus.

**Higher Caution:** This age group may be more cautious and adhere more strictly to public health guidelines due to their higher risk of severe illness from COVID-19.

**Protective Measures:** There may be more protective measures in place for this vulnerable age group, such as priority vaccination, dedicated shopping hours, and restricted visitation in care facilities. 

### 4. The year with the highest COVID cases recorded and lowest.

Using the daily cases of COVID in the line graph shown in #2 analysis. 

![Highest_covid_spike](assets/Day_highest_covid_recorded.png)
And drill up the line graph from daily to yearly we can see that in year 2022 has the highest covid cases recorded followed by 2022 and 2020. The covid started to decline in the year 2022 onwards until in 2024, the lowest record of covid cases in the Philippines.

![yearly_covid_spike](assets/yearly_line.png)

### 5. A region with the highest and lowest fatality rate.

This SQL query utilizes two CTEs (Common Table Expressions) and an inner join to calculate and rank COVID-19 fatality rates by region in the Philippines.

- **Combined_data_doh_health CTE**: This temporarily named dataset combines data from five tables (doh_covid_data_drop_20240103_04_case_info_0 to _4), selecting only cases with "DIED" in the "HealthStatus" column and a non-null "RegionRes". This focuses on confirmed deaths.


- **Province_covid CTE**: This CTE calculates the total number of confirmed COVID-19 cases (across all severities) for each region by summing the relevant columns ("conf_asym" to "conf_severe") in the "doh_covid_data_drop_20240103_05_doh_data_collect_daily_report" table.


#### Main Query: 
The main query joins the two CTEs on the region column to link the death records with the total case counts. It then groups the results by region and health status, counts the total number of deaths for each region, and calculates the fatality ratio as the percentage of deaths out of the total cases. The results are ordered by the fatality ratio in descending order.



```
WITH combined_data_doh_health AS
(
    SELECT 
        casecode, 
        RegionRes, 
        HealthStatus
    FROM 
        doh_covid_data_drop_20240103_04_case_info_0
    WHERE 
        RegionRes IS NOT NULL AND HealthStatus = 'DIED'
    UNION
    SELECT 
        casecode, 
        RegionRes, 
        HealthStatus
    FROM 
        doh_covid_data_drop_20240103_04_case_info_1
    WHERE 
        RegionRes IS NOT NULL AND HealthStatus = 'DIED'
    UNION
    SELECT 
        casecode, 
        RegionRes, 
        HealthStatus
    FROM 
        doh_covid_data_drop_20240103_04_case_info_2
    WHERE 
        RegionRes IS NOT NULL AND HealthStatus = 'DIED'
    UNION
    SELECT 
        casecode, 
        RegionRes, 
        HealthStatus
    FROM 
        doh_covid_data_drop_20240103_04_case_info_3
    WHERE 
        RegionRes IS NOT NULL AND HealthStatus = 'DIED'
    UNION
    SELECT 
        casecode, 
        RegionRes, 
        HealthStatus
    FROM 
        doh_covid_data_drop_20240103_04_case_info_4
    WHERE 
        RegionRes IS NOT NULL AND HealthStatus = 'DIED'
),

province_covid AS 
(
    SELECT 
        Region,
        SUM(conf_asym + conf_crit + conf_mild + conf_mod + conf_severe) AS Grand_TotalCasesPerRegion
    FROM 
        doh_covid_data_drop_20240103_05_doh_data_collect_daily_report
    GROUP BY 
        Region
)

    SELECT 
        RegionRes, 
        HealthStatus, 
        COUNT(HealthStatus) AS TotalStatus_died, 
        Grand_TotalCasesPerRegion, 
        ((COUNT(HealthStatus)/Grand_TotalCasesPerRegion)*100) AS Fatality_Ratio
    FROM 
        combined_data_doh_health
    INNER JOIN 
        province_covid ON combined_data_doh_health.RegionRes = province_covid.region 
    GROUP BY 
        HealthStatus, 
        RegionRes, 
        Grand_TotalCasesPerRegion
    ORDER BY 
        Fatality_Ratio DESC;
```

### The result:

The table shows COVID-19 fatalities by region in the Philippines. Highlighting that REGION VII (CENTRAL VISAYAS) has the highest fatality rate at 2.75% with 6,693 deaths out of 243,631 cases, while REGION X (NORTHERN MINDANAO) has the lowest fatality rate at 0.67% with 1,157 deaths out of 172,000 cases. 

A high fatality rate indicates a strain:

**Healthcare System Strain**: Regions with high fatality rates might be experiencing strain on their healthcare systems. This could be due to a lack of sufficient medical facilities, equipment, or healthcare personnel to effectively manage and treat COVID-19 patients.

**Underlying Health Conditions**: A higher fatality rate might suggest a higher prevalence of underlying health conditions within the population that make individuals more susceptible to severe outcomes from COVID-19.

**Delayed Medical Response**: Regions with high fatality rates may have faced delays in medical response, diagnosis, and treatment, leading to poorer outcomes for patients.

**Public Health Interventions**: A high fatality rate could indicate the need for more robust public health interventions, such as increased testing, better contact tracing, and stricter quarantine measures to control the spread of the virus and reduce mortality.


| Region | Total Died | Grand Total Cases | Fatality Ratio (%) |
|----------------|-------------|-------------|--------------------|
| REGION VII (CENTRAL VISAYAS) | 6,693 | 243,631 | 2.75 |
| REGION VI (WESTERN VISAYAS) | 5,780 | 298,495 | 1.94 |
| REGION IV-A (CALABARZON) | 6,763 | 399,994 | 1.69 |
| MIMAROPA REGION | 1,315 | 78,410 | 1.68 |
| REGION II (CAGAYAN VALLEY) | 4,961 | 296,845 | 1.67 |
| CORDILLERA ADMINISTRATIVE REGION (CAR) | 2,547 | 156,335 | 1.63 |
| REGION III (CENTRAL LUZON) | 8,812 | 564,806 | 1.56 |
| REGION XI (DAVAO REGION) | 4,022 | 261,235 | 1.54 |
| REGION XIII (CARAGA) | 1,811 | 119,053 | 1.52 |
| REGION I (ILOCOS REGION) | 3,255 | 224,844 | 1.45 |
| REGION V (BICOL REGION) | 1,235 | 102,733 | 1.20 |
| REGION XII (SOCCSKSARGEN) | 1,424 | 119,276 | 1.19 |
| REGION IX (ZAMBOANGA PENINSULA) | 1,585 | 144,662 | 1.10 |
| NATIONAL CAPITAL REGION (NCR) | 13,897 | 1,433,773 | 0.97 |
| REGION VIII (EASTERN VISAYAS) | 876 | 91,132 | 0.96 |
| BANGSAMORO AUTONOMOUS REGION IN MUSLIM MINDANAO (BARMM) | 712 | 83,653 | 0.85 |
| REGION X (NORTHERN MINDANAO) | 1,157 | 172,000 | 0.67 |



 ## ✅  Takeaways

- SQL Queries: I gained a strong understanding of Common Table Expressions (CTEs). By utilizing CTEs, I was able to efficiently filter and combine data from multiple sources for fatality rate calculations.
- Aggregate Functions: I honed my skills in using aggregate functions like COUNT and SUM, along with conditional logic (CASE WHEN) to perform granular analysis of COVID-19 cases and deaths.
- SQL Joins: This project solidified my grasp of SQL joins, particularly INNER JOIN for combining data sets based on matching values. The combination of CTEs and joins proved to be very effective for complex data manipulation.
- Analysis: I successfully translated data analysis questions into well-structured SQL queries to arrive at the desired results. This exercise reinforced the importance of proper syntax in unlocking valuable insights from data. With the resulting data, I can now delve deeper into the factors influencing regional variations in COVID-19 fatality rates.


### 🚶‍♂️ Next Steps:

 - To further enhance my analytical capabilities, I plan to explore data visualization techniques to effectively communicate these findings and gain even more comprehensive insights from the data.


#### 📍 ***This project has been a fantastic learning experience for me as an aspiring data analyst. It's solidified my foundation in SQL concepts like CTEs, aggregate functions, and joins. I especially appreciate how these tools work together for complex data manipulation. While I'm still at the beginning of my data analysis journey, I'm excited to continue exploring new tools and venturing deeper into the field. Thank you for taking the time to review my work. Your feedback is invaluable as I strive to improve my skills.***

