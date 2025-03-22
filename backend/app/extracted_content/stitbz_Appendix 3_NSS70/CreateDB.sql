-- SQL generated from markdown files

-- SQL for p27.md

CREATE TABLE stitbz_p27_1_urban_sector_sub_stratum_size_allocation (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p27_1_urban_sector_sub_stratum_size_allocation VALUES (1, 322, 13, 'Kollam', 13, 1, 580, 6, 6);
INSERT INTO stitbz_p27_1_urban_sector_sub_stratum_size_allocation VALUES (2, 322, 13, 'Kollam', 13, 2, 734, 6, 6);
INSERT INTO stitbz_p27_1_urban_sector_sub_stratum_size_allocation VALUES (3, 322, 14, 'Thiruvananthapuram', 14, 1, 652, 6, 6);
INSERT INTO stitbz_p27_1_urban_sector_sub_stratum_size_allocation VALUES (4, 322, 14, 'Thiruvananthapuram', 14, 2, 1716, 12, 12);
INSERT INTO stitbz_p27_1_urban_sector_sub_stratum_size_allocation VALUES (5, NULL, NULL, 'State Total', NULL, NULL, 18044, 160, 160);;

CREATE TABLE stitbz_p27_2_urban_sector_sub_stratum_size_allocation_tamilnadu (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p27_2_urban_sector_sub_stratum_size_allocation_tamilnadu VALUES (1, 331, 01, 'Thiruvallur', 01, 1, 1433, 4, 4);
INSERT INTO stitbz_p27_2_urban_sector_sub_stratum_size_allocation_tamilnadu VALUES (2, 331, 01, 'Thiruvallur', 01, 2, 3431, 10, 10);
INSERT INTO stitbz_p27_2_urban_sector_sub_stratum_size_allocation_tamilnadu VALUES (3, 331, 03, 'Kancheepuram', 03, 1, 2121, 6, 6);
INSERT INTO stitbz_p27_2_urban_sector_sub_stratum_size_allocation_tamilnadu VALUES (4, 331, 03, 'Kancheepuram', 03, 2, 3637, 8, 8);
INSERT INTO stitbz_p27_2_urban_sector_sub_stratum_size_allocation_tamilnadu VALUES (5, 331, 04, 'Vellore', 04, 1, 1481, 6, 6);
INSERT INTO stitbz_p27_2_urban_sector_sub_stratum_size_allocation_tamilnadu VALUES (6, 331, 04, 'Vellore', 04, 2, 1320, 6, 6);
INSERT INTO stitbz_p27_2_urban_sector_sub_stratum_size_allocation_tamilnadu VALUES (7, 334, 05, 'Dharmapuri', 05, 1, 297, 2, 2);
INSERT INTO stitbz_p27_2_urban_sector_sub_stratum_size_allocation_tamilnadu VALUES (8, 334, 05, 'Dharmapuri', 05, 2, 90, 2, 2);
INSERT INTO stitbz_p27_2_urban_sector_sub_stratum_size_allocation_tamilnadu VALUES (9, 331, 06, 'Tiruvanamalai', 06, 1, 468, 2, 2);
INSERT INTO stitbz_p27_2_urban_sector_sub_stratum_size_allocation_tamilnadu VALUES (10, 331, 06, 'Tiruvanamalai', 06, 2, 337, 2, 2);
INSERT INTO stitbz_p27_2_urban_sector_sub_stratum_size_allocation_tamilnadu VALUES (11, 331, 07, 'Viluppuram', 07, 1, 507, 2, 2);
INSERT INTO stitbz_p27_2_urban_sector_sub_stratum_size_allocation_tamilnadu VALUES (12, 331, 07, 'Viluppuram', 07, 2, 251, 2, 2);
INSERT INTO stitbz_p27_2_urban_sector_sub_stratum_size_allocation_tamilnadu VALUES (13, 334, 08, 'Salem', 08, 1, 1302, 6, 6);
INSERT INTO stitbz_p27_2_urban_sector_sub_stratum_size_allocation_tamilnadu VALUES (14, 334, 08, 'Salem', 08, 2, 1529, 6, 6);
INSERT INTO stitbz_p27_2_urban_sector_sub_stratum_size_allocation_tamilnadu VALUES (15, 334, 09, 'Namakkal', 09, 1, 672, 2, 2);
INSERT INTO stitbz_p27_2_urban_sector_sub_stratum_size_allocation_tamilnadu VALUES (16, 334, 09, 'Namakkal', 09, 2, 457, 2, 2);
INSERT INTO stitbz_p27_2_urban_sector_sub_stratum_size_allocation_tamilnadu VALUES (17, 334, 10, 'Erode', 10, 1, 1775, 4, 4);
INSERT INTO stitbz_p27_2_urban_sector_sub_stratum_size_allocation_tamilnadu VALUES (18, 334, 10, 'Erode', 10, 2, 873, 4, 4);
INSERT INTO stitbz_p27_2_urban_sector_sub_stratum_size_allocation_tamilnadu VALUES (19, 334, 11, 'The Nilgiris', 11, 1, 503, 2, 2);
INSERT INTO stitbz_p27_2_urban_sector_sub_stratum_size_allocation_tamilnadu VALUES (20, 334, 11, 'The Nilgiris', 11, 2, 263, 2, 2);
INSERT INTO stitbz_p27_2_urban_sector_sub_stratum_size_allocation_tamilnadu VALUES (21, 334, 12, 'Coimbatore', 12, 1, 2126, 6, 6);
INSERT INTO stitbz_p27_2_urban_sector_sub_stratum_size_allocation_tamilnadu VALUES (22, 334, 12, 'Coimbatore', 12, 2, 2589, 6, 6);
INSERT INTO stitbz_p27_2_urban_sector_sub_stratum_size_allocation_tamilnadu VALUES (23, 333, 13, 'Dindigul', 13, 1, 941, 4, 4);
INSERT INTO stitbz_p27_2_urban_sector_sub_stratum_size_allocation_tamilnadu VALUES (24, 333, 13, 'Dindigul', 13, 2, 468, 2, 2);
INSERT INTO stitbz_p27_2_urban_sector_sub_stratum_size_allocation_tamilnadu VALUES (25, 332, 14, 'Karur', 14, 1, 521, 2, 2);
INSERT INTO stitbz_p27_2_urban_sector_sub_stratum_size_allocation_tamilnadu VALUES (26, 332, 14, 'Karur', 14, 2, 345, 2, 2);
INSERT INTO stitbz_p27_2_urban_sector_sub_stratum_size_allocation_tamilnadu VALUES (27, 332, 15, 'Tiruchirappalli', 15, 1, 875, 4, 4);
INSERT INTO stitbz_p27_2_urban_sector_sub_stratum_size_allocation_tamilnadu VALUES (28, 332, 15, 'Tiruchirappalli', 15, 2, 1647, 4, 4);
INSERT INTO stitbz_p27_2_urban_sector_sub_stratum_size_allocation_tamilnadu VALUES (29, 332, 16, 'Perambalur', 16, 1, 164, 2, 2);
INSERT INTO stitbz_p27_2_urban_sector_sub_stratum_size_allocation_tamilnadu VALUES (30, 332, 17, 'Ariyalur', 17, 1, 188, 2, 2);;

-- SQL for p13.md

CREATE TABLE stitbz_p13_1_sub_stratum_size_and_allocation_urban_sector (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p13_1_sub_stratum_size_and_allocation_urban_sector VALUES (1, 171, 02, 'East Garo Hills', 02, 1, 61, 4, 4);
INSERT INTO stitbz_p13_1_sub_stratum_size_and_allocation_urban_sector VALUES (2, 171, 03, 'South Garo Hills', 03, 1, 20, 2, 2);
INSERT INTO stitbz_p13_1_sub_stratum_size_and_allocation_urban_sector VALUES (3, 171, 04, 'West Khasi Hills', 04, 1, 88, 4, 4);
INSERT INTO stitbz_p13_1_sub_stratum_size_and_allocation_urban_sector VALUES (4, 171, 05, 'Ri Bhoi', 05, 1, 40, 2, 2);
INSERT INTO stitbz_p13_1_sub_stratum_size_and_allocation_urban_sector VALUES (5, 171, 06, 'East Khasi Hills', 06, 1, 313, 8, 8);
INSERT INTO stitbz_p13_1_sub_stratum_size_and_allocation_urban_sector VALUES (6, 171, 06, 'East Khasi Hills', 06, 2, 377, 8, 8);
INSERT INTO stitbz_p13_1_sub_stratum_size_and_allocation_urban_sector VALUES (7, 171, 07, 'Jaintia Hills', 07, 1, 65, 2, 2);
INSERT INTO stitbz_p13_1_sub_stratum_size_and_allocation_urban_sector VALUES (8, NULL, NULL, 'State Total', NULL, NULL, 1061, 36, 36);;

CREATE TABLE stitbz_p13_2_sub_stratum_size_and_allocation_assam_urban_sector (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p13_2_sub_stratum_size_and_allocation_assam_urban_sector VALUES (1, 182, 01, 'Kokrajhar', 01, 1, 102, 2, 2);
INSERT INTO stitbz_p13_2_sub_stratum_size_and_allocation_assam_urban_sector VALUES (2, 182, 02, 'Dhubri', 02, 1, 197, 2, 2);
INSERT INTO stitbz_p13_2_sub_stratum_size_and_allocation_assam_urban_sector VALUES (3, 182, 02, 'Dhubri', 02, 2, 109, 2, 2);
INSERT INTO stitbz_p13_2_sub_stratum_size_and_allocation_assam_urban_sector VALUES (4, 182, 03, 'Goalpara', 03, 1, 186, 2, 2);
INSERT INTO stitbz_p13_2_sub_stratum_size_and_allocation_assam_urban_sector VALUES (5, 182, 04, 'Bongaigaon', 04, 1, 147, 2, 2);
INSERT INTO stitbz_p13_2_sub_stratum_size_and_allocation_assam_urban_sector VALUES (6, 182, 05, 'Barpeta', 05, 1, 251, 2, 2);
INSERT INTO stitbz_p13_2_sub_stratum_size_and_allocation_assam_urban_sector VALUES (7, 182, 06, 'Kamrup', 06, 1, 405, 2, 2);
INSERT INTO stitbz_p13_2_sub_stratum_size_and_allocation_assam_urban_sector VALUES (8, 182, 07, 'Nalbari', 07, 1, 147, 2, 2);
INSERT INTO stitbz_p13_2_sub_stratum_size_and_allocation_assam_urban_sector VALUES (9, 184, 08, 'Darrang', 08, 1, 85, 2, 2);
INSERT INTO stitbz_p13_2_sub_stratum_size_and_allocation_assam_urban_sector VALUES (10, 184, 09, 'Marigaon', 09, 1, 162, 2, 2);
INSERT INTO stitbz_p13_2_sub_stratum_size_and_allocation_assam_urban_sector VALUES (11, 184, 10, 'Nagaon', 10, 1, 405, 2, 2);
INSERT INTO stitbz_p13_2_sub_stratum_size_and_allocation_assam_urban_sector VALUES (12, 184, 10, 'Nagaon', 10, 2, 196, 2, 2);
INSERT INTO stitbz_p13_2_sub_stratum_size_and_allocation_assam_urban_sector VALUES (13, 184, 11, 'Sonitpur', 11, 1, 232, 2, 2);
INSERT INTO stitbz_p13_2_sub_stratum_size_and_allocation_assam_urban_sector VALUES (14, 181, 12, 'Lakhimpur', 12, 1, 76, 2, 2);
INSERT INTO stitbz_p13_2_sub_stratum_size_and_allocation_assam_urban_sector VALUES (15, 181, 13, 'Dhemaji', 13, 1, 83, 2, 2);
INSERT INTO stitbz_p13_2_sub_stratum_size_and_allocation_assam_urban_sector VALUES (16, 181, 14, 'Tinsukia', 14, 1, 309, 2, 2);
INSERT INTO stitbz_p13_2_sub_stratum_size_and_allocation_assam_urban_sector VALUES (17, 181, 14, 'Tinsukia', 14, 2, 192, 2, 2);
INSERT INTO stitbz_p13_2_sub_stratum_size_and_allocation_assam_urban_sector VALUES (18, 181, 15, 'Dibrugarh', 15, 1, 148, 2, 2);
INSERT INTO stitbz_p13_2_sub_stratum_size_and_allocation_assam_urban_sector VALUES (19, 181, 15, 'Dibrugarh', 15, 2, 239, 2, 2);
INSERT INTO stitbz_p13_2_sub_stratum_size_and_allocation_assam_urban_sector VALUES (20, 181, 16, 'Sibsagar', 16, 1, 168, 2, 2);
INSERT INTO stitbz_p13_2_sub_stratum_size_and_allocation_assam_urban_sector VALUES (21, 181, 17, 'Jorhat', 17, 1, 147, 2, 2);
INSERT INTO stitbz_p13_2_sub_stratum_size_and_allocation_assam_urban_sector VALUES (22, 181, 17, 'Jorhat', 17, 2, 229, 2, 2);
INSERT INTO stitbz_p13_2_sub_stratum_size_and_allocation_assam_urban_sector VALUES (23, 181, 18, 'Golaghat', 18, 1, 172, 2, 2);
INSERT INTO stitbz_p13_2_sub_stratum_size_and_allocation_assam_urban_sector VALUES (24, 183, 19, 'Karbi Anglong', 19, 1, 180, 2, 2);
INSERT INTO stitbz_p13_2_sub_stratum_size_and_allocation_assam_urban_sector VALUES (25, 183, 20, 'North Cachar Hills', 20, 1, 107, 2, 2);
INSERT INTO stitbz_p13_2_sub_stratum_size_and_allocation_assam_urban_sector VALUES (26, 183, 21, 'Cachar', 21, 1, 252, 2, 2);
INSERT INTO stitbz_p13_2_sub_stratum_size_and_allocation_assam_urban_sector VALUES (27, 183, 21, 'Cachar', 21, 2, 264, 2, 2);;

-- SQL for p8.md

CREATE TABLE stitbz_p8_1_sub_stratum_size_allocation_urban (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (1, 092, 26, 'Unnao', 26, 2, 392, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (2, 092, 27, 'Lucknow', 27, 1, 482, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (3, 092, 28, 'Rae Bareli', 28, 1, 177, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (4, 092, 28, 'Rae Bareli', 28, 2, 253, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (5, 095, 29, 'Farrukhabad', 29, 1, 522, 4, 4);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (6, 095, 30, 'Kannauj', 30, 1, 273, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (7, 095, 30, 'Kannauj', 30, 2, 133, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (8, 095, 31, 'Etawah', 31, 1, 166, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (9, 095, 31, 'Etawah', 31, 2, 375, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (10, 095, 32, 'Auraiya', 32, 1, 336, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (11, 092, 33, 'Kanpur Dehat', 33, 1, 288, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (12, 092, 34, 'Kanpur Nagar', 34, 1, 409, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (13, 094, 35, 'Jalaun', 35, 1, 336, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (14, 094, 35, 'Jalaun', 35, 2, 250, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (15, 094, 36, 'Jhansi', 36, 1, 423, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (16, 094, 36, 'Jhansi', 36, 2, 996, 6, 6);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (17, 094, 37, 'Lalitpur', 37, 1, 275, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (18, 094, 38, 'Hamirpur', 38, 1, 282, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (19, 094, 39, 'Mahoba', 39, 1, 250, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (20, 094, 40, 'Banda', 40, 1, 397, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (21, 094, 41, 'Chitrakoot', 41, 1, 151, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (22, 092, 42, 'Fatehpur', 42, 1, 195, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (23, 092, 42, 'Fatehpur', 42, 2, 283, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (24, 093, 43, 'Pratapgarh', 43, 1, 273, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (25, 093, 44, 'Kaushambi', 44, 1, 192, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (26, 093, 45, 'Allahabad', 45, 1, 507, 4, 4);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (27, 092, 46, 'Barabanki', 46, 1, 468, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (28, 092, 46, 'Barabanki', 46, 2, 141, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (29, 093, 47, 'Faizabad', 47, 1, 201, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (30, 093, 47, 'Faizabad', 47, 2, 283, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (31, 093, 48, 'Ambedkar Nagar', 48, 1, 122, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (32, 093, 48, 'Ambedkar Nagar', 48, 2, 273, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (33, 093, 49, 'Sultanpur', 49, 1, 375, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (34, 093, 50, 'Bahraich', 50, 1, 152, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (35, 093, 50, 'Bahraich', 50, 2, 279, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (36, 093, 51, 'Shrawasti', 51, 1, 55, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (37, 093, 52, 'Balrampur', 52, 1, 223, 2, 2);
INSERT INTO stitbz_p8_1_sub_stratum_size_allocation_urban VALUES (38, 093, 53, 'Gonda', 53, 1, 321, 2, 2);;

-- SQL for p17.md

CREATE TABLE stitbz_p17_1_substratum_size_allocation_urban_sector (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region TEXT,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (1, 212, 21, 'Kandhamal Phoolbani', 21, 1, 107, 2, 2);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (2, 212, 22, 'Baudh', 22, 1, 29, 2, 2);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (3, 212, 23, 'Sonapur', 23, 1, 117, 2, 2);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (4, 212, 24, 'Balangir', 24, 1, 357, 2, 2);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (5, 212, 25, 'Nuapada', 25, 1, 47, 2, 2);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (6, 212, 26, 'Kalahandi', 26, 1, 198, 2, 2);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (7, 212, 27, 'Rayagada', 27, 1, 243, 2, 2);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (8, 212, 28, 'Nabarangapur', 28, 1, 116, 2, 2);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (9, 212, 29, 'Koraput', 29, 1, 157, 2, 2);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (10, 212, 29, 'Koraput', 29, 2, 208, 2, 2);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (11, 212, 30, 'Malkangiri', 30, 1, 72, 2, 2);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (12, NULL, NULL, 'State Total', NULL, NULL, 12209, 84, 84);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (13, 'chhhattisgarh_22', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (14, 221, 01, 'Koriya', 01, 1, 415, 2, 2);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (15, 221, 02, 'Surguja', 02, 1, 367, 2, 2);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (16, 222, 03, 'Jashpur', 03, 1, 124, 2, 2);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (17, 222, 04, 'Raigarh', 04, 1, 378, 2, 2);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (18, 222, 05, 'Korba', 05, 1, 116, 2, 2);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (19, 222, 05, 'Korba', 05, 2, 542, 2, 2);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (20, 222, 06, 'Janjgir - Champa', 06, 1, 397, 2, 2);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (21, 222, 07, 'Bilaspur', 07, 1, 551, 2, 2);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (22, 222, 07, 'Bilaspur', 07, 2, 480, 2, 2);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (23, 222, 08, 'Kawardha', 08, 1, 144, 2, 2);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (24, 222, 09, 'Rajnandgaon', 09, 1, 416, 2, 2);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (25, 222, 10, 'Durg', 10, 1, 440, 2, 2);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (26, 222, 10, 'Durg', 10, 2, 1764, 6, 6);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (27, 222, 11, 'Raipur', 11, 1, 566, 2, 2);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (28, 222, 11, 'Raipur', 11, 2, 122, 2, 2);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (29, 222, 12, 'Mahasamund', 12, 1, 182, 2, 2);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (30, 222, 13, 'Dhamtari', 13, 1, 214, 2, 2);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (31, 223, 14, 'Kanker', 14, 1, 124, 2, 2);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (32, 223, 15, 'Bastar', 15, 1, 255, 2, 2);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (33, 223, 16, 'Dantewada', 16, 1, 131, 2, 2);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (34, 223, 17, 'Narayanpur', 17, 1, 21, 2, 2);
INSERT INTO stitbz_p17_1_substratum_size_allocation_urban_sector VALUES (35, 223, 18, 'Bijapur', 18, 1, 28, 2, 2);;

-- SQL for p23.md

CREATE TABLE stitbz_p23_1_urban_sector_sub_stratum_size_allocation (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p23_1_urban_sector_sub_stratum_size_allocation VALUES (1, 272, 25, 'Pune', 25, 2, 818, 4, 4);
INSERT INTO stitbz_p23_1_urban_sector_sub_stratum_size_allocation VALUES (2, 272, 26, 'Ahmadnagar', 26, 1, 497, 2, 4);
INSERT INTO stitbz_p23_1_urban_sector_sub_stratum_size_allocation VALUES (3, 272, 26, 'Ahmadnagar', 26, 2, 760, 4, 6);
INSERT INTO stitbz_p23_1_urban_sector_sub_stratum_size_allocation VALUES (4, 274, 27, 'Bid', 27, 1, 259, 2, 2);
INSERT INTO stitbz_p23_1_urban_sector_sub_stratum_size_allocation VALUES (5, 274, 27, 'Bid', 27, 2, 619, 2, 4);
INSERT INTO stitbz_p23_1_urban_sector_sub_stratum_size_allocation VALUES (6, 274, 28, 'Latur', 28, 1, 226, 2, 2);
INSERT INTO stitbz_p23_1_urban_sector_sub_stratum_size_allocation VALUES (7, 274, 28, 'Latur', 28, 2, 743, 2, 4);
INSERT INTO stitbz_p23_1_urban_sector_sub_stratum_size_allocation VALUES (8, 274, 29, 'Osmanabad', 29, 1, 366, 2, 4);
INSERT INTO stitbz_p23_1_urban_sector_sub_stratum_size_allocation VALUES (9, 272, 30, 'Solapur', 30, 1, 284, 2, 4);
INSERT INTO stitbz_p23_1_urban_sector_sub_stratum_size_allocation VALUES (10, 272, 30, 'Solapur', 30, 2, 1835, 8, 12);
INSERT INTO stitbz_p23_1_urban_sector_sub_stratum_size_allocation VALUES (11, 272, 31, 'Satara', 31, 1, 549, 2, 4);
INSERT INTO stitbz_p23_1_urban_sector_sub_stratum_size_allocation VALUES (12, 272, 31, 'Satara', 31, 2, 296, 2, 2);
INSERT INTO stitbz_p23_1_urban_sector_sub_stratum_size_allocation VALUES (13, 271, 32, 'Ratnagiri', 32, 1, 413, 2, 2);
INSERT INTO stitbz_p23_1_urban_sector_sub_stratum_size_allocation VALUES (14, 271, 33, 'Sindhudurg', 33, 1, 167, 2, 2);
INSERT INTO stitbz_p23_1_urban_sector_sub_stratum_size_allocation VALUES (15, 272, 34, 'Kolhapur', 34, 1, 590, 4, 4);
INSERT INTO stitbz_p23_1_urban_sector_sub_stratum_size_allocation VALUES (16, 272, 34, 'Kolhapur', 34, 2, 1062, 4, 8);
INSERT INTO stitbz_p23_1_urban_sector_sub_stratum_size_allocation VALUES (17, 272, 35, 'Sangli', 35, 1, 256, 2, 4);
INSERT INTO stitbz_p23_1_urban_sector_sub_stratum_size_allocation VALUES (18, 272, 35, 'Sangli', 35, 2, 610, 4, 4);
INSERT INTO stitbz_p23_1_urban_sector_sub_stratum_size_allocation VALUES (19, 275, 09, 'Nagpur', 36, 1, 3981, 16, 24);
INSERT INTO stitbz_p23_1_urban_sector_sub_stratum_size_allocation VALUES (20, 274, 19, 'Aurangabad', 37, 1, 1654, 8, 12);
INSERT INTO stitbz_p23_1_urban_sector_sub_stratum_size_allocation VALUES (21, 273, 20, 'Nashik', 38, 1, 2097, 10, 14);
INSERT INTO stitbz_p23_1_urban_sector_sub_stratum_size_allocation VALUES (22, 271, 21, 'Thane', 39, 1, 2136, 12, 18);
INSERT INTO stitbz_p23_1_urban_sector_sub_stratum_size_allocation VALUES (23, 271, 21, 'Thane', 40, 1, 1515, 8, 12);
INSERT INTO stitbz_p23_1_urban_sector_sub_stratum_size_allocation VALUES (24, 271, 21, 'Thane', 41, 1, 2070, 8, 12);
INSERT INTO stitbz_p23_1_urban_sector_sub_stratum_size_allocation VALUES (25, 271, 22, 'Mumbai and Mumbai(Suburban)', 42, 1, 18900, 64, 96);
INSERT INTO stitbz_p23_1_urban_sector_sub_stratum_size_allocation VALUES (26, 272, 25, 'Pune', 43, 1, 5036, 20, 30);
INSERT INTO stitbz_p23_1_urban_sector_sub_stratum_size_allocation VALUES (27, 272, 25, 'Pune', 44, 1, 2429, 12, 18);
INSERT INTO stitbz_p23_1_urban_sector_sub_stratum_size_allocation VALUES (28, NULL, NULL, 'State Total', NULL, NULL, 76971, 328, 492);;

CREATE TABLE stitbz_p23_2_andhra_pradesh_sub_stratum_size_allocation (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p23_2_andhra_pradesh_sub_stratum_size_allocation VALUES (1, 281, 11, 'Srikakulam', 11, 1, 370, 10, 20);
INSERT INTO stitbz_p23_2_andhra_pradesh_sub_stratum_size_allocation VALUES (2, 281, 11, 'Srikakulam', 11, 2, 407, 10, 20);
INSERT INTO stitbz_p23_2_andhra_pradesh_sub_stratum_size_allocation VALUES (3, 281, 12, 'Vizianagaram', 12, 1, 222, 2, 4);
INSERT INTO stitbz_p23_2_andhra_pradesh_sub_stratum_size_allocation VALUES (4, 281, 12, 'Vizianagaram', 12, 2, 594, 2, 4);
INSERT INTO stitbz_p23_2_andhra_pradesh_sub_stratum_size_allocation VALUES (5, 281, 13, 'Visakhapatnam', 13, 1, 213, 2, 4);
INSERT INTO stitbz_p23_2_andhra_pradesh_sub_stratum_size_allocation VALUES (6, 281, 13, 'Visakhapatnam', 13, 2, 481, 2, 4);;

-- SQL for p9.md

CREATE TABLE stitbz_p9_1_sub_stratum_size_allocation_urban_sector (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p9_1_sub_stratum_size_allocation_urban_sector VALUES (1, 093, 54, 'Siddharthnagar', 54, 1, 200, 2, 2);
INSERT INTO stitbz_p9_1_sub_stratum_size_allocation_urban_sector VALUES (2, 093, 55, 'Basti', 55, 1, 200, 2, 2);
INSERT INTO stitbz_p9_1_sub_stratum_size_allocation_urban_sector VALUES (3, 093, 56, 'S. Kabir Nagar', 56, 1, 170, 2, 2);
INSERT INTO stitbz_p9_1_sub_stratum_size_allocation_urban_sector VALUES (4, 093, 57, 'Maharajganj', 57, 1, 210, 2, 2);
INSERT INTO stitbz_p9_1_sub_stratum_size_allocation_urban_sector VALUES (5, 093, 58, 'Gorakhpur', 58, 1, 257, 2, 2);
INSERT INTO stitbz_p9_1_sub_stratum_size_allocation_urban_sector VALUES (6, 093, 58, 'Gorakhpur', 58, 2, 1096, 6, 6);
INSERT INTO stitbz_p9_1_sub_stratum_size_allocation_urban_sector VALUES (7, 093, 59, 'Kushinagar', 59, 1, 260, 2, 2);
INSERT INTO stitbz_p9_1_sub_stratum_size_allocation_urban_sector VALUES (8, 093, 60, 'Deoria', 60, 1, 280, 2, 2);
INSERT INTO stitbz_p9_1_sub_stratum_size_allocation_urban_sector VALUES (9, 093, 60, 'Deoria', 60, 2, 169, 2, 2);
INSERT INTO stitbz_p9_1_sub_stratum_size_allocation_urban_sector VALUES (10, 093, 61, 'Azamgarh', 61, 1, 492, 4, 4);
INSERT INTO stitbz_p9_1_sub_stratum_size_allocation_urban_sector VALUES (11, 093, 62, 'Mau', 62, 1, 315, 2, 2);
INSERT INTO stitbz_p9_1_sub_stratum_size_allocation_urban_sector VALUES (12, 093, 62, 'Mau', 62, 2, 347, 2, 2);
INSERT INTO stitbz_p9_1_sub_stratum_size_allocation_urban_sector VALUES (13, 093, 63, 'Ballia', 63, 1, 291, 2, 2);
INSERT INTO stitbz_p9_1_sub_stratum_size_allocation_urban_sector VALUES (14, 093, 63, 'Ballia', 63, 2, 155, 2, 2);
INSERT INTO stitbz_p9_1_sub_stratum_size_allocation_urban_sector VALUES (15, 093, 64, 'Jaunpur', 64, 1, 229, 2, 2);
INSERT INTO stitbz_p9_1_sub_stratum_size_allocation_urban_sector VALUES (16, 093, 64, 'Jaunpur', 64, 2, 202, 2, 2);
INSERT INTO stitbz_p9_1_sub_stratum_size_allocation_urban_sector VALUES (17, 093, 65, 'Ghazipur', 65, 1, 395, 2, 2);
INSERT INTO stitbz_p9_1_sub_stratum_size_allocation_urban_sector VALUES (18, 093, 66, 'Chandauli', 66, 1, 338, 2, 2);
INSERT INTO stitbz_p9_1_sub_stratum_size_allocation_urban_sector VALUES (19, 093, 67, 'Varanasi', 67, 1, 679, 4, 4);
INSERT INTO stitbz_p9_1_sub_stratum_size_allocation_urban_sector VALUES (20, 093, 68, 'S. R. Nagar Bhadohi', 68, 1, 345, 2, 2);
INSERT INTO stitbz_p9_1_sub_stratum_size_allocation_urban_sector VALUES (21, 093, 69, 'Mirzapur', 69, 1, 564, 4, 4);
INSERT INTO stitbz_p9_1_sub_stratum_size_allocation_urban_sector VALUES (22, 093, 70, 'Sonbhadra', 70, 1, 532, 4, 4);
INSERT INTO stitbz_p9_1_sub_stratum_size_allocation_urban_sector VALUES (23, 095, 71, 'Kashiramnagar', 71, 1, 279, 2, 2);
INSERT INTO stitbz_p9_1_sub_stratum_size_allocation_urban_sector VALUES (24, 095, 71, 'Kashiramnagar', 71, 2, 169, 2, 2);
INSERT INTO stitbz_p9_1_sub_stratum_size_allocation_urban_sector VALUES (25, 091, 07, 'Meerut', 72, 1, 2279, 10, 10);
INSERT INTO stitbz_p9_1_sub_stratum_size_allocation_urban_sector VALUES (26, 091, 09, 'Ghaziabad', 73, 1, 3381, 10, 10);
INSERT INTO stitbz_p9_1_sub_stratum_size_allocation_urban_sector VALUES (27, 095, 15, 'Agra', 74, 1, 2088, 10, 10);
INSERT INTO stitbz_p9_1_sub_stratum_size_allocation_urban_sector VALUES (28, 092, 27, 'Lucknow', 75, 1, 4366, 12, 12);
INSERT INTO stitbz_p9_1_sub_stratum_size_allocation_urban_sector VALUES (29, 092, 34, 'Kanpur Nagar', 76, 1, 4890, 12, 12);
INSERT INTO stitbz_p9_1_sub_stratum_size_allocation_urban_sector VALUES (30, 093, 45, 'Allahabad', 77, 1, 1867, 8, 8);
INSERT INTO stitbz_p9_1_sub_stratum_size_allocation_urban_sector VALUES (31, 093, 67, 'Varanasi', 78, 1, 1782, 10, 10);
INSERT INTO stitbz_p9_1_sub_stratum_size_allocation_urban_sector VALUES (32, NULL, NULL, 'State Total', NULL, NULL, 68434, 356, 356);;

CREATE TABLE stitbz_p9_2_bihar_10_sub_stratum_size_allocation_urban_sector (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p9_2_bihar_10_sub_stratum_size_allocation_urban_sector VALUES (1, 101, 01, 'Champaran (W)', 01, 1, 499, 2, 2);
INSERT INTO stitbz_p9_2_bihar_10_sub_stratum_size_allocation_urban_sector VALUES (2, 101, 02, 'Champaran (E)', 02, 1, 386, 2, 2);
INSERT INTO stitbz_p9_2_bihar_10_sub_stratum_size_allocation_urban_sector VALUES (3, 101, 03, 'Sheohar', 03, 1, 36, 2, 2);
INSERT INTO stitbz_p9_2_bihar_10_sub_stratum_size_allocation_urban_sector VALUES (4, 101, 04, 'Sitamarhi', 04, 1, 250, 2, 2);;

-- SQL for p16.md

CREATE TABLE stitbz_p16_1_sub_stratum_size_allocation_urban_sector (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p16_1_sub_stratum_size_allocation_urban_sector VALUES (1, 201, 22, 'Seraikela Khareswan', 22, 1, 344, 2, 2);
INSERT INTO stitbz_p16_1_sub_stratum_size_allocation_urban_sector VALUES (2, 202, 23, 'Ramgarh', 23, 1, 585, 2, 2);
INSERT INTO stitbz_p16_1_sub_stratum_size_allocation_urban_sector VALUES (3, 201, 24, 'Khunti', 24, 1, 61, 2, 2);
INSERT INTO stitbz_p16_1_sub_stratum_size_allocation_urban_sector VALUES (4, 202, 12, 'Dhanbad', 25, 1, 349, 6, 6);
INSERT INTO stitbz_p16_1_sub_stratum_size_allocation_urban_sector VALUES (5, 201, 14, 'Ranchi', 26, 1, 2177, 6, 6);
INSERT INTO stitbz_p16_1_sub_stratum_size_allocation_urban_sector VALUES (6, NULL, NULL, 'State Total', NULL, NULL, 14496, 68, 68);;

CREATE TABLE stitbz_p16_2_sub_stratum_size_allocation_urban_sector_odisha (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p16_2_sub_stratum_size_allocation_urban_sector_odisha VALUES (1, 213, 01, 'Bargarh', 01, 1, 293, 2, 2);
INSERT INTO stitbz_p16_2_sub_stratum_size_allocation_urban_sector_odisha VALUES (2, 213, 02, 'Jharsuguda', 02, 1, 92, 2, 2);
INSERT INTO stitbz_p16_2_sub_stratum_size_allocation_urban_sector_odisha VALUES (3, 213, 02, 'Jharsuguda', 02, 2, 314, 2, 2);
INSERT INTO stitbz_p16_2_sub_stratum_size_allocation_urban_sector_odisha VALUES (4, 213, 03, 'Sambalpur', 03, 1, 159, 2, 2);
INSERT INTO stitbz_p16_2_sub_stratum_size_allocation_urban_sector_odisha VALUES (5, 213, 03, 'Sambalpur', 03, 2, 489, 2, 2);
INSERT INTO stitbz_p16_2_sub_stratum_size_allocation_urban_sector_odisha VALUES (6, 213, 04, 'Debagarh', 04, 1, 40, 2, 2);
INSERT INTO stitbz_p16_2_sub_stratum_size_allocation_urban_sector_odisha VALUES (7, 213, 05, 'Sundargarh', 05, 1, 286, 2, 2);
INSERT INTO stitbz_p16_2_sub_stratum_size_allocation_urban_sector_odisha VALUES (8, 213, 05, 'Sundargarh', 05, 2, 1096, 2, 2);
INSERT INTO stitbz_p16_2_sub_stratum_size_allocation_urban_sector_odisha VALUES (9, 213, 06, 'Kendujhar', 06, 1, 233, 2, 2);
INSERT INTO stitbz_p16_2_sub_stratum_size_allocation_urban_sector_odisha VALUES (10, 213, 06, 'Kendujhar', 06, 2, 209, 2, 2);
INSERT INTO stitbz_p16_2_sub_stratum_size_allocation_urban_sector_odisha VALUES (11, 213, 07, 'Mayurbhanj', 07, 1, 312, 2, 2);
INSERT INTO stitbz_p16_2_sub_stratum_size_allocation_urban_sector_odisha VALUES (12, 211, 08, 'Baleshwar', 08, 1, 172, 2, 2);
INSERT INTO stitbz_p16_2_sub_stratum_size_allocation_urban_sector_odisha VALUES (13, 211, 08, 'Baleshwar', 08, 2, 288, 2, 2);
INSERT INTO stitbz_p16_2_sub_stratum_size_allocation_urban_sector_odisha VALUES (14, 211, 09, 'Bhadrak', 09, 1, 298, 2, 2);
INSERT INTO stitbz_p16_2_sub_stratum_size_allocation_urban_sector_odisha VALUES (15, 211, 10, 'Kendrapara', 10, 1, 146, 2, 2);
INSERT INTO stitbz_p16_2_sub_stratum_size_allocation_urban_sector_odisha VALUES (16, 211, 11, 'Jagatsinghapur', 11, 1, 211, 2, 2);
INSERT INTO stitbz_p16_2_sub_stratum_size_allocation_urban_sector_odisha VALUES (17, 211, 12, 'Cuttack', 12, 1, 119, 2, 2);
INSERT INTO stitbz_p16_2_sub_stratum_size_allocation_urban_sector_odisha VALUES (18, 211, 12, 'Cuttack', 12, 2, 1047, 2, 2);
INSERT INTO stitbz_p16_2_sub_stratum_size_allocation_urban_sector_odisha VALUES (19, 211, 13, 'Jajapur', 13, 1, 239, 2, 2);
INSERT INTO stitbz_p16_2_sub_stratum_size_allocation_urban_sector_odisha VALUES (20, 213, 14, 'Dhenkanal', 14, 1, 213, 2, 2);
INSERT INTO stitbz_p16_2_sub_stratum_size_allocation_urban_sector_odisha VALUES (21, 213, 15, 'Anugul', 15, 1, 415, 2, 2);
INSERT INTO stitbz_p16_2_sub_stratum_size_allocation_urban_sector_odisha VALUES (22, 211, 16, 'Nayagarh', 16, 1, 144, 2, 2);
INSERT INTO stitbz_p16_2_sub_stratum_size_allocation_urban_sector_odisha VALUES (23, 211, 17, 'Khordha', 17, 1, 228, 2, 2);
INSERT INTO stitbz_p16_2_sub_stratum_size_allocation_urban_sector_odisha VALUES (24, 211, 17, 'Khordha', 17, 2, 1757, 4, 4);
INSERT INTO stitbz_p16_2_sub_stratum_size_allocation_urban_sector_odisha VALUES (25, 211, 18, 'Puri', 18, 1, 108, 2, 2);
INSERT INTO stitbz_p16_2_sub_stratum_size_allocation_urban_sector_odisha VALUES (26, 211, 18, 'Puri', 18, 2, 290, 2, 2);
INSERT INTO stitbz_p16_2_sub_stratum_size_allocation_urban_sector_odisha VALUES (27, 212, 19, 'Ganjam', 19, 1, 728, 4, 4);
INSERT INTO stitbz_p16_2_sub_stratum_size_allocation_urban_sector_odisha VALUES (28, 212, 19, 'Ganjam', 19, 2, 500, 2, 2);
INSERT INTO stitbz_p16_2_sub_stratum_size_allocation_urban_sector_odisha VALUES (29, 212, 20, 'Gajapati', 20, 1, 132, 2, 2);;

-- SQL for p22.md

CREATE TABLE stitbz_p22_1_sub_stratum_size_and_allocation (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (1, 273, 03, 'Jalgaon', 03, 1, 608, 4, 6);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (2, 273, 03, 'Jalgaon', 03, 2, 1594, 6, 8);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (3, 275, 04, 'Buldana', 04, 1, 544, 2, 4);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (4, 275, 04, 'Buldana', 04, 2, 210, 2, 2);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (5, 275, 05, 'Akola', 05, 1, 296, 2, 4);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (6, 275, 05, 'Akola', 05, 2, 744, 4, 6);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (7, 275, 06, 'Washim', 06, 1, 283, 2, 4);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (8, 275, 07, 'Amravati', 07, 1, 416, 2, 4);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (9, 275, 07, 'Amravati', 07, 2, 1085, 6, 8);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (10, 275, 08, 'Wardha', 08, 1, 376, 2, 2);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (11, 275, 08, 'Wardha', 08, 2, 324, 2, 4);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (12, 275, 09, 'Nagpur', 09, 1, 1062, 4, 6);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (13, 275, 09, 'Nagpur', 09, 2, 364, 2, 4);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (14, 276, 10, 'Bhandara', 10, 1, 418, 2, 4);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (15, 276, 11, 'Gondiya', 11, 1, 408, 2, 2);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (16, 276, 12, 'Gadchiroli', 12, 1, 206, 2, 4);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (17, 276, 13, 'Chandrapur', 13, 1, 514, 2, 4);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (18, 276, 13, 'Chandrapur', 13, 2, 784, 4, 4);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (19, 275, 14, 'Yavatmal', 14, 1, 485, 2, 4);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (20, 275, 14, 'Yavatmal', 14, 2, 389, 2, 2);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (21, 274, 15, 'Nanded', 15, 1, 521, 2, 4);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (22, 274, 15, 'Nanded', 15, 2, 893, 4, 4);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (23, 274, 16, 'Hingoli', 16, 1, 278, 2, 2);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (24, 274, 17, 'Parbhani', 17, 1, 329, 2, 2);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (25, 274, 17, 'Parbhani', 17, 2, 645, 2, 4);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (26, 274, 18, 'Jalna', 18, 1, 141, 2, 2);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (27, 274, 18, 'Jalna', 18, 2, 339, 2, 4);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (28, 274, 19, 'Aurangabad', 19, 1, 539, 2, 4);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (29, 274, 19, 'Aurangabad', 19, 2, 258, 2, 2);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (30, 273, 20, 'Nashik', 20, 1, 596, 4, 4);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (31, 273, 20, 'Nashik', 20, 2, 1129, 4, 8);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (32, 271, 21, 'Thane', 21, 1, 973, 4, 8);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (33, 271, 21, 'Thane', 21, 2, 5496, 16, 22);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (34, 271, 24, 'Raigarh', 24, 1, 747, 2, 4);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (35, 271, 24, 'Raigarh', 24, 2, 746, 4, 6);
INSERT INTO stitbz_p22_1_sub_stratum_size_and_allocation VALUES (36, 272, 25, 'Pune', 25, 1, 814, 2, 4);;

-- SQL for p26.md

CREATE TABLE stitbz_p26_1_sub_stratum_size_allocation_urban_sector (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region TEXT,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (1, 293, 20, 'Bangalore', 31, 1, 13443, 46, 46);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (2, NULL, NULL, 'State Total', NULL, NULL, 36874, 168, 168);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (3, 'goa_30', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (4, 301, 01, 'North Goa', 01, 1, 703, 4, 4);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (5, 301, 01, 'North Goa', 01, 2, 111, 2, 2);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (6, 301, 02, 'South Goa', 02, 1, 313, 2, 2);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (7, 301, 02, 'South Goa', 02, 2, 325, 4, 4);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (8, NULL, NULL, 'State Total', NULL, NULL, 1452, 12, 12);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (9, 'lakshadweep_31', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (10, 311, 01, 'Lakshadweep', 01, 1, 62, 8, 0);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (11, NULL, NULL, 'State Total', NULL, NULL, 62, 8, 0);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (12, 'kerala_32', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (13, 321, 01, 'Kasaragod', 01, 1, 282, 4, 4);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (14, 321, 01, 'Kasaragod', 01, 2, 228, 2, 2);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (15, 321, 02, 'Kannur', 02, 1, 1852, 12, 12);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (16, 321, 02, 'Kannur', 02, 2, 534, 4, 4);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (17, 321, 03, 'Wayanad', 03, 1, 54, 2, 2);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (18, 321, 04, 'Kozhikode', 04, 1, 834, 8, 8);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (19, 321, 04, 'Kozhikode', 04, 2, 1322, 10, 10);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (20, 321, 05, 'Malappuram', 05, 1, 196, 4, 4);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (21, 321, 05, 'Malappuram', 05, 2, 490, 14, 14);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (22, 321, 06, 'Palakkad', 06, 1, 210, 4, 4);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (23, 321, 06, 'Palakkad', 06, 2, 413, 4, 4);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (24, 322, 07, 'Thrissur', 07, 1, 1003, 10, 10);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (25, 322, 07, 'Thrissur', 07, 2, 903, 10, 10);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (26, 322, 08, 'Ernakulam', 08, 1, 1490, 10, 10);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (27, 322, 08, 'Ernakulam', 08, 2, 1983, 10, 10);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (28, 322, 09, 'Idukki', 09, 1, 105, 2, 2);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (29, 322, 10, 'Kottayam', 10, 1, 453, 2, 2);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (30, 322, 10, 'Kottayam', 10, 2, 430, 4, 4);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (31, 322, 11, 'Alappuzha', 11, 1, 919, 6, 6);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (32, 322, 11, 'Alappuzha', 11, 2, 457, 4, 4);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (33, 322, 12, 'Pathanamthitta', 12, 1, 63, 2, 2);
INSERT INTO stitbz_p26_1_sub_stratum_size_allocation_urban_sector VALUES (34, 322, 12, 'Pathanamthitta', 12, 2, 141, 2, 2);;

-- SQL for p12.md

CREATE TABLE stitbz_p12_1_sub_stratum_size_and_allocation (
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p12_1_sub_stratum_size_and_allocation VALUES (131, 11, 'Peren', 11, 1, 23, 2, 6);
INSERT INTO stitbz_p12_1_sub_stratum_size_and_allocation VALUES (NULL, NULL, 'State Total', NULL, NULL, 707, 28, 84);;

CREATE TABLE stitbz_p12_2_sub_stratum_size_and_allocation_manipur (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p12_2_sub_stratum_size_and_allocation_manipur VALUES (1, 142, 01, 'Senapati (Excluding 3 Sub-Divisions)', 01, 1, 17, 2, 4);
INSERT INTO stitbz_p12_2_sub_stratum_size_and_allocation_manipur VALUES (2, 142, 02, 'Tamenglong', 02, 1, 39, 2, 4);
INSERT INTO stitbz_p12_2_sub_stratum_size_and_allocation_manipur VALUES (3, 142, 03, 'Churachandpur', 03, 1, 35, 2, 4);
INSERT INTO stitbz_p12_2_sub_stratum_size_and_allocation_manipur VALUES (4, 141, 04, 'Bishnupur', 04, 1, 142, 10, 20);
INSERT INTO stitbz_p12_2_sub_stratum_size_and_allocation_manipur VALUES (5, 141, 05, 'Thoubal', 05, 1, 281, 16, 32);
INSERT INTO stitbz_p12_2_sub_stratum_size_and_allocation_manipur VALUES (6, 141, 06, 'Imphal West', 06, 1, 163, 8, 16);
INSERT INTO stitbz_p12_2_sub_stratum_size_and_allocation_manipur VALUES (7, 141, 06, 'Imphal West', 06, 2, 357, 16, 32);
INSERT INTO stitbz_p12_2_sub_stratum_size_and_allocation_manipur VALUES (8, 141, 07, 'Imphal East', 07, 1, 164, 18, 36);
INSERT INTO stitbz_p12_2_sub_stratum_size_and_allocation_manipur VALUES (9, 142, 08, 'Ukhrul', 08, 1, 81, 4, 8);
INSERT INTO stitbz_p12_2_sub_stratum_size_and_allocation_manipur VALUES (10, 142, 09, 'Chandel', 09, 1, 17, 2, 4);
INSERT INTO stitbz_p12_2_sub_stratum_size_and_allocation_manipur VALUES (11, NULL, NULL, 'State Total', NULL, NULL, 1296, 80, 160);;

CREATE TABLE stitbz_p12_3_sub_stratum_size_and_allocation_mizoram (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p12_3_sub_stratum_size_and_allocation_mizoram VALUES (1, 151, 01, 'Mamit', 01, 1, 32, 2, 2);
INSERT INTO stitbz_p12_3_sub_stratum_size_and_allocation_mizoram VALUES (2, 151, 02, 'Kolasib', 02, 1, 77, 4, 4);
INSERT INTO stitbz_p12_3_sub_stratum_size_and_allocation_mizoram VALUES (3, 151, 03, 'Aizwal', 03, 1, 46, 4, 4);
INSERT INTO stitbz_p12_3_sub_stratum_size_and_allocation_mizoram VALUES (4, 151, 03, 'Aizwal', 03, 2, 335, 20, 20);
INSERT INTO stitbz_p12_3_sub_stratum_size_and_allocation_mizoram VALUES (5, 151, 04, 'Champhai', 04, 1, 59, 4, 4);
INSERT INTO stitbz_p12_3_sub_stratum_size_and_allocation_mizoram VALUES (6, 151, 05, 'Serchip', 05, 1, 52, 4, 4);
INSERT INTO stitbz_p12_3_sub_stratum_size_and_allocation_mizoram VALUES (7, 151, 06, 'Lunglei', 06, 1, 100, 8, 8);
INSERT INTO stitbz_p12_3_sub_stratum_size_and_allocation_mizoram VALUES (8, 151, 08, 'Saiha', 08, 1, 34, 2, 2);
INSERT INTO stitbz_p12_3_sub_stratum_size_and_allocation_mizoram VALUES (9, NULL, NULL, 'State Total', NULL, NULL, 735, 48, 48);;

CREATE TABLE stitbz_p12_4_sub_stratum_size_and_allocation_tripura (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p12_4_sub_stratum_size_and_allocation_tripura VALUES (1, 161, 01, 'West Tripura', 01, 1, 449, 28, 28);
INSERT INTO stitbz_p12_4_sub_stratum_size_and_allocation_tripura VALUES (2, 161, 01, 'West Tripura', 01, 2, 321, 20, 20);
INSERT INTO stitbz_p12_4_sub_stratum_size_and_allocation_tripura VALUES (3, 161, 02, 'South Tripura', 02, 1, 130, 10, 10);
INSERT INTO stitbz_p12_4_sub_stratum_size_and_allocation_tripura VALUES (4, 161, 03, 'Dhalai', 03, 1, 49, 4, 4);
INSERT INTO stitbz_p12_4_sub_stratum_size_and_allocation_tripura VALUES (5, 161, 04, 'North Tripura', 04, 1, 145, 10, 10);
INSERT INTO stitbz_p12_4_sub_stratum_size_and_allocation_tripura VALUES (6, NULL, NULL, 'State Total', NULL, NULL, 1094, 72, 72);;

CREATE TABLE stitbz_p12_5_sub_stratum_size_and_allocation_meghalaya (
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p12_5_sub_stratum_size_and_allocation_meghalaya VALUES (171, 01, 'West Garo Hills', 01, 2, 97, 6, 6);;

-- SQL for p6.md

CREATE TABLE stitbz_p6_1_sub_stratum_size_allocation_urban_sector (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p6_1_sub_stratum_size_allocation_urban_sector VALUES (1, 081, 20, 'Pali', 20, 1, 439, 2, 2);
INSERT INTO stitbz_p6_1_sub_stratum_size_allocation_urban_sector VALUES (2, 081, 20, 'Pali', 20, 2, 403, 2, 2);
INSERT INTO stitbz_p6_1_sub_stratum_size_allocation_urban_sector VALUES (3, 082, 21, 'Ajmer', 21, 1, 296, 2, 2);
INSERT INTO stitbz_p6_1_sub_stratum_size_allocation_urban_sector VALUES (4, 082, 21, 'Ajmer', 21, 2, 1414, 4, 4);
INSERT INTO stitbz_p6_1_sub_stratum_size_allocation_urban_sector VALUES (5, 082, 22, 'Tonk', 22, 1, 233, 2, 2);
INSERT INTO stitbz_p6_1_sub_stratum_size_allocation_urban_sector VALUES (6, 082, 22, 'Tonk', 22, 2, 227, 2, 2);
INSERT INTO stitbz_p6_1_sub_stratum_size_allocation_urban_sector VALUES (7, 084, 23, 'Bundi', 23, 1, 333, 2, 2);
INSERT INTO stitbz_p6_1_sub_stratum_size_allocation_urban_sector VALUES (8, 082, 24, 'Bhilwara', 24, 1, 252, 2, 2);
INSERT INTO stitbz_p6_1_sub_stratum_size_allocation_urban_sector VALUES (9, 082, 24, 'Bhilwara', 24, 2, 528, 2, 2);
INSERT INTO stitbz_p6_1_sub_stratum_size_allocation_urban_sector VALUES (10, 083, 25, 'Rajsamand', 25, 1, 322, 2, 2);
INSERT INTO stitbz_p6_1_sub_stratum_size_allocation_urban_sector VALUES (11, 083, 26, 'Udaipur', 26, 1, 318, 2, 2);
INSERT INTO stitbz_p6_1_sub_stratum_size_allocation_urban_sector VALUES (12, 083, 26, 'Udaipur', 26, 2, 824, 2, 2);
INSERT INTO stitbz_p6_1_sub_stratum_size_allocation_urban_sector VALUES (13, 083, 27, 'Dungarpur', 27, 1, 178, 2, 2);
INSERT INTO stitbz_p6_1_sub_stratum_size_allocation_urban_sector VALUES (14, 083, 28, 'Banswara', 28, 1, 245, 2, 2);
INSERT INTO stitbz_p6_1_sub_stratum_size_allocation_urban_sector VALUES (15, 084, 29, 'Chittaurgarh', 29, 1, 191, 2, 2);
INSERT INTO stitbz_p6_1_sub_stratum_size_allocation_urban_sector VALUES (16, 084, 29, 'Chittaurgarh', 29, 2, 324, 2, 2);
INSERT INTO stitbz_p6_1_sub_stratum_size_allocation_urban_sector VALUES (17, 084, 30, 'Kota', 30, 1, 259, 2, 2);
INSERT INTO stitbz_p6_1_sub_stratum_size_allocation_urban_sector VALUES (18, 084, 31, 'Baran', 31, 1, 191, 2, 2);
INSERT INTO stitbz_p6_1_sub_stratum_size_allocation_urban_sector VALUES (19, 084, 31, 'Baran', 31, 2, 169, 2, 2);
INSERT INTO stitbz_p6_1_sub_stratum_size_allocation_urban_sector VALUES (20, 084, 32, 'Jhalawar', 32, 1, 351, 2, 2);
INSERT INTO stitbz_p6_1_sub_stratum_size_allocation_urban_sector VALUES (21, 084, 33, 'Pratapgarh', 33, 1, 128, 2, 2);
INSERT INTO stitbz_p6_1_sub_stratum_size_allocation_urban_sector VALUES (22, 082, 12, 'Jaipur', 34, 1, 5656, 16, 16);
INSERT INTO stitbz_p6_1_sub_stratum_size_allocation_urban_sector VALUES (23, 081, 15, 'Jodhpur', 35, 1, 1733, 8, 8);
INSERT INTO stitbz_p6_1_sub_stratum_size_allocation_urban_sector VALUES (24, 084, 30, 'Kota', 36, 1, 1399, 8, 8);
INSERT INTO stitbz_p6_1_sub_stratum_size_allocation_urban_sector VALUES (25, NULL, NULL, 'State Total', NULL, NULL, 26942, 140, 140);;

CREATE TABLE stitbz_p6_2_uttar_pradesh_sub_stratum_size_allocation (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p6_2_uttar_pradesh_sub_stratum_size_allocation VALUES (1, 091, 01, 'Saharanpur', 01, 1, 332, 2, 2);
INSERT INTO stitbz_p6_2_uttar_pradesh_sub_stratum_size_allocation VALUES (2, 091, 01, 'Saharanpur', 01, 2, 928, 6, 6);
INSERT INTO stitbz_p6_2_uttar_pradesh_sub_stratum_size_allocation VALUES (3, 091, 02, 'Muzaffarnagar', 02, 1, 820, 4, 4);
INSERT INTO stitbz_p6_2_uttar_pradesh_sub_stratum_size_allocation VALUES (4, 091, 02, 'Muzaffarnagar', 02, 2, 859, 4, 4);
INSERT INTO stitbz_p6_2_uttar_pradesh_sub_stratum_size_allocation VALUES (5, 091, 03, 'Bijnor', 03, 1, 835, 4, 4);
INSERT INTO stitbz_p6_2_uttar_pradesh_sub_stratum_size_allocation VALUES (6, 091, 03, 'Bijnor', 03, 2, 458, 4, 4);
INSERT INTO stitbz_p6_2_uttar_pradesh_sub_stratum_size_allocation VALUES (7, 091, 04, 'Moradabad', 04, 1, 520, 2, 2);
INSERT INTO stitbz_p6_2_uttar_pradesh_sub_stratum_size_allocation VALUES (8, 091, 04, 'Moradabad', 04, 2, 1440, 8, 8);
INSERT INTO stitbz_p6_2_uttar_pradesh_sub_stratum_size_allocation VALUES (9, 091, 05, 'Rampur', 05, 1, 376, 2, 2);
INSERT INTO stitbz_p6_2_uttar_pradesh_sub_stratum_size_allocation VALUES (10, 091, 05, 'Rampur', 05, 2, 425, 2, 2);;

-- SQL for p19.md

CREATE TABLE stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (1, 233, 22, 'Shajapur', 22, 1, 281, 2, 2);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (2, 233, 22, 'Shajapur', 22, 2, 242, 2, 2);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (3, 233, 23, 'Dewas', 23, 1, 246, 2, 2);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (4, 233, 23, 'Dewas', 23, 2, 399, 2, 2);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (5, 233, 24, 'Jhabua', 24, 1, 133, 2, 2);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (6, 233, 25, 'Dhar', 25, 1, 344, 2, 2);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (7, 233, 25, 'Dhar', 25, 2, 375, 2, 2);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (8, 233, 26, 'Indore', 26, 1, 602, 4, 4);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (9, 235, 27, 'W. Nimar', 27, 1, 230, 2, 2);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (10, 235, 27, 'W. Nimar', 27, 2, 173, 2, 2);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (11, 235, 28, 'Barwani', 28, 1, 283, 2, 2);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (12, 235, 29, 'E. Nimar', 29, 1, 375, 2, 2);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (13, 233, 30, 'Rajgarh', 30, 1, 351, 4, 4);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (14, 232, 31, 'Vidisha', 31, 1, 166, 2, 2);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (15, 232, 31, 'Vidisha', 31, 2, 263, 2, 2);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (16, 232, 32, 'Bhopal', 32, 1, 182, 2, 2);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (17, 232, 33, 'Sehore', 33, 1, 317, 2, 2);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (18, 232, 34, 'Raisen', 34, 1, 389, 4, 4);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (19, 235, 35, 'Betul', 35, 1, 187, 2, 2);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (20, 235, 35, 'Betul', 35, 2, 298, 2, 2);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (21, 235, 36, 'Harda', 36, 1, 168, 2, 2);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (22, 235, 37, 'Hoshangabad', 37, 1, 176, 2, 2);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (23, 235, 37, 'Hoshangabad', 37, 2, 546, 2, 2);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (24, 234, 38, 'Katni', 38, 1, 77, 2, 2);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (25, 234, 38, 'Katni', 38, 2, 339, 2, 2);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (26, 234, 39, 'Jabalpur', 39, 1, 375, 2, 2);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (27, 234, 39, 'Jabalpur', 39, 2, 98, 2, 2);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (28, 234, 40, 'Narsimhapur', 40, 1, 321, 2, 2);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (29, 234, 41, 'Dindori', 41, 1, 49, 2, 2);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (30, 234, 42, 'Mandla', 42, 1, 219, 2, 2);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (31, 234, 43, 'Chhindwara', 43, 1, 598, 2, 2);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (32, 234, 43, 'Chhindwara', 43, 2, 260, 2, 2);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (33, 234, 44, 'Seoni', 44, 1, 184, 2, 2);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (34, 234, 45, 'Balaghat', 45, 1, 388, 2, 2);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (35, 236, 46, 'Ashoknagar', 46, 1, 249, 2, 2);
INSERT INTO stitbz_p19_1_sub_stratum_size_and_allocation_urban_sector VALUES (36, 231, 47, 'Anuppur', 47, 1, 355, 2, 2);;

-- SQL for p2.md

CREATE TABLE stitbz_p2_1_sub_stratum_size_and_allocation_urban_sector (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p2_1_sub_stratum_size_and_allocation_urban_sector VALUES (1, 021, 07, 'Una', 07, 1, 93, 2, 2);
INSERT INTO stitbz_p2_1_sub_stratum_size_and_allocation_urban_sector VALUES (2, 022, 08, 'Bilaspur', 08, 1, 45, 2, 2);
INSERT INTO stitbz_p2_1_sub_stratum_size_and_allocation_urban_sector VALUES (3, 022, 09, 'Solan', 09, 1, 59, 2, 2);
INSERT INTO stitbz_p2_1_sub_stratum_size_and_allocation_urban_sector VALUES (4, 022, 09, 'Solan', 09, 2, 185, 2, 2);
INSERT INTO stitbz_p2_1_sub_stratum_size_and_allocation_urban_sector VALUES (5, 022, 10, 'Sirmaur', 10, 1, 90, 2, 2);
INSERT INTO stitbz_p2_1_sub_stratum_size_and_allocation_urban_sector VALUES (6, 022, 11, 'Shimla', 11, 1, 64, 2, 2);
INSERT INTO stitbz_p2_1_sub_stratum_size_and_allocation_urban_sector VALUES (7, 022, 11, 'Shimla', 11, 2, 259, 2, 2);
INSERT INTO stitbz_p2_1_sub_stratum_size_and_allocation_urban_sector VALUES (8, NULL, NULL, 'State Total', NULL, NULL, 1294, 24, 24);;

CREATE TABLE stitbz_p2_2_sub_stratum_size_and_allocation_urban_sector_punjab (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p2_2_sub_stratum_size_and_allocation_urban_sector_punjab VALUES (1, 031, 01, 'Gurdaspur', 01, 1, 422, 2, 2);
INSERT INTO stitbz_p2_2_sub_stratum_size_and_allocation_urban_sector_punjab VALUES (2, 031, 01, 'Gurdaspur', 01, 2, 681, 2, 2);
INSERT INTO stitbz_p2_2_sub_stratum_size_and_allocation_urban_sector_punjab VALUES (3, 031, 02, 'Amritsar', 02, 1, 176, 2, 2);
INSERT INTO stitbz_p2_2_sub_stratum_size_and_allocation_urban_sector_punjab VALUES (4, 031, 03, 'Kapurthala', 03, 1, 180, 2, 2);
INSERT INTO stitbz_p2_2_sub_stratum_size_and_allocation_urban_sector_punjab VALUES (5, 031, 03, 'Kapurthala', 03, 2, 520, 2, 2);
INSERT INTO stitbz_p2_2_sub_stratum_size_and_allocation_urban_sector_punjab VALUES (6, 031, 04, 'Jalandhar', 04, 1, 534, 2, 2);
INSERT INTO stitbz_p2_2_sub_stratum_size_and_allocation_urban_sector_punjab VALUES (7, 031, 04, 'Jalandhar', 04, 2, 1590, 6, 6);
INSERT INTO stitbz_p2_2_sub_stratum_size_and_allocation_urban_sector_punjab VALUES (8, 031, 05, 'Hoshiarpur', 05, 1, 301, 2, 2);
INSERT INTO stitbz_p2_2_sub_stratum_size_and_allocation_urban_sector_punjab VALUES (9, 031, 05, 'Hoshiarpur', 05, 2, 313, 2, 2);
INSERT INTO stitbz_p2_2_sub_stratum_size_and_allocation_urban_sector_punjab VALUES (10, 031, 06, 'Nawanshahr', 06, 1, 307, 2, 2);
INSERT INTO stitbz_p2_2_sub_stratum_size_and_allocation_urban_sector_punjab VALUES (11, 031, 07, 'Rupnagar', 07, 1, 224, 2, 2);
INSERT INTO stitbz_p2_2_sub_stratum_size_and_allocation_urban_sector_punjab VALUES (12, 031, 07, 'Rupnagar', 07, 2, 96, 2, 2);
INSERT INTO stitbz_p2_2_sub_stratum_size_and_allocation_urban_sector_punjab VALUES (13, 032, 08, 'Fatehgarh Sahib', 08, 1, 72, 2, 2);
INSERT INTO stitbz_p2_2_sub_stratum_size_and_allocation_urban_sector_punjab VALUES (14, 032, 08, 'Fatehgarh Sahib', 08, 2, 268, 2, 2);
INSERT INTO stitbz_p2_2_sub_stratum_size_and_allocation_urban_sector_punjab VALUES (15, 032, 09, 'Ludhiana', 09, 1, 402, 2, 2);
INSERT INTO stitbz_p2_2_sub_stratum_size_and_allocation_urban_sector_punjab VALUES (16, 032, 09, 'Ludhiana', 09, 2, 410, 2, 2);
INSERT INTO stitbz_p2_2_sub_stratum_size_and_allocation_urban_sector_punjab VALUES (17, 032, 10, 'Moga', 10, 1, 102, 2, 2);
INSERT INTO stitbz_p2_2_sub_stratum_size_and_allocation_urban_sector_punjab VALUES (18, 032, 10, 'Moga', 10, 2, 195, 2, 2);
INSERT INTO stitbz_p2_2_sub_stratum_size_and_allocation_urban_sector_punjab VALUES (19, 032, 11, 'Firozpur', 11, 1, 322, 2, 2);
INSERT INTO stitbz_p2_2_sub_stratum_size_and_allocation_urban_sector_punjab VALUES (20, 032, 11, 'Firozpur', 11, 2, 495, 2, 2);
INSERT INTO stitbz_p2_2_sub_stratum_size_and_allocation_urban_sector_punjab VALUES (21, 032, 12, 'Muktsar', 12, 1, 65, 2, 2);
INSERT INTO stitbz_p2_2_sub_stratum_size_and_allocation_urban_sector_punjab VALUES (22, 032, 12, 'Muktsar', 12, 2, 261, 2, 2);
INSERT INTO stitbz_p2_2_sub_stratum_size_and_allocation_urban_sector_punjab VALUES (23, 032, 13, 'Faridkot', 13, 1, 64, 2, 2);
INSERT INTO stitbz_p2_2_sub_stratum_size_and_allocation_urban_sector_punjab VALUES (24, 032, 13, 'Faridkot', 13, 2, 258, 2, 2);
INSERT INTO stitbz_p2_2_sub_stratum_size_and_allocation_urban_sector_punjab VALUES (25, 032, 14, 'Bathinda', 14, 1, 259, 2, 2);
INSERT INTO stitbz_p2_2_sub_stratum_size_and_allocation_urban_sector_punjab VALUES (26, 032, 14, 'Bathinda', 14, 2, 921, 2, 2);;

-- SQL for p29.md

CREATE TABLE stitbz_p29_1_sub_stratum_size_allocation_urban_sector (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p29_1_sub_stratum_size_allocation_urban_sector VALUES (1, 341, 03, 'Mahe', 03, 1, 57, 2, 2);
INSERT INTO stitbz_p29_1_sub_stratum_size_allocation_urban_sector VALUES (2, 341, 04, 'Karaikal', 04, 1, 167, 4, 4);
INSERT INTO stitbz_p29_1_sub_stratum_size_allocation_urban_sector VALUES (3, NULL, NULL, 'State Total', NULL, NULL, 1327, 24, 24);;

CREATE TABLE stitbz_p29_2_andaman_nicobar_islands_sub_stratum (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p29_2_andaman_nicobar_islands_sub_stratum VALUES (1, 351, 01, 'South Andaman', 01, 1, 36, 4, 0);
INSERT INTO stitbz_p29_2_andaman_nicobar_islands_sub_stratum VALUES (2, 351, 01, 'South Andaman', 01, 2, 160, 8, 0);
INSERT INTO stitbz_p29_2_andaman_nicobar_islands_sub_stratum VALUES (3, NULL, NULL, 'State Total', NULL, NULL, 196, 12, 0);;

CREATE TABLE stitbz_p29_3_telangana_sub_stratum (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p29_3_telangana_sub_stratum VALUES (1, 361, 01, 'Adilabad', 01, 1, 457, 4, 8);
INSERT INTO stitbz_p29_3_telangana_sub_stratum VALUES (2, 361, 01, 'Adilabad', 01, 2, 858, 4, 8);
INSERT INTO stitbz_p29_3_telangana_sub_stratum VALUES (3, 361, 02, 'Nizamabad', 02, 1, 164, 2, 4);
INSERT INTO stitbz_p29_3_telangana_sub_stratum VALUES (4, 361, 02, 'Nizamabad', 02, 2, 793, 4, 8);
INSERT INTO stitbz_p29_3_telangana_sub_stratum VALUES (5, 362, 03, 'Karimnagar', 03, 1, 167, 2, 4);
INSERT INTO stitbz_p29_3_telangana_sub_stratum VALUES (6, 362, 03, 'Karimnagar', 03, 2, 1298, 8, 16);
INSERT INTO stitbz_p29_3_telangana_sub_stratum VALUES (7, 361, 04, 'Medak', 04, 1, 591, 4, 8);
INSERT INTO stitbz_p29_3_telangana_sub_stratum VALUES (8, 361, 04, 'Medak', 04, 2, 486, 2, 4);
INSERT INTO stitbz_p29_3_telangana_sub_stratum VALUES (9, 361, 05, 'Hyderabad', 05, 1, 363, 4, 8);
INSERT INTO stitbz_p29_3_telangana_sub_stratum VALUES (10, 361, 06, 'Rangareddi', 06, 1, 575, 4, 8);
INSERT INTO stitbz_p29_3_telangana_sub_stratum VALUES (11, 361, 06, 'Rangareddi', 06, 2, 510, 4, 8);
INSERT INTO stitbz_p29_3_telangana_sub_stratum VALUES (12, 361, 07, 'Mahbubnagar', 07, 1, 425, 2, 4);
INSERT INTO stitbz_p29_3_telangana_sub_stratum VALUES (13, 361, 07, 'Mahbubnagar', 07, 2, 631, 4, 8);
INSERT INTO stitbz_p29_3_telangana_sub_stratum VALUES (14, 362, 08, 'Nalgonda', 08, 1, 307, 2, 4);
INSERT INTO stitbz_p29_3_telangana_sub_stratum VALUES (15, 362, 08, 'Nalgonda', 08, 2, 856, 4, 8);
INSERT INTO stitbz_p29_3_telangana_sub_stratum VALUES (16, 362, 09, 'Warangal', 09, 1, 289, 2, 4);
INSERT INTO stitbz_p29_3_telangana_sub_stratum VALUES (17, 362, 09, 'Warangal', 09, 2, 1665, 8, 16);
INSERT INTO stitbz_p29_3_telangana_sub_stratum VALUES (18, 362, 10, 'Khammam', 10, 1, 395, 2, 4);
INSERT INTO stitbz_p29_3_telangana_sub_stratum VALUES (19, 362, 10, 'Khammam', 10, 2, 799, 4, 8);
INSERT INTO stitbz_p29_3_telangana_sub_stratum VALUES (20, 361, 05, 'Hyderabad', 24, 1, 12492, 24, 48);
INSERT INTO stitbz_p29_3_telangana_sub_stratum VALUES (21, NULL, NULL, 'State Total', NULL, NULL, 24121, 94, 188);;

CREATE TABLE stitbz_p29_4_all_india_total (
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p29_4_all_india_total VALUES (NULL, NULL, 'All-India Total', NULL, NULL, 598892, 3508, 4076);;

-- SQL for p3.md

CREATE TABLE stitbz_p3_1_sub_stratum_size_allocation_urban_sector (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region TEXT,
    district_code TEXT,
    district_name TEXT,
    stratum TEXT,
    sub_stratum TEXT,
    size_zst TEXT,
    central_sample TEXT,
    state_sample TEXT
);

INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (1, 032, 15, 'Mansa', 15, 1, 287, 2, 2);
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (2, 032, 16, 'Sangrur', 16, 1, 259, 2, 2);
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (3, 032, 16, 'Sangrur', 16, 2, 464, 2, 2);
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (4, 032, 17, 'Patiala', 17, 1, 258, 2, 2);
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (5, 032, 17, 'Patiala', 17, 2, 915, 2, 2);
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (6, 031, 18, 'S.A.S. nagar (Mohali)', 18, 1, 317, 2, 2);
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (7, 031, 18, 'S.A.S. nagar (Mohali)', 18, 2, 567, 2, 2);
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (8, 032, 19, 'Barnala', 19, 1, 106, 2, 2);
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (9, 032, 19, 'Barnala', 19, 2, 140, 2, 2);
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (10, 031, 20, 'Tarn Taran', 20, 1, 212, 2, 2);
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (11, 031, 02, 'Amritsar', 21, 1, 1728, 8, 8);
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (12, 032, 09, 'Ludhiana', 22, 1, 2823, 8, 8);
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (13, NULL, NULL, 'State Total', NULL, NULL, 17514, 92, 92);
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (14, 'nss_state_region', 'district_code', 'district_name', 'stratum', 'sub_stratum', 'size_zst', 'central_sample', 'state_sample');
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (15, '---', '---', '---', '---', '---', '---', '---', '---');
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (16, 041, 01, 'Chandigarh', 01, 1, 114, 2, 0);
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (17, 041, 01, 'Chandigarh', 01, 2, 1766, 14, 0);
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (18, NULL, NULL, 'State Total', NULL, NULL, 1880, 16, 0);
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (19, 'nss_state_region', 'district_code', 'district_name', 'stratum', 'sub_stratum', 'size_zst', 'central_sample', 'state_sample');
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (20, '---', '---', '---', '---', '---', '---', '---', '---');
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (21, 051, 01, 'Uttarkashi', 01, 1, 35, 2, 2);
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (22, 051, 02, 'Chamoli', 02, 1, 76, 2, 2);
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (23, 051, 03, 'Rudraprayag', 03, 1, 22, 2, 2);
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (24, 051, 04, 'Tehri Garhwal', 04, 1, 131, 2, 2);
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (25, 051, 05, 'Dehradun', 05, 1, 391, 2, 2);
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (26, 051, 05, 'Dehradun', 05, 2, 932, 2, 2);
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (27, 051, 06, 'Garhwal', 06, 1, 163, 2, 2);
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (28, 051, 07, 'Pithoragarh', 07, 1, 98, 2, 2);
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (29, 051, 08, 'Bageshwar', 08, 1, 14, 2, 2);
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (30, 051, 09, 'Almora', 09, 1, 106, 2, 2);
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (31, 051, 10, 'Champawat', 10, 1, 68, 2, 2);
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (32, 051, 11, 'Nainital', 11, 1, 485, 2, 2);
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (33, 051, 12, 'Udham Singh Nagar', 12, 1, 467, 2, 2);
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (34, 051, 12, 'Udham Singh Nagar', 12, 2, 304, 2, 2);
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (35, 051, 13, 'Hardwar', 13, 1, 448, 2, 2);
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (36, 051, 13, 'Hardwar', 13, 2, 559, 2, 2);
INSERT INTO stitbz_p3_1_sub_stratum_size_allocation_urban_sector VALUES (37, NULL, NULL, 'State Total', NULL, NULL, 4299, 32, 32);;

-- SQL for p28.md

CREATE TABLE stitbz_p28_1_sub_stratum_size_allocation_urban_sector (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (1, 331, 18, 'Cuddalore', 18, 1, 692, 2, 2);
INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (2, 331, 18, 'Cuddalore', 18, 2, 678, 4, 4);
INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (3, 332, 19, 'Nagapattinam', 19, 1, 322, 2, 2);
INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (4, 332, 19, 'Nagapattinam', 19, 2, 342, 2, 2);
INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (5, 332, 20, 'Thiruvarur', 20, 1, 446, 2, 2);
INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (6, 332, 21, 'Thanjavur', 21, 1, 766, 2, 2);
INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (7, 332, 21, 'Thanjavur', 21, 2, 832, 4, 4);
INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (8, 332, 22, 'Pudukkottai', 22, 1, 297, 2, 2);
INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (9, 332, 22, 'Pudukkottai', 22, 2, 252, 2, 2);
INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (10, 333, 23, 'Sivaganga', 23, 1, 506, 2, 2);
INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (11, 333, 23, 'Sivaganga', 23, 2, 176, 2, 2);
INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (12, 333, 24, 'Madurai', 24, 1, 899, 4, 4);
INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (13, 333, 24, 'Madurai', 24, 2, 353, 2, 2);
INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (14, 333, 25, 'Theni', 25, 1, 705, 2, 2);
INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (15, 333, 25, 'Theni', 25, 2, 592, 2, 2);
INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (16, 333, 26, 'Virudhunagar', 26, 1, 1031, 4, 4);
INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (17, 333, 26, 'Virudhunagar', 26, 2, 772, 4, 4);
INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (18, 333, 27, 'Ramanathapuram', 27, 1, 433, 2, 2);
INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (19, 333, 27, 'Ramanathapuram', 27, 2, 186, 2, 2);
INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (20, 333, 28, 'Toothukudi', 28, 1, 812, 4, 4);
INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (21, 333, 28, 'Toothukudi', 28, 2, 610, 2, 2);
INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (22, 333, 29, 'Tirunelveli', 29, 1, 1262, 6, 6);
INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (23, 333, 29, 'Tirunelveli', 29, 2, 1120, 6, 6);
INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (24, 333, 30, 'Kanniyakumari', 30, 1, 2125, 10, 10);
INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (25, 333, 30, 'Kanniyakumari', 30, 2, 325, 2, 2);
INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (26, 334, 31, 'Krishnagiri', 31, 1, 285, 2, 2);
INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (27, 334, 31, 'Krishnagiri', 31, 2, 252, 2, 2);
INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (28, 334, 32, 'Tiruppur', 32, 1, 817, 8, 8);
INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (29, 334, 32, 'Tiruppur', 32, 2, 235, 4, 4);
INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (30, 331, 02, 'Chennai', 33, 1, 8551, 20, 20);
INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (31, 334, 12, 'Coimbatore', 34, 1, 2036, 8, 8);
INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (32, 333, 24, 'Madurai', 35, 1, 1680, 8, 8);
INSERT INTO stitbz_p28_1_sub_stratum_size_allocation_urban_sector VALUES (33, NULL, NULL, 'State Total', NULL, NULL, 63001, 244, 244);;

CREATE TABLE stitbz_p28_2_sub_stratum_size_allocation_urban_sector_puducherr (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p28_2_sub_stratum_size_allocation_urban_sector_puducherr VALUES (1, 341, 01, 'Yanam', 01, 2, 60, 2, 2);
INSERT INTO stitbz_p28_2_sub_stratum_size_allocation_urban_sector_puducherr VALUES (2, 341, 02, 'Puducherry', 02, 1, 115, 4, 4);
INSERT INTO stitbz_p28_2_sub_stratum_size_allocation_urban_sector_puducherr VALUES (3, 341, 02, 'Puducherry', 02, 2, 928, 12, 12);;

-- SQL for p7.md

CREATE TABLE stitbz_p7_1_sub_stratum_size_allocation_urban_sector (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (1, 091, 06, 'J Phule Nagar', 06, 1, 380, 2, 2);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (2, 091, 06, 'J Phule Nagar', 06, 2, 211, 2, 2);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (3, 091, 07, 'Meerut', 07, 1, 463, 2, 2);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (4, 091, 07, 'Meerut', 07, 2, 308, 2, 2);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (5, 091, 08, 'Baghpat', 08, 1, 425, 2, 2);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (6, 091, 09, 'Ghaziabad', 09, 1, 427, 2, 2);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (7, 091, 09, 'Ghaziabad', 09, 2, 2556, 6, 6);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (8, 091, 10, 'G. Buddha Nagar', 10, 1, 235, 2, 2);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (9, 091, 10, 'G. Buddha Nagar', 10, 2, 2393, 6, 6);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (10, 095, 11, 'Bulandshahr', 11, 1, 590, 4, 4);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (11, 095, 11, 'Bulandshahr', 11, 2, 629, 4, 4);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (12, 095, 12, 'Aligarh', 12, 1, 586, 2, 2);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (13, 095, 12, 'Aligarh', 12, 2, 1352, 6, 6);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (14, 095, 13, 'Hathras', 13, 1, 301, 2, 2);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (15, 095, 13, 'Hathras', 13, 2, 218, 2, 2);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (16, 095, 14, 'Mathura', 14, 1, 492, 2, 2);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (17, 095, 14, 'Mathura', 14, 2, 499, 2, 2);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (18, 095, 15, 'Agra', 15, 1, 628, 4, 4);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (19, 095, 16, 'Firozabad', 16, 1, 228, 2, 2);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (20, 095, 16, 'Firozabad', 16, 2, 831, 4, 4);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (21, 095, 17, 'Etah', 17, 1, 446, 2, 2);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (22, 095, 18, 'Mainpuri', 18, 1, 234, 2, 2);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (23, 095, 18, 'Mainpuri', 18, 2, 150, 2, 2);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (24, 095, 19, 'Budaun', 19, 1, 656, 2, 2);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (25, 095, 19, 'Budaun', 19, 2, 205, 2, 2);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (26, 095, 20, 'Bareilly', 20, 1, 771, 4, 4);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (27, 095, 20, 'Bareilly', 20, 2, 1237, 6, 6);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (28, 095, 21, 'Pilibhit', 21, 1, 292, 2, 2);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (29, 095, 21, 'Pilibhit', 21, 2, 186, 2, 2);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (30, 095, 22, 'Shahjahanpur', 22, 1, 399, 2, 2);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (31, 095, 22, 'Shahjahanpur', 22, 2, 408, 2, 2);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (32, 095, 23, 'Kheri', 23, 1, 365, 2, 2);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (33, 095, 23, 'Kheri', 23, 2, 286, 2, 2);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (34, 092, 24, 'Sitapur', 24, 1, 424, 2, 2);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (35, 092, 24, 'Sitapur', 24, 2, 223, 2, 2);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (36, 092, 25, 'Hardoi', 25, 1, 422, 2, 2);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (37, 092, 25, 'Hardoi', 25, 2, 166, 2, 2);
INSERT INTO stitbz_p7_1_sub_stratum_size_allocation_urban_sector VALUES (38, 092, 26, 'Unnao', 26, 1, 483, 2, 2);;

-- SQL for p18.md

CREATE TABLE stitbz_p18_1_sub_stratum_size_and_allocation_urban_sector (
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p18_1_sub_stratum_size_and_allocation_urban_sector VALUES (222, 11, 'Raipur', 19, 1, 1230, 8, 8);
INSERT INTO stitbz_p18_1_sub_stratum_size_and_allocation_urban_sector VALUES (NULL, NULL, 'State Total', NULL, NULL, 9007, 56, 56);;

CREATE TABLE stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh VALUES (1, 236, 01, 'Sheopur', 01, 1, 172, 2, 2);
INSERT INTO stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh VALUES (2, 236, 02, 'Morena', 02, 1, 397, 2, 2);
INSERT INTO stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh VALUES (3, 236, 02, 'Morena', 02, 2, 271, 2, 2);
INSERT INTO stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh VALUES (4, 236, 03, 'Bhind', 03, 1, 295, 2, 2);
INSERT INTO stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh VALUES (5, 236, 03, 'Bhind', 03, 2, 379, 2, 2);
INSERT INTO stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh VALUES (6, 236, 04, 'Gwalior', 04, 1, 331, 2, 2);
INSERT INTO stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh VALUES (7, 236, 05, 'Datia', 05, 1, 319, 2, 2);
INSERT INTO stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh VALUES (8, 236, 06, 'Shivpuri', 06, 1, 161, 2, 2);
INSERT INTO stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh VALUES (9, 236, 06, 'Shivpuri', 06, 2, 230, 2, 2);
INSERT INTO stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh VALUES (10, 236, 07, 'Guna', 07, 1, 157, 2, 2);
INSERT INTO stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh VALUES (11, 236, 07, 'Guna', 07, 2, 267, 2, 2);
INSERT INTO stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh VALUES (12, 231, 08, 'Tikamgarh', 08, 1, 373, 2, 2);
INSERT INTO stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh VALUES (13, 231, 09, 'Chhatarpur', 09, 1, 396, 2, 2);
INSERT INTO stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh VALUES (14, 231, 09, 'Chhatarpur', 09, 2, 261, 2, 2);
INSERT INTO stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh VALUES (15, 231, 10, 'Panna', 10, 1, 192, 2, 2);
INSERT INTO stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh VALUES (16, 232, 11, 'Sagar', 11, 1, 540, 4, 4);
INSERT INTO stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh VALUES (17, 232, 11, 'Sagar', 11, 2, 861, 4, 4);
INSERT INTO stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh VALUES (18, 232, 12, 'Damoh', 12, 1, 325, 2, 2);
INSERT INTO stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh VALUES (19, 231, 13, 'Satna', 13, 1, 277, 2, 2);
INSERT INTO stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh VALUES (20, 231, 13, 'Satna', 13, 2, 346, 2, 2);
INSERT INTO stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh VALUES (21, 231, 14, 'Rewa', 14, 1, 241, 2, 2);
INSERT INTO stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh VALUES (22, 231, 14, 'Rewa', 14, 2, 311, 2, 2);
INSERT INTO stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh VALUES (23, 231, 15, 'Umaria', 15, 1, 158, 2, 2);
INSERT INTO stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh VALUES (24, 231, 16, 'Shahdol', 16, 1, 326, 2, 2);
INSERT INTO stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh VALUES (25, 231, 17, 'Sidhi', 17, 1, 109, 2, 2);
INSERT INTO stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh VALUES (26, 233, 18, 'Neemuch', 18, 1, 343, 2, 2);
INSERT INTO stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh VALUES (27, 233, 19, 'Mandsaur', 19, 1, 214, 2, 2);
INSERT INTO stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh VALUES (28, 233, 19, 'Mandsaur', 19, 2, 183, 2, 2);
INSERT INTO stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh VALUES (29, 233, 20, 'Ratlam', 20, 1, 118, 2, 2);
INSERT INTO stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh VALUES (30, 233, 20, 'Ratlam', 20, 2, 483, 2, 2);
INSERT INTO stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh VALUES (31, 233, 21, 'Ujjain', 21, 1, 227, 2, 2);
INSERT INTO stitbz_p18_2_sub_stratum_size_and_allocation_madhya_pradesh VALUES (32, 233, 21, 'Ujjain', 21, 2, 906, 6, 6);;

-- SQL for p4.md

CREATE TABLE stitbz_p4_1_sub_stratum_size_allocation_urban_sector (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (1, 061, 01, 'Panchkula', 01, 1, 148, 2, 2);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (2, 061, 01, 'Panchkula', 01, 2, 306, 2, 2);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (3, 061, 02, 'Ambala', 02, 1, 105, 2, 2);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (4, 061, 02, 'Ambala', 02, 2, 724, 2, 2);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (5, 061, 03, 'Yamunanagar', 03, 1, 184, 2, 2);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (6, 061, 03, 'Yamunanagar', 03, 2, 525, 2, 2);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (7, 061, 04, 'Kurukshetra', 04, 1, 377, 2, 2);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (8, 061, 05, 'Kaithal', 05, 1, 294, 2, 2);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (9, 061, 06, 'Karnal', 06, 1, 218, 2, 2);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (10, 061, 06, 'Karnal', 06, 2, 486, 2, 2);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (11, 061, 07, 'Panipat', 07, 1, 141, 2, 2);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (12, 061, 07, 'Panipat', 07, 2, 696, 2, 2);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (13, 061, 08, 'Sonipat', 08, 1, 206, 2, 2);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (14, 061, 08, 'Sonipat', 08, 2, 436, 2, 2);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (15, 062, 09, 'Jind', 09, 1, 99, 2, 2);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (16, 062, 09, 'Jind', 09, 2, 384, 2, 2);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (17, 062, 10, 'Fatehabad', 10, 1, 243, 2, 2);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (18, 062, 11, 'Sirsa', 11, 1, 109, 2, 2);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (19, 062, 11, 'Sirsa', 11, 2, 413, 2, 2);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (20, 062, 12, 'Hisar', 12, 1, 326, 2, 2);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (21, 062, 12, 'Hisar', 12, 2, 611, 2, 2);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (22, 062, 13, 'Bhiwani', 13, 1, 167, 2, 2);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (23, 062, 13, 'Bhiwani', 13, 2, 282, 2, 2);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (24, 061, 14, 'Rohtak', 14, 1, 86, 2, 2);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (25, 061, 14, 'Rohtak', 14, 2, 740, 2, 2);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (26, 061, 15, 'Jhajjar', 15, 1, 452, 2, 2);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (27, 062, 16, 'Mahendragarh', 16, 1, 181, 2, 2);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (28, 062, 17, 'Rewari', 17, 1, 342, 2, 2);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (29, 061, 18, 'Gurgaon', 18, 1, 223, 2, 2);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (30, 061, 18, 'Gurgaon', 18, 2, 2988, 4, 4);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (31, 061, 19, 'Faridabad', 19, 1, 90, 2, 2);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (32, 061, 20, 'Mewat', 20, 1, 94, 2, 2);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (33, 061, 21, 'Palwal', 21, 1, 255, 2, 2);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (34, 061, 19, 'Faridabad', 22, 1, 2668, 8, 8);
INSERT INTO stitbz_p4_1_sub_stratum_size_allocation_urban_sector VALUES (35, NULL, NULL, 'State Total', NULL, NULL, 15599, 76, 76);;

-- SQL for p5.md

CREATE TABLE stitbz_p5_1_sub_stratum_size_and_allocation_for_urban_sector (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code TEXT,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p5_1_sub_stratum_size_and_allocation_for_urban_sector VALUES (1, 071, '-', 'all districts combined', 10, 1, 15859, 100, 100);
INSERT INTO stitbz_p5_1_sub_stratum_size_and_allocation_for_urban_sector VALUES (2, 071, '-', 'all districts combined', 99, 1, 2718, 12, 12);
INSERT INTO stitbz_p5_1_sub_stratum_size_and_allocation_for_urban_sector VALUES (3, 071, '-', 'all districts combined', 99, 2, 9544, 36, 36);
INSERT INTO stitbz_p5_1_sub_stratum_size_and_allocation_for_urban_sector VALUES (4, NULL, NULL, 'state total', NULL, NULL, 28121, 148, 148);;

CREATE TABLE stitbz_p5_2_sub_stratum_size_and_allocation_for_urban_sector_ra (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p5_2_sub_stratum_size_and_allocation_for_urban_sector_ra VALUES (1, 085, 01, 'Ganganagar', 01, 1, 332, 2, 2);
INSERT INTO stitbz_p5_2_sub_stratum_size_and_allocation_for_urban_sector_ra VALUES (2, 085, 01, 'Ganganagar', 01, 2, 534, 2, 2);
INSERT INTO stitbz_p5_2_sub_stratum_size_and_allocation_for_urban_sector_ra VALUES (3, 085, 02, 'Hanumangarh', 02, 1, 319, 2, 2);
INSERT INTO stitbz_p5_2_sub_stratum_size_and_allocation_for_urban_sector_ra VALUES (4, 085, 02, 'Hanumangarh', 02, 2, 236, 2, 2);
INSERT INTO stitbz_p5_2_sub_stratum_size_and_allocation_for_urban_sector_ra VALUES (5, 081, 03, 'Bikaner', 03, 1, 885, 4, 4);
INSERT INTO stitbz_p5_2_sub_stratum_size_and_allocation_for_urban_sector_ra VALUES (6, 085, 04, 'Churu', 04, 1, 294, 2, 2);
INSERT INTO stitbz_p5_2_sub_stratum_size_and_allocation_for_urban_sector_ra VALUES (7, 085, 04, 'Churu', 04, 2, 535, 2, 2);
INSERT INTO stitbz_p5_2_sub_stratum_size_and_allocation_for_urban_sector_ra VALUES (8, 085, 05, 'Jhunjhunun', 05, 1, 367, 2, 2);
INSERT INTO stitbz_p5_2_sub_stratum_size_and_allocation_for_urban_sector_ra VALUES (9, 085, 05, 'Jhunjhunun', 05, 2, 290, 2, 2);
INSERT INTO stitbz_p5_2_sub_stratum_size_and_allocation_for_urban_sector_ra VALUES (10, 082, 06, 'Alwar', 06, 1, 243, 2, 2);
INSERT INTO stitbz_p5_2_sub_stratum_size_and_allocation_for_urban_sector_ra VALUES (11, 082, 06, 'Alwar', 06, 2, 598, 2, 2);
INSERT INTO stitbz_p5_2_sub_stratum_size_and_allocation_for_urban_sector_ra VALUES (12, 082, 07, 'Bharatpur', 07, 1, 355, 2, 2);
INSERT INTO stitbz_p5_2_sub_stratum_size_and_allocation_for_urban_sector_ra VALUES (13, 082, 07, 'Bharatpur', 07, 2, 274, 2, 2);
INSERT INTO stitbz_p5_2_sub_stratum_size_and_allocation_for_urban_sector_ra VALUES (14, 082, 08, 'Dhaulpur', 08, 1, 126, 2, 2);
INSERT INTO stitbz_p5_2_sub_stratum_size_and_allocation_for_urban_sector_ra VALUES (15, 082, 08, 'Dhaulpur', 08, 2, 143, 2, 2);
INSERT INTO stitbz_p5_2_sub_stratum_size_and_allocation_for_urban_sector_ra VALUES (16, 082, 09, 'Karauli', 09, 1, 283, 2, 2);
INSERT INTO stitbz_p5_2_sub_stratum_size_and_allocation_for_urban_sector_ra VALUES (17, 082, 10, 'Sawai Madhopur', 10, 1, 344, 4, 4);
INSERT INTO stitbz_p5_2_sub_stratum_size_and_allocation_for_urban_sector_ra VALUES (18, 082, 11, 'Dausa', 11, 1, 349, 2, 2);
INSERT INTO stitbz_p5_2_sub_stratum_size_and_allocation_for_urban_sector_ra VALUES (19, 082, 12, 'Jaipur', 12, 1, 414, 2, 2);
INSERT INTO stitbz_p5_2_sub_stratum_size_and_allocation_for_urban_sector_ra VALUES (20, 082, 12, 'Jaipur', 12, 2, 110, 2, 2);
INSERT INTO stitbz_p5_2_sub_stratum_size_and_allocation_for_urban_sector_ra VALUES (21, 085, 13, 'Sikar', 13, 1, 399, 2, 2);
INSERT INTO stitbz_p5_2_sub_stratum_size_and_allocation_for_urban_sector_ra VALUES (22, 085, 13, 'Sikar', 13, 2, 424, 2, 2);
INSERT INTO stitbz_p5_2_sub_stratum_size_and_allocation_for_urban_sector_ra VALUES (23, 085, 14, 'Nagaur', 14, 1, 581, 2, 2);
INSERT INTO stitbz_p5_2_sub_stratum_size_and_allocation_for_urban_sector_ra VALUES (24, 085, 14, 'Nagaur', 14, 2, 461, 2, 2);
INSERT INTO stitbz_p5_2_sub_stratum_size_and_allocation_for_urban_sector_ra VALUES (25, 081, 15, 'Jodhpur', 15, 1, 250, 2, 2);
INSERT INTO stitbz_p5_2_sub_stratum_size_and_allocation_for_urban_sector_ra VALUES (26, 081, 15, 'Jodhpur', 15, 2, 227, 2, 2);
INSERT INTO stitbz_p5_2_sub_stratum_size_and_allocation_for_urban_sector_ra VALUES (27, 081, 16, 'Jaisalmer', 16, 1, 141, 2, 2);
INSERT INTO stitbz_p5_2_sub_stratum_size_and_allocation_for_urban_sector_ra VALUES (28, 081, 17, 'Barmer', 17, 1, 373, 2, 2);
INSERT INTO stitbz_p5_2_sub_stratum_size_and_allocation_for_urban_sector_ra VALUES (29, 081, 18, 'Jalor', 18, 1, 275, 2, 2);
INSERT INTO stitbz_p5_2_sub_stratum_size_and_allocation_for_urban_sector_ra VALUES (30, 081, 19, 'Sirohi', 19, 1, 367, 2, 2);;

-- SQL for p1.md

CREATE TABLE stitbz_p1_1_table_3_sub_stratum_size_and_allocation_for_urban_s (
    table_3_sub_stratum_size_and_allocation_for_urban_sector NUMERIC,
    column_1 NUMERIC,
    column_2 NUMERIC,
    column_3 NUMERIC,
    column_4 NUMERIC,
    column_5 NUMERIC,
    column_6 NUMERIC,
    column_7 NUMERIC
);

;

-- SQL for p15.md

CREATE TABLE stitbz_p15_1_sub_stratum_size_and_allocation_urban_sector (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p15_1_sub_stratum_size_and_allocation_urban_sector VALUES (1, 195, 15, 'Paschim Midnapur', 15, 1, 318, 2, 2);
INSERT INTO stitbz_p15_1_sub_stratum_size_and_allocation_urban_sector VALUES (2, 195, 15, 'Paschim Midnapur', 15, 2, 912, 6, 6);
INSERT INTO stitbz_p15_1_sub_stratum_size_and_allocation_urban_sector VALUES (3, 194, 16, 'Howrah', 16, 1, 1568, 12, 12);
INSERT INTO stitbz_p15_1_sub_stratum_size_and_allocation_urban_sector VALUES (4, 194, 16, 'Howrah', 16, 2, 1388, 10, 10);
INSERT INTO stitbz_p15_1_sub_stratum_size_and_allocation_urban_sector VALUES (5, 193, 18, 'South 24-Parganas', 18, 1, 1397, 10, 10);
INSERT INTO stitbz_p15_1_sub_stratum_size_and_allocation_urban_sector VALUES (6, 193, 18, 'South 24-Parganas', 18, 2, 1780, 12, 12);
INSERT INTO stitbz_p15_1_sub_stratum_size_and_allocation_urban_sector VALUES (7, 195, 19, 'Purba Midnapur', 19, 1, 449, 4, 4);
INSERT INTO stitbz_p15_1_sub_stratum_size_and_allocation_urban_sector VALUES (8, 195, 19, 'Purba Midnapur', 19, 2, 387, 2, 2);
INSERT INTO stitbz_p15_1_sub_stratum_size_and_allocation_urban_sector VALUES (9, 194, 16, 'Howrah', 20, 1, 1569, 12, 12);
INSERT INTO stitbz_p15_1_sub_stratum_size_and_allocation_urban_sector VALUES (10, 193, 17, 'Kolkata', 21, 2, 8159, 46, 46);
INSERT INTO stitbz_p15_1_sub_stratum_size_and_allocation_urban_sector VALUES (11, NULL, NULL, 'State Total', NULL, NULL, 47827, 300, 300);;

CREATE TABLE stitbz_p15_2_sub_stratum_size_and_allocation_urban_sector_jhark (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p15_2_sub_stratum_size_and_allocation_urban_sector_jhark VALUES (1, 201, 01, 'Garhwa', 01, 1, 85, 2, 2);
INSERT INTO stitbz_p15_2_sub_stratum_size_and_allocation_urban_sector_jhark VALUES (2, 201, 02, 'Palamu', 02, 1, 323, 2, 2);
INSERT INTO stitbz_p15_2_sub_stratum_size_and_allocation_urban_sector_jhark VALUES (3, 202, 03, 'Chatra', 03, 1, 90, 2, 2);
INSERT INTO stitbz_p15_2_sub_stratum_size_and_allocation_urban_sector_jhark VALUES (4, 202, 04, 'Hazaribag', 04, 1, 625, 2, 2);
INSERT INTO stitbz_p15_2_sub_stratum_size_and_allocation_urban_sector_jhark VALUES (5, 202, 05, 'Kodarma', 05, 1, 235, 2, 2);
INSERT INTO stitbz_p15_2_sub_stratum_size_and_allocation_urban_sector_jhark VALUES (6, 202, 06, 'Giridih', 06, 1, 378, 2, 2);
INSERT INTO stitbz_p15_2_sub_stratum_size_and_allocation_urban_sector_jhark VALUES (7, 202, 07, 'Deoghar', 07, 1, 346, 2, 2);
INSERT INTO stitbz_p15_2_sub_stratum_size_and_allocation_urban_sector_jhark VALUES (8, 202, 08, 'Godda', 08, 1, 102, 2, 2);
INSERT INTO stitbz_p15_2_sub_stratum_size_and_allocation_urban_sector_jhark VALUES (9, 202, 09, 'Sahibganj', 09, 1, 275, 2, 2);
INSERT INTO stitbz_p15_2_sub_stratum_size_and_allocation_urban_sector_jhark VALUES (10, 202, 10, 'Pakaur', 10, 1, 77, 2, 2);
INSERT INTO stitbz_p15_2_sub_stratum_size_and_allocation_urban_sector_jhark VALUES (11, 202, 11, 'Dumka', 11, 1, 147, 2, 2);
INSERT INTO stitbz_p15_2_sub_stratum_size_and_allocation_urban_sector_jhark VALUES (12, 202, 12, 'Dhanbad', 12, 1, 2279, 2, 2);
INSERT INTO stitbz_p15_2_sub_stratum_size_and_allocation_urban_sector_jhark VALUES (13, 202, 13, 'Bokaro', 13, 1, 573, 2, 2);
INSERT INTO stitbz_p15_2_sub_stratum_size_and_allocation_urban_sector_jhark VALUES (14, 202, 13, 'Bokaro', 13, 2, 1138, 2, 2);
INSERT INTO stitbz_p15_2_sub_stratum_size_and_allocation_urban_sector_jhark VALUES (15, 201, 14, 'Ranchi', 14, 1, 348, 2, 2);
INSERT INTO stitbz_p15_2_sub_stratum_size_and_allocation_urban_sector_jhark VALUES (16, 201, 15, 'Lohardaga', 15, 1, 88, 2, 2);
INSERT INTO stitbz_p15_2_sub_stratum_size_and_allocation_urban_sector_jhark VALUES (17, 201, 16, 'Gumla', 16, 1, 88, 2, 2);
INSERT INTO stitbz_p15_2_sub_stratum_size_and_allocation_urban_sector_jhark VALUES (18, 201, 17, 'Singhbhum (W)', 17, 1, 458, 2, 2);
INSERT INTO stitbz_p15_2_sub_stratum_size_and_allocation_urban_sector_jhark VALUES (19, 201, 18, 'Singhbhum (E)', 18, 1, 597, 2, 2);
INSERT INTO stitbz_p15_2_sub_stratum_size_and_allocation_urban_sector_jhark VALUES (20, 201, 18, 'Singhbhum (E)', 18, 2, 2474, 6, 6);
INSERT INTO stitbz_p15_2_sub_stratum_size_and_allocation_urban_sector_jhark VALUES (21, 201, 19, 'Latehar', 19, 1, 91, 2, 2);
INSERT INTO stitbz_p15_2_sub_stratum_size_and_allocation_urban_sector_jhark VALUES (22, 201, 20, 'Simdega', 20, 1, 52, 2, 2);
INSERT INTO stitbz_p15_2_sub_stratum_size_and_allocation_urban_sector_jhark VALUES (23, 202, 21, 'Jamtara', 21, 1, 111, 2, 2);;

-- SQL for p21.md

CREATE TABLE stitbz_p21_1_sub_stratum_size_and_allocation_urban_sector (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p21_1_sub_stratum_size_and_allocation_urban_sector VALUES (1, 242, 16, 'Kheda', 16, 1, 388, 2, 2);
INSERT INTO stitbz_p21_1_sub_stratum_size_and_allocation_urban_sector VALUES (2, 242, 16, 'Kheda', 16, 2, 387, 2, 2);
INSERT INTO stitbz_p21_1_sub_stratum_size_and_allocation_urban_sector VALUES (3, 241, 17, 'Panch Mahals', 17, 1, 482, 2, 2);
INSERT INTO stitbz_p21_1_sub_stratum_size_and_allocation_urban_sector VALUES (4, 241, 18, 'Dohad', 18, 1, 291, 2, 2);
INSERT INTO stitbz_p21_1_sub_stratum_size_and_allocation_urban_sector VALUES (5, 241, 19, 'Vadodara', 19, 1, 411, 2, 2);
INSERT INTO stitbz_p21_1_sub_stratum_size_and_allocation_urban_sector VALUES (6, 241, 19, 'Vadodara', 19, 2, 87, 2, 2);
INSERT INTO stitbz_p21_1_sub_stratum_size_and_allocation_urban_sector VALUES (7, 241, 20, 'Narmada', 20, 1, 116, 2, 2);
INSERT INTO stitbz_p21_1_sub_stratum_size_and_allocation_urban_sector VALUES (8, 241, 21, 'Bharuch', 21, 1, 498, 2, 2);
INSERT INTO stitbz_p21_1_sub_stratum_size_and_allocation_urban_sector VALUES (9, 241, 21, 'Bharuch', 21, 2, 410, 2, 2);
INSERT INTO stitbz_p21_1_sub_stratum_size_and_allocation_urban_sector VALUES (10, 241, 22, 'Surat', 22, 1, 574, 2, 2);
INSERT INTO stitbz_p21_1_sub_stratum_size_and_allocation_urban_sector VALUES (11, 241, 23, 'The Dangs', 23, 1, 44, 2, 2);
INSERT INTO stitbz_p21_1_sub_stratum_size_and_allocation_urban_sector VALUES (12, 241, 24, 'Navsari', 24, 1, 199, 2, 2);
INSERT INTO stitbz_p21_1_sub_stratum_size_and_allocation_urban_sector VALUES (13, 241, 24, 'Navsari', 24, 2, 479, 2, 2);
INSERT INTO stitbz_p21_1_sub_stratum_size_and_allocation_urban_sector VALUES (14, 241, 25, 'Valsad', 25, 1, 537, 2, 2);
INSERT INTO stitbz_p21_1_sub_stratum_size_and_allocation_urban_sector VALUES (15, 241, 25, 'Valsad', 25, 2, 507, 2, 2);
INSERT INTO stitbz_p21_1_sub_stratum_size_and_allocation_urban_sector VALUES (16, 241, 26, 'Tapi', 26, 1, 114, 2, 2);
INSERT INTO stitbz_p21_1_sub_stratum_size_and_allocation_urban_sector VALUES (17, 242, 07, 'Ahmedabad', 27, 1, 8189, 26, 26);
INSERT INTO stitbz_p21_1_sub_stratum_size_and_allocation_urban_sector VALUES (18, 245, 09, 'Rajkot', 28, 1, 2213, 10, 10);
INSERT INTO stitbz_p21_1_sub_stratum_size_and_allocation_urban_sector VALUES (19, 241, 19, 'Vadodara', 29, 1, 2408, 12, 12);
INSERT INTO stitbz_p21_1_sub_stratum_size_and_allocation_urban_sector VALUES (20, 241, 22, 'Surat', 30, 1, 6109, 20, 20);
INSERT INTO stitbz_p21_1_sub_stratum_size_and_allocation_urban_sector VALUES (21, NULL, NULL, 'State Total', NULL, NULL, 37956, 164, 164);;

CREATE TABLE stitbz_p21_2_daman_diu_sub_stratum_size_allocation (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code TEXT,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p21_2_daman_diu_sub_stratum_size_allocation VALUES (1, 251, '-', 'all districts combined', 99, 1, 283, 6, 6);
INSERT INTO stitbz_p21_2_daman_diu_sub_stratum_size_allocation VALUES (2, 251, '-', 'all districts combined', 99, 2, 111, 2, 2);
INSERT INTO stitbz_p21_2_daman_diu_sub_stratum_size_allocation VALUES (3, NULL, NULL, 'State Total', NULL, NULL, 394, 8, 8);;

CREATE TABLE stitbz_p21_3_dadara_nagar_haveli_sub_stratum_size_allocation (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p21_3_dadara_nagar_haveli_sub_stratum_size_allocation VALUES (1, 261, 01, 'Dadra & Nagar Haveli', 01, 1, 195, 6, 0);
INSERT INTO stitbz_p21_3_dadara_nagar_haveli_sub_stratum_size_allocation VALUES (2, 261, 01, 'Dadra & Nagar Haveli', 01, 2, 63, 2, 0);
INSERT INTO stitbz_p21_3_dadara_nagar_haveli_sub_stratum_size_allocation VALUES (3, NULL, NULL, 'State Total', NULL, NULL, 258, 8, 0);;

CREATE TABLE stitbz_p21_4_maharashtra_sub_stratum_size_allocation (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p21_4_maharashtra_sub_stratum_size_allocation VALUES (1, 273, 01, 'Nandurbar', 01, 1, 391, 2, 4);
INSERT INTO stitbz_p21_4_maharashtra_sub_stratum_size_allocation VALUES (2, 273, 02, 'Dhule', 02, 1, 130, 2, 2);
INSERT INTO stitbz_p21_4_maharashtra_sub_stratum_size_allocation VALUES (3, 273, 02, 'Dhule', 02, 2, 728, 2, 4);;

-- SQL for p25.md

CREATE TABLE stitbz_p25_1_sub_stratum_size_and_allocation_urban (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (1, 294, 07, 'Koppal', 07, 1, 377, 2, 2);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (2, 294, 08, 'Gadag', 08, 1, 327, 2, 2);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (3, 294, 08, 'Gadag', 08, 2, 280, 2, 2);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (4, 294, 09, 'Dharwad', 09, 1, 180, 2, 2);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (5, 294, 09, 'Dharwad', 09, 2, 1519, 6, 6);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (6, 291, 10, 'Uttara Kannada', 10, 1, 521, 2, 2);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (7, 291, 10, 'Uttara Kannada', 10, 2, 184, 2, 2);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (8, 294, 11, 'Haveri', 11, 1, 274, 2, 2);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (9, 294, 11, 'Haveri', 11, 2, 354, 2, 2);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (10, 294, 12, 'Bellary', 12, 1, 366, 2, 2);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (11, 294, 12, 'Bellary', 12, 2, 848, 6, 6);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (12, 294, 13, 'Chitradurga', 13, 1, 526, 2, 2);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (13, 294, 14, 'Davanagere', 14, 1, 116, 2, 2);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (14, 294, 14, 'Davanagere', 14, 2, 959, 2, 2);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (15, 292, 15, 'Shimoga', 15, 1, 156, 2, 2);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (16, 292, 15, 'Shimoga', 15, 2, 988, 2, 2);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (17, 291, 16, 'Udupi', 16, 1, 355, 2, 2);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (18, 291, 16, 'Udupi', 16, 2, 213, 2, 2);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (19, 292, 17, 'Chikmagalur', 17, 1, 428, 2, 2);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (20, 293, 18, 'Tumkur', 18, 1, 308, 2, 2);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (21, 293, 18, 'Tumkur', 18, 2, 776, 2, 2);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (22, 293, 19, 'Kolar', 19, 1, 179, 2, 2);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (23, 293, 19, 'Kolar', 19, 2, 594, 2, 2);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (24, 293, 20, 'Bangalore', 20, 1, 303, 2, 2);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (25, 293, 21, 'Bangalore Rural', 21, 1, 420, 2, 2);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (26, 293, 22, 'Mandya', 22, 1, 511, 2, 2);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (27, 292, 23, 'Hassan', 23, 1, 271, 2, 2);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (28, 292, 23, 'Hassan', 23, 2, 196, 2, 2);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (29, 291, 24, 'Dakshina Kannada', 24, 1, 705, 4, 4);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (30, 291, 24, 'Dakshina Kannada', 24, 2, 737, 4, 4);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (31, 292, 25, 'Kodagu', 25, 1, 124, 2, 2);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (32, 293, 26, 'Mysore', 26, 1, 413, 2, 2);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (33, 293, 26, 'Mysore', 26, 2, 1835, 8, 8);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (34, 293, 27, 'Chamarajanagar', 27, 1, 259, 2, 2);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (35, 293, 28, 'Ramanagara', 28, 1, 361, 2, 2);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (36, 293, 29, 'Chikkaballapura', 29, 1, 375, 2, 2);
INSERT INTO stitbz_p25_1_sub_stratum_size_and_allocation_urban VALUES (37, 294, 30, 'Yadgir', 30, 1, 187, 2, 2);;

-- SQL for p11.md

CREATE TABLE stitbz_p11_1_sub_stratum_size_allocation_urban_sector (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p11_1_sub_stratum_size_allocation_urban_sector VALUES (1, 111, 01, 'North', 01, 1, 10, 2, 2);
INSERT INTO stitbz_p11_1_sub_stratum_size_allocation_urban_sector VALUES (2, 111, 02, 'West', 02, 1, 5, 2, 2);
INSERT INTO stitbz_p11_1_sub_stratum_size_allocation_urban_sector VALUES (3, 111, 03, 'South', 03, 1, 41, 4, 4);
INSERT INTO stitbz_p11_1_sub_stratum_size_allocation_urban_sector VALUES (4, 111, 04, 'East', 04, 1, 45, 4, 4);
INSERT INTO stitbz_p11_1_sub_stratum_size_allocation_urban_sector VALUES (5, 111, 04, 'East', 04, 2, 187, 12, 12);
INSERT INTO stitbz_p11_1_sub_stratum_size_allocation_urban_sector VALUES (6, NULL, NULL, 'State Total', NULL, NULL, 288, 24, 24);;

CREATE TABLE stitbz_p11_2_sub_stratum_size_allocation_urban_sector_2 (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p11_2_sub_stratum_size_allocation_urban_sector_2 VALUES (1, 121, 01, 'Tawang', 01, 1, 14, 2, 2);
INSERT INTO stitbz_p11_2_sub_stratum_size_allocation_urban_sector_2 VALUES (2, 121, 02, 'West Kameng', 02, 1, 33, 2, 2);
INSERT INTO stitbz_p11_2_sub_stratum_size_allocation_urban_sector_2 VALUES (3, 121, 03, 'East Kameng', 03, 1, 35, 2, 2);
INSERT INTO stitbz_p11_2_sub_stratum_size_allocation_urban_sector_2 VALUES (4, 121, 04, 'Papum Pare', 04, 1, 92, 4, 4);
INSERT INTO stitbz_p11_2_sub_stratum_size_allocation_urban_sector_2 VALUES (5, 121, 05, 'Lower Subansiri', 05, 1, 16, 2, 2);
INSERT INTO stitbz_p11_2_sub_stratum_size_allocation_urban_sector_2 VALUES (6, 121, 06, 'Upper Subansiri', 06, 1, 26, 2, 2);
INSERT INTO stitbz_p11_2_sub_stratum_size_allocation_urban_sector_2 VALUES (7, 121, 07, 'West Siang', 07, 1, 71, 4, 4);
INSERT INTO stitbz_p11_2_sub_stratum_size_allocation_urban_sector_2 VALUES (8, 121, 08, 'East Siang', 08, 1, 28, 4, 4);
INSERT INTO stitbz_p11_2_sub_stratum_size_allocation_urban_sector_2 VALUES (9, 121, 11, 'Lohit', 11, 1, 71, 4, 4);
INSERT INTO stitbz_p11_2_sub_stratum_size_allocation_urban_sector_2 VALUES (10, 121, 12, 'Changlang', 12, 1, 21, 2, 2);
INSERT INTO stitbz_p11_2_sub_stratum_size_allocation_urban_sector_2 VALUES (11, 121, 13, 'Tirap', 13, 1, 33, 2, 2);
INSERT INTO stitbz_p11_2_sub_stratum_size_allocation_urban_sector_2 VALUES (12, 121, 16, 'Lower Dibang Valley', 16, 1, 30, 2, 2);
INSERT INTO stitbz_p11_2_sub_stratum_size_allocation_urban_sector_2 VALUES (13, NULL, NULL, 'State Total', NULL, NULL, 470, 32, 32);;

CREATE TABLE stitbz_p11_3_sub_stratum_size_allocation_urban_sector_3 (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p11_3_sub_stratum_size_allocation_urban_sector_3 VALUES (1, 131, 01, 'Mon', 01, 1, 35, 2, 6);
INSERT INTO stitbz_p11_3_sub_stratum_size_allocation_urban_sector_3 VALUES (2, 131, 02, 'Tuensang', 02, 1, 26, 2, 6);
INSERT INTO stitbz_p11_3_sub_stratum_size_allocation_urban_sector_3 VALUES (3, 131, 03, 'Mokokchung', 03, 1, 108, 2, 6);
INSERT INTO stitbz_p11_3_sub_stratum_size_allocation_urban_sector_3 VALUES (4, 131, 04, 'Zunheboto', 04, 1, 43, 2, 6);
INSERT INTO stitbz_p11_3_sub_stratum_size_allocation_urban_sector_3 VALUES (5, 131, 05, 'Wokha', 05, 1, 57, 2, 6);
INSERT INTO stitbz_p11_3_sub_stratum_size_allocation_urban_sector_3 VALUES (6, 131, 06, 'Dimapur', 06, 1, 78, 2, 6);
INSERT INTO stitbz_p11_3_sub_stratum_size_allocation_urban_sector_3 VALUES (7, 131, 06, 'Dimapur', 06, 2, 104, 4, 12);
INSERT INTO stitbz_p11_3_sub_stratum_size_allocation_urban_sector_3 VALUES (8, 131, 07, 'Kohima', 07, 1, 41, 2, 6);
INSERT INTO stitbz_p11_3_sub_stratum_size_allocation_urban_sector_3 VALUES (9, 131, 07, 'Kohima', 07, 2, 107, 2, 6);
INSERT INTO stitbz_p11_3_sub_stratum_size_allocation_urban_sector_3 VALUES (10, 131, 08, 'Phek', 08, 1, 50, 2, 6);
INSERT INTO stitbz_p11_3_sub_stratum_size_allocation_urban_sector_3 VALUES (11, 131, 09, 'Kiphire', 09, 1, 25, 2, 6);
INSERT INTO stitbz_p11_3_sub_stratum_size_allocation_urban_sector_3 VALUES (12, 131, 10, 'Longleng', 10, 1, 10, 2, 6);;

-- SQL for p24.md

CREATE TABLE stitbz_p24_1_sub_stratum_size_allocation_urban_sector (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p24_1_sub_stratum_size_allocation_urban_sector VALUES (1, 281, 14, 'East Godavari', 14, 1, 432, 2, 4);
INSERT INTO stitbz_p24_1_sub_stratum_size_allocation_urban_sector VALUES (2, 281, 14, 'East Godavari', 14, 2, 2238, 10, 20);
INSERT INTO stitbz_p24_1_sub_stratum_size_allocation_urban_sector VALUES (3, 281, 15, 'West Godavari', 15, 1, 86, 2, 4);
INSERT INTO stitbz_p24_1_sub_stratum_size_allocation_urban_sector VALUES (4, 281, 15, 'West Godavari', 15, 2, 1366, 6, 12);
INSERT INTO stitbz_p24_1_sub_stratum_size_allocation_urban_sector VALUES (5, 282, 16, 'Krishna', 16, 1, 296, 2, 4);
INSERT INTO stitbz_p24_1_sub_stratum_size_allocation_urban_sector VALUES (6, 282, 16, 'Krishna', 16, 2, 1074, 6, 12);
INSERT INTO stitbz_p24_1_sub_stratum_size_allocation_urban_sector VALUES (7, 282, 17, 'Guntur', 17, 1, 2349, 14, 28);
INSERT INTO stitbz_p24_1_sub_stratum_size_allocation_urban_sector VALUES (8, 282, 18, 'Prakasam', 18, 1, 332, 2, 4);
INSERT INTO stitbz_p24_1_sub_stratum_size_allocation_urban_sector VALUES (9, 282, 18, 'Prakasam', 18, 2, 987, 4, 8);
INSERT INTO stitbz_p24_1_sub_stratum_size_allocation_urban_sector VALUES (10, 282, 19, 'Nellore', 19, 1, 181, 2, 4);
INSERT INTO stitbz_p24_1_sub_stratum_size_allocation_urban_sector VALUES (11, 282, 19, 'Nellore', 19, 2, 1298, 6, 12);
INSERT INTO stitbz_p24_1_sub_stratum_size_allocation_urban_sector VALUES (12, 285, 20, 'Cuddapah', 20, 1, 251, 2, 4);
INSERT INTO stitbz_p24_1_sub_stratum_size_allocation_urban_sector VALUES (13, 285, 20, 'Cuddapah', 20, 2, 1447, 6, 12);
INSERT INTO stitbz_p24_1_sub_stratum_size_allocation_urban_sector VALUES (14, 285, 21, 'Kurnool', 21, 1, 240, 2, 4);
INSERT INTO stitbz_p24_1_sub_stratum_size_allocation_urban_sector VALUES (15, 285, 21, 'Kurnool', 21, 2, 1768, 8, 16);
INSERT INTO stitbz_p24_1_sub_stratum_size_allocation_urban_sector VALUES (16, 285, 22, 'Anantapur', 22, 1, 381, 2, 4);
INSERT INTO stitbz_p24_1_sub_stratum_size_allocation_urban_sector VALUES (17, 285, 22, 'Anantapur', 22, 2, 1864, 8, 16);
INSERT INTO stitbz_p24_1_sub_stratum_size_allocation_urban_sector VALUES (18, 285, 23, 'Chittoor', 23, 1, 337, 2, 4);
INSERT INTO stitbz_p24_1_sub_stratum_size_allocation_urban_sector VALUES (19, 285, 23, 'Chittoor', 23, 2, 1525, 10, 20);
INSERT INTO stitbz_p24_1_sub_stratum_size_allocation_urban_sector VALUES (20, 281, 13, 'Visakhapatnam', 25, 1, 3767, 16, 32);
INSERT INTO stitbz_p24_1_sub_stratum_size_allocation_urban_sector VALUES (21, 282, 16, 'Krishna', 26, 1, 1989, 10, 20);
INSERT INTO stitbz_p24_1_sub_stratum_size_allocation_urban_sector VALUES (22, NULL, NULL, 'State Total', NULL, NULL, 26495, 150, 300);;

CREATE TABLE stitbz_p24_2_karnataka_29_sub_stratum_size_allocation_urban_sec (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p24_2_karnataka_29_sub_stratum_size_allocation_urban_sec VALUES (1, 294, 01, 'Belgaum', 01, 1, 830, 4, 4);
INSERT INTO stitbz_p24_2_karnataka_29_sub_stratum_size_allocation_urban_sec VALUES (2, 294, 01, 'Belgaum', 01, 2, 1221, 6, 6);
INSERT INTO stitbz_p24_2_karnataka_29_sub_stratum_size_allocation_urban_sec VALUES (3, 294, 02, 'Bagalkot', 02, 1, 375, 2, 2);
INSERT INTO stitbz_p24_2_karnataka_29_sub_stratum_size_allocation_urban_sec VALUES (4, 294, 02, 'Bagalkot', 02, 2, 593, 2, 2);
INSERT INTO stitbz_p24_2_karnataka_29_sub_stratum_size_allocation_urban_sec VALUES (5, 294, 03, 'Bijapur', 03, 1, 294, 2, 2);
INSERT INTO stitbz_p24_2_karnataka_29_sub_stratum_size_allocation_urban_sec VALUES (6, 294, 03, 'Bijapur', 03, 2, 496, 2, 2);
INSERT INTO stitbz_p24_2_karnataka_29_sub_stratum_size_allocation_urban_sec VALUES (7, 294, 04, 'Gulbarga', 04, 1, 444, 2, 2);
INSERT INTO stitbz_p24_2_karnataka_29_sub_stratum_size_allocation_urban_sec VALUES (8, 294, 04, 'Gulbarga', 04, 2, 581, 2, 2);
INSERT INTO stitbz_p24_2_karnataka_29_sub_stratum_size_allocation_urban_sec VALUES (9, 294, 05, 'Bidar', 05, 1, 264, 2, 2);
INSERT INTO stitbz_p24_2_karnataka_29_sub_stratum_size_allocation_urban_sec VALUES (10, 294, 05, 'Bidar', 05, 2, 230, 2, 2);
INSERT INTO stitbz_p24_2_karnataka_29_sub_stratum_size_allocation_urban_sec VALUES (11, 294, 06, 'Raichur', 06, 1, 211, 2, 2);
INSERT INTO stitbz_p24_2_karnataka_29_sub_stratum_size_allocation_urban_sec VALUES (12, 294, 06, 'Raichur', 06, 2, 367, 2, 2);;

-- SQL for p10.md

CREATE TABLE stitbz_p10_1_sub_stratum_size_allocation_urban_sector (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (1, 101, 05, 'Madhubani', 05, 1, 200, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (2, 101, 06, 'Supaul', 06, 1, 168, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (3, 101, 07, 'Araria', 07, 1, 230, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (4, 101, 08, 'Kishanganj', 08, 1, 276, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (5, 101, 09, 'Purnia', 09, 1, 777, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (6, 101, 10, 'Katihar', 10, 1, 434, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (7, 101, 11, 'Madhepura', 11, 1, 134, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (8, 101, 12, 'Saharsa', 12, 2, 265, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (9, 101, 13, 'Darbhanga', 13, 1, 430, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (10, 101, 14, 'Muzaffarpur', 14, 1, 527, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (11, 101, 15, 'Gopalganj', 15, 1, 190, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (12, 101, 16, 'Siwan', 16, 1, 232, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (13, 101, 17, 'Saran', 17, 1, 361, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (14, 101, 18, 'Vaishali', 18, 1, 240, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (15, 101, 19, 'Samastipur', 19, 1, 257, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (16, 101, 20, 'Begusarai', 20, 1, 227, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (17, 101, 21, 'Khagaria', 21, 1, 137, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (18, 102, 22, 'Bhagalpur', 22, 1, 272, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (19, 102, 22, 'Bhagalpur', 22, 2, 572, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (20, 102, 23, 'Banka', 23, 1, 136, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (21, 102, 24, 'Munger', 24, 1, 589, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (22, 102, 25, 'Lakhisarai', 25, 1, 198, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (23, 102, 26, 'Sheikhpura', 26, 1, 125, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (24, 102, 27, 'Nalanda', 27, 1, 690, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (25, 102, 28, 'Patna', 28, 1, 555, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (26, 102, 28, 'Patna', 28, 2, 569, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (27, 102, 29, 'Bhojpur', 29, 1, 574, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (28, 102, 30, 'Buxar', 30, 1, 227, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (29, 102, 31, 'Kaimur (Bhabua)', 31, 1, 125, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (30, 102, 32, 'Rohtas', 32, 1, 550, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (31, 102, 33, 'Jehanabad', 33, 1, 160, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (32, 102, 34, 'Aurangabad', 34, 1, 282, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (33, 102, 35, 'Gaya', 35, 1, 750, 4, 4);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (34, 102, 36, 'Nawada', 36, 1, 213, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (35, 102, 37, 'Jamui', 37, 1, 188, 2, 2);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (36, 102, 28, 'Patna', 39, 1, 2683, 8, 8);
INSERT INTO stitbz_p10_1_sub_stratum_size_allocation_urban_sector VALUES (37, NULL, NULL, 'State Total', NULL, NULL, 15714, 88, 88);;

-- SQL for p14.md

CREATE TABLE stitbz_p14_1_urban_sector_allocation (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p14_1_urban_sector_allocation VALUES (1, 183, 22, 'Karimganj', 22, 1, 163, 2, 2);
INSERT INTO stitbz_p14_1_urban_sector_allocation VALUES (2, 183, 23, 'Hailakandi', 23, 1, 68, 2, 2);
INSERT INTO stitbz_p14_1_urban_sector_allocation VALUES (3, 182, 24, 'Chirang', 24, 1, 22, 2, 2);
INSERT INTO stitbz_p14_1_urban_sector_allocation VALUES (4, 182, 26, 'Guwahati', 26, 1, 22, 2, 2);
INSERT INTO stitbz_p14_1_urban_sector_allocation VALUES (5, 182, 26, 'Guwahati', 26, 2, 1740, 4, 4);
INSERT INTO stitbz_p14_1_urban_sector_allocation VALUES (6, 184, 27, 'Udalguri', 27, 1, 49, 2, 2);
INSERT INTO stitbz_p14_1_urban_sector_allocation VALUES (7, NULL, NULL, 'State Total', NULL, NULL, 7254, 68, 68);;

CREATE TABLE stitbz_p14_2_west_bengal_urban_sector_allocation (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p14_2_west_bengal_urban_sector_allocation VALUES (1, 191, 01, 'Darjiling', 01, 1, 632, 2, 2);
INSERT INTO stitbz_p14_2_west_bengal_urban_sector_allocation VALUES (2, 191, 01, 'Darjiling', 01, 2, 1290, 6, 6);
INSERT INTO stitbz_p14_2_west_bengal_urban_sector_allocation VALUES (3, 191, 02, 'Jalpaiguri', 02, 1, 716, 6, 6);
INSERT INTO stitbz_p14_2_west_bengal_urban_sector_allocation VALUES (4, 191, 02, 'Jalpaiguri', 02, 2, 491, 6, 6);
INSERT INTO stitbz_p14_2_west_bengal_urban_sector_allocation VALUES (5, 191, 03, 'Koch Bihar', 03, 1, 446, 2, 2);
INSERT INTO stitbz_p14_2_west_bengal_urban_sector_allocation VALUES (6, 191, 03, 'Koch Bihar', 03, 2, 179, 2, 2);
INSERT INTO stitbz_p14_2_west_bengal_urban_sector_allocation VALUES (7, 192, 04, 'Uttar Dinajpur', 04, 1, 99, 2, 2);
INSERT INTO stitbz_p14_2_west_bengal_urban_sector_allocation VALUES (8, 192, 04, 'Uttar Dinajpur', 04, 2, 457, 2, 2);
INSERT INTO stitbz_p14_2_west_bengal_urban_sector_allocation VALUES (9, 192, 05, 'Dakshin Dinajpur', 05, 1, 52, 2, 2);
INSERT INTO stitbz_p14_2_west_bengal_urban_sector_allocation VALUES (10, 192, 05, 'Dakshin Dinajpur', 05, 2, 282, 2, 2);
INSERT INTO stitbz_p14_2_west_bengal_urban_sector_allocation VALUES (11, 192, 06, 'Maldah', 06, 1, 475, 2, 2);
INSERT INTO stitbz_p14_2_west_bengal_urban_sector_allocation VALUES (12, 192, 06, 'Maldah', 06, 2, 581, 4, 4);
INSERT INTO stitbz_p14_2_west_bengal_urban_sector_allocation VALUES (13, 192, 07, 'Murshidabad', 07, 1, 1158, 8, 8);
INSERT INTO stitbz_p14_2_west_bengal_urban_sector_allocation VALUES (14, 192, 07, 'Murshidabad', 07, 2, 561, 6, 6);
INSERT INTO stitbz_p14_2_west_bengal_urban_sector_allocation VALUES (15, 192, 08, 'Birbhum', 08, 1, 588, 4, 4);
INSERT INTO stitbz_p14_2_west_bengal_urban_sector_allocation VALUES (16, 192, 08, 'Birbhum', 08, 2, 164, 2, 2);
INSERT INTO stitbz_p14_2_west_bengal_urban_sector_allocation VALUES (17, 194, 09, 'Barddhaman', 09, 1, 1635, 10, 10);
INSERT INTO stitbz_p14_2_west_bengal_urban_sector_allocation VALUES (18, 194, 09, 'Barddhaman', 09, 2, 3371, 22, 22);
INSERT INTO stitbz_p14_2_west_bengal_urban_sector_allocation VALUES (19, 192, 10, 'Nadia', 10, 1, 1234, 8, 8);
INSERT INTO stitbz_p14_2_west_bengal_urban_sector_allocation VALUES (20, 192, 10, 'Nadia', 10, 2, 1298, 8, 8);
INSERT INTO stitbz_p14_2_west_bengal_urban_sector_allocation VALUES (21, 193, 11, 'North 24-Parganas', 11, 1, 1274, 6, 6);
INSERT INTO stitbz_p14_2_west_bengal_urban_sector_allocation VALUES (22, 193, 11, 'North 24-Parganas', 11, 2, 8259, 42, 42);
INSERT INTO stitbz_p14_2_west_bengal_urban_sector_allocation VALUES (23, 194, 12, 'Hugli', 12, 1, 1316, 8, 8);
INSERT INTO stitbz_p14_2_west_bengal_urban_sector_allocation VALUES (24, 194, 12, 'Hugli', 12, 2, 1993, 14, 14);
INSERT INTO stitbz_p14_2_west_bengal_urban_sector_allocation VALUES (25, 195, 13, 'Bankura', 13, 1, 179, 2, 2);
INSERT INTO stitbz_p14_2_west_bengal_urban_sector_allocation VALUES (26, 195, 13, 'Bankura', 13, 2, 390, 2, 2);
INSERT INTO stitbz_p14_2_west_bengal_urban_sector_allocation VALUES (27, 195, 14, 'Puruliya', 14, 1, 493, 2, 2);
INSERT INTO stitbz_p14_2_west_bengal_urban_sector_allocation VALUES (28, 195, 14, 'Puruliya', 14, 2, 287, 2, 2);;

-- SQL for p20.md

CREATE TABLE stitbz_p20_1_table_3_sub_stratum_size_allocation_urban_sector (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p20_1_table_3_sub_stratum_size_allocation_urban_sector VALUES (1, 235, 48, 'Burhampur', 48, 1, 348, 2, 2);
INSERT INTO stitbz_p20_1_table_3_sub_stratum_size_allocation_urban_sector VALUES (2, 233, 49, 'Alirajpur', 49, 1, 72, 2, 2);
INSERT INTO stitbz_p20_1_table_3_sub_stratum_size_allocation_urban_sector VALUES (3, 231, 50, 'Singrauli', 50, 1, 356, 2, 2);
INSERT INTO stitbz_p20_1_table_3_sub_stratum_size_allocation_urban_sector VALUES (4, 236, 04, 'Gwalior', 51, 1, 1637, 8, 8);
INSERT INTO stitbz_p20_1_table_3_sub_stratum_size_allocation_urban_sector VALUES (5, 233, 26, 'Indore', 52, 1, 2891, 10, 10);
INSERT INTO stitbz_p20_1_table_3_sub_stratum_size_allocation_urban_sector VALUES (6, 232, 32, 'Bhopal', 53, 1, 2602, 10, 10);
INSERT INTO stitbz_p20_1_table_3_sub_stratum_size_allocation_urban_sector VALUES (7, 234, 39, 'Jabalpur', 54, 1, 1570, 8, 8);
INSERT INTO stitbz_p20_1_table_3_sub_stratum_size_allocation_urban_sector VALUES (8, NULL, NULL, 'State Total', NULL, NULL, 29883, 192, 192);;

CREATE TABLE stitbz_p20_2_table_3_sub_stratum_size_allocation_urban_sector_g (
    unique_id INTEGER PRIMARY KEY,
    nss_state_region NUMERIC,
    district_code NUMERIC,
    district_name TEXT,
    stratum NUMERIC,
    sub_stratum NUMERIC,
    size_zst NUMERIC,
    central_sample NUMERIC,
    state_sample NUMERIC
);

INSERT INTO stitbz_p20_2_table_3_sub_stratum_size_allocation_urban_sector_g VALUES (1, 244, 01, 'Kachchh', 01, 1, 335, 2, 2);
INSERT INTO stitbz_p20_2_table_3_sub_stratum_size_allocation_urban_sector_g VALUES (2, 244, 01, 'Kachchh', 01, 2, 1166, 4, 4);
INSERT INTO stitbz_p20_2_table_3_sub_stratum_size_allocation_urban_sector_g VALUES (3, 243, 02, 'Bans Kantha', 02, 1, 228, 2, 2);
INSERT INTO stitbz_p20_2_table_3_sub_stratum_size_allocation_urban_sector_g VALUES (4, 243, 02, 'Bans Kantha', 02, 2, 322, 2, 2);
INSERT INTO stitbz_p20_2_table_3_sub_stratum_size_allocation_urban_sector_g VALUES (5, 243, 03, 'Patan', 03, 1, 432, 2, 2);
INSERT INTO stitbz_p20_2_table_3_sub_stratum_size_allocation_urban_sector_g VALUES (6, 242, 04, 'Mahesana', 04, 1, 177, 2, 2);
INSERT INTO stitbz_p20_2_table_3_sub_stratum_size_allocation_urban_sector_g VALUES (7, 242, 04, 'Mahesana', 04, 2, 633, 2, 2);
INSERT INTO stitbz_p20_2_table_3_sub_stratum_size_allocation_urban_sector_g VALUES (8, 242, 05, 'Sabar Kantha', 05, 1, 481, 2, 2);
INSERT INTO stitbz_p20_2_table_3_sub_stratum_size_allocation_urban_sector_g VALUES (9, 242, 06, 'Gandhinagar', 06, 1, 261, 2, 2);
INSERT INTO stitbz_p20_2_table_3_sub_stratum_size_allocation_urban_sector_g VALUES (10, 242, 06, 'Gandhinagar', 06, 2, 439, 2, 2);
INSERT INTO stitbz_p20_2_table_3_sub_stratum_size_allocation_urban_sector_g VALUES (11, 242, 07, 'Ahmedabad', 07, 1, 354, 2, 2);
INSERT INTO stitbz_p20_2_table_3_sub_stratum_size_allocation_urban_sector_g VALUES (12, 242, 07, 'Ahmedabad', 07, 2, 220, 2, 2);
INSERT INTO stitbz_p20_2_table_3_sub_stratum_size_allocation_urban_sector_g VALUES (13, 245, 08, 'Surendranagar', 08, 1, 224, 2, 2);
INSERT INTO stitbz_p20_2_table_3_sub_stratum_size_allocation_urban_sector_g VALUES (14, 245, 08, 'Surendranagar', 08, 2, 597, 2, 2);
INSERT INTO stitbz_p20_2_table_3_sub_stratum_size_allocation_urban_sector_g VALUES (15, 245, 09, 'Rajkot', 09, 1, 397, 2, 2);
INSERT INTO stitbz_p20_2_table_3_sub_stratum_size_allocation_urban_sector_g VALUES (16, 245, 09, 'Rajkot', 09, 2, 1015, 4, 4);
INSERT INTO stitbz_p20_2_table_3_sub_stratum_size_allocation_urban_sector_g VALUES (17, 245, 10, 'Jamnagar', 10, 1, 460, 2, 2);
INSERT INTO stitbz_p20_2_table_3_sub_stratum_size_allocation_urban_sector_g VALUES (18, 245, 10, 'Jamnagar', 10, 2, 646, 4, 4);
INSERT INTO stitbz_p20_2_table_3_sub_stratum_size_allocation_urban_sector_g VALUES (19, 245, 11, 'Porbandar', 11, 1, 464, 2, 2);
INSERT INTO stitbz_p20_2_table_3_sub_stratum_size_allocation_urban_sector_g VALUES (20, 245, 12, 'Junagadh', 12, 1, 365, 2, 2);
INSERT INTO stitbz_p20_2_table_3_sub_stratum_size_allocation_urban_sector_g VALUES (21, 245, 12, 'Junagadh', 12, 2, 937, 4, 4);
INSERT INTO stitbz_p20_2_table_3_sub_stratum_size_allocation_urban_sector_g VALUES (22, 245, 13, 'Amreli', 13, 1, 613, 2, 2);
INSERT INTO stitbz_p20_2_table_3_sub_stratum_size_allocation_urban_sector_g VALUES (23, 245, 14, 'Bhavnagar', 14, 1, 380, 2, 2);
INSERT INTO stitbz_p20_2_table_3_sub_stratum_size_allocation_urban_sector_g VALUES (24, 245, 14, 'Bhavnagar', 14, 2, 1539, 6, 6);
INSERT INTO stitbz_p20_2_table_3_sub_stratum_size_allocation_urban_sector_g VALUES (25, 242, 15, 'Anand', 15, 1, 314, 2, 2);
INSERT INTO stitbz_p20_2_table_3_sub_stratum_size_allocation_urban_sector_g VALUES (26, 242, 15, 'Anand', 15, 2, 514, 2, 2);;

