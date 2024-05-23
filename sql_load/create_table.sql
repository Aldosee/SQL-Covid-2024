-- Create table for list of confirmed COVID-19 from DOH Epidemiological Bureau
CREATE TABLE public.DOH_COVID_Data_Drop_20240103_04_Case_Info_0
(
    CaseCode TEXT,
    Age INT,
    AgeGroup TEXT,
    Sex TEXT,
    DateSpecimen DATE,
    DateResultRelease DATE,
    DateRepConf DATE,
    DateDied DATE,
    DateRecover DATE,
    RemovalType TEXT,
    DateRepRem DATE,
    Admitted BOOLEAN,
    RegionRes TEXT,
    ProvRes TEXT,
    CityMuniRes TEXT,
    CityMuniPSGC TEXT,
    BarangayRes TEXT,
    BarangayPSGC TEXT,
    HealthStatus TEXT,
    Quarantined BOOLEAN,
    DateOnset DATE,
    Pregnanttab BOOLEAN,
    ValidationStatus TEXT

);

--An error occured (invalid input syntax for type date: "RECOVERED") change the data type from date to TEXT (str)
ALTER TABLE public.DOH_COVID_Data_Drop_20240103_04_Case_Info_0
ALTER COLUMN RemovalType SET DATA TYPE TEXT;


CREATE TABLE public.DOH_COVID_Data_Drop_20240103_04_Case_Info_1
(
    CaseCode TEXT,
    Age INT,
    AgeGroup TEXT,
    Sex TEXT,
    DateSpecimen DATE,
    DateResultRelease DATE,
    DateRepConf DATE,
    DateDied DATE,
    DateRecover DATE,
    RemovalType TEXT,
    DateRepRem DATE,
    Admitted BOOLEAN,
    RegionRes TEXT,
    ProvRes TEXT,
    CityMuniRes TEXT,
    CityMuniPSGC TEXT,
    BarangayRes TEXT,
    BarangayPSGC TEXT,
    HealthStatus TEXT,
    Quarantined BOOLEAN,
    DateOnset DATE,
    Pregnanttab BOOLEAN,
    ValidationStatus TEXT

);

CREATE TABLE public.DOH_COVID_Data_Drop_20240103_04_Case_Info_2
(
    CaseCode TEXT,
    Age INT,
    AgeGroup TEXT,
    Sex TEXT,
    DateSpecimen DATE,
    DateResultRelease DATE,
    DateRepConf DATE,
    DateDied DATE,
    DateRecover DATE,
    RemovalType TEXT,
    DateRepRem DATE,
    Admitted BOOLEAN,
    RegionRes TEXT,
    ProvRes TEXT,
    CityMuniRes TEXT,
    CityMuniPSGC TEXT,
    BarangayRes TEXT,
    BarangayPSGC TEXT,
    HealthStatus TEXT,
    Quarantined BOOLEAN,
    DateOnset DATE,
    Pregnanttab BOOLEAN,
    ValidationStatus TEXT

);

CREATE TABLE public.DOH_COVID_Data_Drop_20240103_04_Case_Info_3
(
    CaseCode TEXT,
    Age INT,
    AgeGroup TEXT,
    Sex TEXT,
    DateSpecimen DATE,
    DateResultRelease DATE,
    DateRepConf DATE,
    DateDied DATE,
    DateRecover DATE,
    RemovalType TEXT,
    DateRepRem DATE,
    Admitted BOOLEAN,
    RegionRes TEXT,
    ProvRes TEXT,
    CityMuniRes TEXT,
    CityMuniPSGC TEXT,
    BarangayRes TEXT,
    BarangayPSGC TEXT,
    HealthStatus TEXT,
    Quarantined BOOLEAN,
    DateOnset DATE,
    Pregnanttab BOOLEAN,
    ValidationStatus TEXT

);

