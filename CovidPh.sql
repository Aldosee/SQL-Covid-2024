
--Use a CTE to combine 5 tables into 1 along with UNION syntax to retrieve data without duplicate rows and query for the Gender and Age Group per Region based on COVID cases-- 

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



--Number Health Status per Region (Death)-- 
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


--Number Health Status per Region-- 
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
        RegionRes IS NOT NULL
    GROUP BY
        HealthStatus, 
        RegionRes;

--Grand Total based on symptoms per Region--
SELECT 
    region,
    SUM(conf_asym + conf_crit + conf_mild + conf_mod + conf_severe) AS Grand_TotalCasesPerRegion
FROM 
    doh_covid_data_drop_20240103_05_doh_data_collect_daily_report
GROUP BY 
    region;



--Grand Total cases based by region -> province for the POWERBI map (USE)
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


--Confirmed cases in the region per symptoms-- 
SELECT 
    region, 
    SUM(conf_asym) AS Total_conf_asym,
    SUM(conf_crit) AS Total_conf_crit,
    SUM(conf_mild) AS Total_conf_mild,
    SUM(conf_mod) AS Total_conf_mod,
    SUM(conf_severe) AS Total_conf_severe
FROM 
    doh_covid_data_drop_20240103_05_doh_data_collect_daily_report
GROUP BY 
    region;



--Daily output positive COVID test result. (USE)
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


--Confirmed cases in the province
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
    region


--Case Fatality Rate (Confimed Cases/Deaths = %Rate)
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

