-- SQL generated from markdown files

-- SQL for p2.md

CREATE TABLE stj1a4_p2_1_table (
    column_0 NUMERIC,
    panels_for_the_fourth_2_year_period NUMERIC,
    column_2 NUMERIC,
    column_3 NUMERIC,
    column_4 NUMERIC,
    column_5 NUMERIC,
    column_6 NUMERIC,
    column_7 NUMERIC,
    column_8 NUMERIC
);

;

-- SQL for p3.md

CREATE TABLE stj1a4_p3_1_urban_area_stratification (
    stratum TEXT,
    description TEXT
);

INSERT INTO stj1a4_p3_1_urban_area_stratification VALUES ('stratum 1', 'all towns with population less than 50,000');
INSERT INTO stj1a4_p3_1_urban_area_stratification VALUES ('stratum 2', 'all towns with population 50,000 or more but less than 3 lakhs');
INSERT INTO stj1a4_p3_1_urban_area_stratification VALUES ('stratum 3', 'all towns with population 3 lakhs or more but less than 15 lakhs');
INSERT INTO stj1a4_p3_1_urban_area_stratification VALUES ('stratum 4, 5, 6,...', 'each city with population 15 lakhs or more');;

-- SQL for p4.md

CREATE TABLE stj1a4_p4_1_hamlet_groups_and_sample_population (
    approximate_present_population_of_the_sample_fsu TEXT,
    no_of_hgs_sbs_to_be_formed NUMERIC
);

INSERT INTO stj1a4_p4_1_hamlet_groups_and_sample_population VALUES ('less than 1200 (no hamlet-groups/sub-blocks)', 1);
INSERT INTO stj1a4_p4_1_hamlet_groups_and_sample_population VALUES ('1200 to 1799', 3);
INSERT INTO stj1a4_p4_1_hamlet_groups_and_sample_population VALUES ('1800 to 2399', 4);
INSERT INTO stj1a4_p4_1_hamlet_groups_and_sample_population VALUES ('2400 to 2999', 5);
INSERT INTO stj1a4_p4_1_hamlet_groups_and_sample_population VALUES ('3000 to 3599', 6);
INSERT INTO stj1a4_p4_1_hamlet_groups_and_sample_population VALUES ('.....and so on', NULL);;

CREATE TABLE stj1a4_p4_2_hamlet_groups_and_sample_population_rural_areas (
    approximate_present_population_of_the_sample_village NUMERIC,
    no_of_hgs_to_be_formed NUMERIC
);

INSERT INTO stj1a4_p4_2_hamlet_groups_and_sample_population_rural_areas VALUES (NULL, 4);;

-- SQL for p5.md

CREATE TABLE stj1a4_p5_1_sample_design_estimation_procedure (
    range TEXT,
    description TEXT,
    value NUMERIC
);

INSERT INTO stj1a4_p5_1_sample_design_estimation_procedure VALUES ('less than 600', '(no hamlet-groups)', 1);
INSERT INTO stj1a4_p5_1_sample_design_estimation_procedure VALUES ('600 to 899', NULL, 3);
INSERT INTO stj1a4_p5_1_sample_design_estimation_procedure VALUES ('900 to 1199', NULL, 4);
INSERT INTO stj1a4_p5_1_sample_design_estimation_procedure VALUES ('1200 to 1499', NULL, 5);
INSERT INTO stj1a4_p5_1_sample_design_estimation_procedure VALUES ('1500 to 1799', NULL, 6);
INSERT INTO stj1a4_p5_1_sample_design_estimation_procedure VALUES ('...and so on', NULL, NULL);;

CREATE TABLE stj1a4_p5_2_rural_sss_composition_and_survey (
    unique_id INTEGER PRIMARY KEY,
    composition_of_sss_rural TEXT,
    sss TEXT,
    number_of_members TEXT,
    fsu_without_hg_formation NUMERIC,
    fsu_with_hg_formation_for_each_hg NUMERIC
);

INSERT INTO stj1a4_p5_2_rural_sss_composition_and_survey VALUES (1, 'number of members in the household having level of general education as secondary (10th standard) or above', 'sss 1', '2 or more', 2, 1);
INSERT INTO stj1a4_p5_2_rural_sss_composition_and_survey VALUES (2, NULL, 'sss 2', 1, 4, 2);
INSERT INTO stj1a4_p5_2_rural_sss_composition_and_survey VALUES (3, NULL, 'sss 3', 0, 2, 1);
INSERT INTO stj1a4_p5_2_rural_sss_composition_and_survey VALUES (4, 'total', NULL, NULL, NULL, 8);;

CREATE TABLE stj1a4_p5_3_urban_sss_composition_and_survey (
    unique_id INTEGER PRIMARY KEY,
    composition_of_sss_urban TEXT,
    sss TEXT,
    number_of_members TEXT,
    fsu_without_sb_formation NUMERIC,
    fsu_with_sb_formation_for_each_sb NUMERIC
);

INSERT INTO stj1a4_p5_3_urban_sss_composition_and_survey VALUES (1, 'number of members in the household having level of general education as secondary (10th standard) or above', 'sss 1', '3 or more', 2, 1);
INSERT INTO stj1a4_p5_3_urban_sss_composition_and_survey VALUES (2, NULL, 'sss 2', 2, 2, 1);
INSERT INTO stj1a4_p5_3_urban_sss_composition_and_survey VALUES (3, NULL, 'sss 3', 1, 2, 1);
INSERT INTO stj1a4_p5_3_urban_sss_composition_and_survey VALUES (4, NULL, 'sss 4', 0, 2, 1);
INSERT INTO stj1a4_p5_3_urban_sss_composition_and_survey VALUES (5, 'total', NULL, NULL, NULL, 8);;

-- SQL for p11.md

CREATE TABLE stj1a4_p11_1_allocation_of_sample_villages_blocks (
    state_ut TEXT,
    total NUMERIC,
    rural NUMERIC,
    urban NUMERIC
);

INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Andhra Pradesh', 496, 272, 224);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Arunachal Pradesh', 216, 136, 80);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Assam', 440, 328, 112);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Bihar', 568, 400, 168);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Chhattisgarh', 280, 176, 104);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Delhi', 128, 8, 120);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Goa', 56, 24, 32);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Gujarat', 440, 208, 232);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Haryana', 328, 168, 160);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Himachal Pradesh', 256, 208, 48);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Jharkhand', 344, 208, 136);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Karnataka', 520, 224, 296);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Kerala', 568, 264, 304);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Madhya Pradesh', 584, 336, 248);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Maharashtra', 1008, 448, 560);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Manipur', 320, 160, 160);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Meghalaya', 160, 104, 56);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Mizoram', 192, 64, 128);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Nagaland', 128, 72, 56);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Odisha', 496, 360, 136);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Punjab', 400, 192, 208);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Rajasthan', 528, 312, 216);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Sikkim', 96, 56, 40);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Tamil Nadu', 832, 392, 440);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Telangana', 360, 160, 200);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Tripura', 232, 152, 80);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Uttarakhand', 216, 120, 96);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Uttar Pradesh', 1136, 728, 408);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('West Bengal', 800, 424, 376);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Andaman & N. Island', 64, 32, 32);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Chandigarh(*)', 48, 0, 48);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Dadra & Nagar Haveli & Daman & Diu', 40, 16, 24);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Jammu & Kashmir', 392, 224, 168);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Ladakh', 32, 16, 16);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Lakshadweep', 24, 8, 16);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('Puducherry', 72, 16, 56);
INSERT INTO stj1a4_p11_1_allocation_of_sample_villages_blocks VALUES ('all-India', 12800, 7016, 5784);;