CREATE TABLE public.DOH_COVID_Data_Drop_20240103_04_Case_Info_4
(
    CaseCode TEXT,
    Age INT,
    AgeGroup TEXT,
    Sex TEXT,
    DateSpecimen DATE,
    DateResultRelease DATE,
    DateRepConf DATE,
    DateDied DATE,
    DateRecover DATE,
    RemovalType TEXT,
    DateRepRem DATE,
    Admitted BOOLEAN,
    RegionRes TEXT,
    ProvRes TEXT,
    CityMuniRes TEXT,
    CityMuniPSGC TEXT,
    BarangayRes TEXT,
    BarangayPSGC TEXT,
    HealthStatus TEXT,
    Quarantined BOOLEAN,
    DateOnset DATE,
    Pregnanttab BOOLEAN,
    ValidationStatus TEXT

);

CREATE TABLE public.DOH_COVID_Data_Drop_20240103_05_DOH_Data_Collect_Daily_Report
(
    hfhudcode TEXT,
    id NUMERIC,
    cfname TEXT,
    updateddate DATE,
    addeddate DATE,
    reportdate DATE,
    icu_v NUMERIC,
    icu_o NUMERIC,
    nonicu_v NUMERIC,
    nonicu_o NUMERIC,
    mechvent_v NUMERIC,
    mechvent_o NUMERIC,
    icu_v_nc NUMERIC,
    icu_o_nc NUMERIC,
    nonicu_v_nc NUMERIC,
    nonicu_o_nc NUMERIC,
    mechvent_v_nc NUMERIC,
    mechvent_o_nc NUMERIC,
    icu_o_for_vx NUMERIC,
    icu_o_for_nv NUMERIC,
    icu_o_with_vx NUMERIC,
    icu_o_with_nv NUMERIC,
    nonicu_o_for NUMERIC,
    nonicu_o_with NUMERIC,
    susp_asym NUMERIC,
    susp_mild NUMERIC,
    susp_severe NUMERIC,
    susp_crit NUMERIC,
    susp_mod NUMERIC,
    prob_asym NUMERIC,
    prob_mild NUMERIC,
    prob_severe NUMERIC,
    prob_crit NUMERIC,
    prob_mod NUMERIC,
    conf_asym NUMERIC,
    conf_mild NUMERIC,
    conf_severe NUMERIC,
    conf_crit NUMERIC,
    conf_mod NUMERIC,
    region TEXT,
    region_psgc TEXT,
    province_psgc TEXT,
    city_mun_psgc TEXT,
    province TEXT,
    city_mun TEXT,
    north_coord NUMERIC

);

CREATE TABLE public.DOH_COVID_Data_Drop_20240103_07_Testing_Aggregates
(
    facility_name TEXT,
    report_date DATE,
    avg_turnaround_time NUMERIC,
    daily_output_samples_tested NUMERIC,
    daily_output_unique_individuals NUMERIC,
    daily_output_positive_individuals NUMERIC,
    daily_output_negative_individuals NUMERIC,
    daily_output_equivocal NUMERIC,
    daily_output_invalid NUMERIC,
    remaining_available_tests NUMERIC,
    backlogs NUMERIC,
    cumulative_samples_tested NUMERIC,
    cumulative_unique_individuals NUMERIC,
    cumulative_positive_individuals NUMERIC,
    cumulative_negative_individuals NUMERIC,
    pct_positive_cumulative NUMERIC,
    pct_negative_cumulative NUMERIC,
    validation_status TEXT

);



-- Set ownership of the tables to the postgres user
ALTER TABLE public.DOH_COVID_Data_Drop_20240103_04_Case_Info_0 OWNER to postgres;
ALTER TABLE public.DOH_COVID_Data_Drop_20240103_04_Case_Info_1 OWNER to postgres;
ALTER TABLE public.DOH_COVID_Data_Drop_20240103_04_Case_Info_2 OWNER to postgres;
ALTER TABLE public.DOH_COVID_Data_Drop_20240103_04_Case_Info_3 OWNER to postgres;
ALTER TABLE public.DOH_COVID_Data_Drop_20240103_04_Case_Info_4 OWNER to postgres;
ALTER TABLE public.DOH_COVID_Data_Drop_20240103_05_DOH_Data_Collect_Daily_Report OWNER to postgres;
ALTER TABLE public.DOH_COVID_Data_Drop_20240103_07_Testing_Aggregates OWNER to postgres;



