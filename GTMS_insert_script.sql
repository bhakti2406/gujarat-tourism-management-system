-- ============================================================
-- GTMS - Gujarat Tourism Management System
-- ============================================================
SET search_path TO GTMS;
-- ===================== DISTRICT =====================
INSERT INTO DISTRICT (district_id, name, region) VALUES
(1, 'Ahmedabad',    'Central Gujarat'),
(2, 'Vadodara',     'Central Gujarat'),
(3, 'Kutch',        'Saurashtra-Kutch'),
(4, 'Somnath',      'Saurashtra-Kutch'),
(5, 'Gandhinagar',  'Central Gujarat'),
(6, 'Rajkot',       'Saurashtra-Kutch'),
(7, 'Patan',        'North Gujarat'),
(8, 'Junagadh',     'Saurashtra-Kutch'),
(9, 'Narmada',      'South Gujarat');

-- ===================== TOURIST SPOT =====================
INSERT INTO TOURIST_SPOT (
    spot_id, spot_name, district_id, category, address,
    established_year, entry_fee_local_inr, entry_fee_domestic_inr, entry_fee_foreign_inr,
    avg_visit_duration, best_season, is_unesco_heritage, rating, total_reviews, image_url
) VALUES
(1,  'Sabarmati Ashram',        1, 'Heritage',    'Ashram Road, Ahmedabad',          1917, 0,    0,    0,    2.0,  'Winter',  FALSE, 4.7, 9800,  https://en.wikipedia.org/wiki/Sabarmati_Ashram),
(2,  'Rann of Kutch',           3, 'Natural',     'White Rann, Bhuj, Kutch',         NULL, 100,  500,  1500, 4.0,  'Winter',  FALSE, 4.8, 15000, https://www.incredibleindia.gov.in/en/gujarat/kutch/rann-of-kutch),
(3,  'Somnath Temple',          4, 'Religious',   'Prabhas Patan, Somnath',          NULL, 0,    0,    0,    1.5,  'All',     FALSE, 4.9, 20000, https://en.wikipedia.org/wiki/Somnath_Temple),
(4,  'Rani ki Vav',             7, 'Heritage',    'Patan, North Gujarat',            1063, 25,   40,   600,  2.5,  'Winter',  TRUE,  4.8, 7500,  https://en.wikipedia.org/wiki/Rani_ki_Vav),
(5,  'Laxmi Vilas Palace',      2, 'Heritage',    'Palace Road, Vadodara',           1890, 200,  300,  500,  3.0,  'Winter',  FALSE, 4.6, 5000,  https://en.wikipedia.org/wiki/Lakshmi_Vilas_Palace,_Vadodara),
(6,  'Gir National Park',       8,'Wildlife',     'Sasan Gir, Junagadh',             1965, 75,   500,  2000, 5.0,  'Winter',  FALSE, 4.7, 11000, https://en.wikipedia.org/wiki/Gir_National_Park),
(7,  'Akshardham Temple',       5, 'Religious',   'Gandhinagar',                     1992, 0,    0,    0,    3.0,  'All',     FALSE, 4.8, 13000, https://en.wikipedia.org/wiki/Swaminarayan_Akshardham_%28Gandhinagar%29),
(8,  'Modhera Sun Temple',      1, 'Heritage',    'Modhera, Mehsana',                1026, 25,   25,   300,  2.0,  'Winter',  FALSE, 4.5, 4000,  https://en.wikipedia.org/wiki/Sun_Temple,_Modhera),
(9,  'Marine National Park',    6, 'Natural',     'Jamnagar Coast, Rajkot',          1980, 50,   200,  800,  4.5,  'Summer',  FALSE, 4.3, 3000,  https://en.wikipedia.org/wiki/Marine_National_Park,_Gulf_of_Kutch),
(10, 'Champaner-Pavagadh',      2, 'Heritage',    'Champaner, Vadodara',             8,    30,   50,   600,  3.5,  'Winter',  TRUE,  4.6, 6000,  https://en.wikipedia.org/wiki/Champaner-Pavagadh_Archaeological_Park),
(11, 'Statue of Unity',         9, 'Heritage',    'Kevadia, Narmada, Gujarat',       2018, 150,  350,  1000, 4.0,  'Winter',  FALSE, 4.9, 25000, https://en.wikipedia.org/wiki/Statue_of_Unity);
-- Statue of Unity: world's tallest statue (182m), opened Oct 31 2018
-- Two UNESCO spots: spot_id 4 and 10 → useful for filtering
-- SOU has highest total_reviews (25000) → useful for MAX aggregate

-- ===================== TOURIST =====================
INSERT INTO TOURIST (
    tourist_id, first_name, middle_name, last_name,
    tourist_type, gender, DOB, nationality, phone, email,
    id_proof_type, id_proof_number
) VALUES
(1,  'Ramesh',   'Kumar',   'Patel',    'LOCAL',    'Male',   '1990-05-12', 'Indian',   '9876543210', 'ramesh@gmail.com',    'Aadhaar', 'AADH-1001'),
(2,  'Priya',    NULL,      'Shah',     'LOCAL',    'Female', '1995-08-22', 'Indian',   '9876543211', 'priya@gmail.com',     'Aadhaar', 'AADH-1002'),
(3,  'Amit',     'Raj',     'Sharma',   'DOMESTIC', 'Male',   '1988-03-15', 'Indian',   '9876543212', 'amit@gmail.com',      'PAN',     'PAN-2001'),
(4,  'Sunita',   NULL,      'Verma',    'DOMESTIC', 'Female', '1992-11-30', 'Indian',   '9876543213', 'sunita@gmail.com',    'Passport','PASS-2002'),
(5,  'John',     NULL,      'Smith',    'FOREIGN',  'Male',   '1985-07-04', 'American', '9876543214', 'john@gmail.com',      'Passport','PASS-3001'),
(6,  'Emma',     NULL,      'Watson',   'FOREIGN',  'Female', '1993-04-15', 'British',  '9876543215', 'emma@gmail.com',      'Passport','PASS-3002'),
(7,  'Kiran',    'Bhai',    'Modi',     'LOCAL',    'Male',   '2000-01-01', 'Indian',   '9876543216', 'kiran@gmail.com',     'Voter ID','VTR-1003'),
(8,  'Liu',      NULL,      'Wei',      'FOREIGN',  'Male',   '1980-09-10', 'Chinese',  '9876543217', 'liu@gmail.com',       'Passport','PASS-3003'),
(9,  'Meera',    NULL,      'Joshi',    'DOMESTIC', 'Female', '1997-06-25', 'Indian',   '9876543218', 'meera@gmail.com',     'Aadhaar', 'AADH-2003'),
(10, 'Carlos',   NULL,      'Ruiz',     'FOREIGN',  'Male',   '1975-12-18', 'Spanish',  '9876543219', 'carlos@gmail.com',    'Passport','PASS-3004'),
(11, 'Deepak',   NULL,      'Nair',     'DOMESTIC', 'Male',   '1991-02-14', 'Indian',   '9876543220', 'deepak@gmail.com',    'PAN',     'PAN-2003');

-- ===================== VISIT =====================
INSERT INTO VISIT (
    visit_id, visit_date, entry_time, exit_time,
    ticket_count, tourist_type, total_fee_paid,
    tourist_id, spot_id
) VALUES
(1,  '2024-01-10', '09:00', '11:00', 2,  'LOCAL',    0,    1,  1),
(2,  '2024-01-12', '10:00', '14:00', 1,  'FOREIGN',  1500, 5,  2),
(3,  '2024-01-15', '08:00', '09:30', 3,  'DOMESTIC', 0,    3,  3),
(4,  '2024-02-05', '10:30', '13:00', 2,  'DOMESTIC', 80,   4,  4),
(5,  '2024-02-10', '11:00', '14:00', 1,  'FOREIGN',  500,  6,  5),
(6,  '2024-02-18', '07:00', '12:00', 4,  'LOCAL',    400,  7,  6),
(7,  '2024-03-01', '09:00', '12:00', 2,  'FOREIGN',  1200, 8,  4),
(8,  '2024-03-10', '13:00', '16:00', 1,  'DOMESTIC', 0,    9,  7),
(9,  '2024-03-22', '08:30', '12:30', 3,  'FOREIGN',  1800, 10, 2),
(10, '2024-04-05', '10:00', '13:30', 2,  'LOCAL',    50,   2,  8),
(11, '2024-04-10', '09:00', '13:00', 1,  'FOREIGN',  800,  6,  9),
(12, '2024-05-01', '10:00', '13:30', 2,  'DOMESTIC', 100,  3,  10),
(13, '2024-05-15', '08:30', '12:30', 2,  'LOCAL',    300,  1,  11),
(14, '2024-06-10', '09:00', '13:00', 3,  'DOMESTIC', 1050, 4,  11),
(15, '2024-07-20', '10:00', '14:00', 1,  'FOREIGN',  1000, 5,  11);

-- ===================== ENTRY TICKET =====================
INSERT INTO ENTRY_TICKET (
    ticket_id, visit_id, tourist_type, valid_from, valid_to, price
) VALUES
(1,  1,  'LOCAL',    '2024-01-10', '2024-01-10', 0),
(2,  2,  'FOREIGN',  '2024-01-12', '2024-01-12', 1500),
(3,  3,  'DOMESTIC', '2024-01-15', '2024-01-15', 0),
(4,  4,  'DOMESTIC', '2024-02-05', '2024-02-05', 40),
(5,  5,  'FOREIGN',  '2024-02-10', '2024-02-10', 500),
(6,  6,  'LOCAL',    '2024-02-18', '2024-02-18', 100),
(7,  7,  'FOREIGN',  '2024-03-01', '2024-03-01', 600),
(8,  8,  'DOMESTIC', '2024-03-10', '2024-03-10', 0),
(9,  9,  'FOREIGN',  '2024-03-22', '2024-03-22', 1500),
(10, 10, 'LOCAL',    '2024-04-05', '2024-04-05', 25),
(11, 11, 'FOREIGN',  '2024-04-10', '2024-04-10', 800),
(12, 12, 'DOMESTIC', '2024-05-01', '2024-05-01', 50),
(13, 13, 'LOCAL',    '2024-05-15', '2024-05-15', 150),
(14, 14, 'DOMESTIC', '2024-06-10', '2024-06-10', 350),
(15, 15, 'FOREIGN',  '2024-07-20', '2024-07-20', 1000);

-- ===================== EVENT =====================
INSERT INTO EVENT (
    event_id, event_name, start_date, end_date,
    organizer_name, fee_local, fee_domestic, fee_foreign,
    is_annual, spot_id
) VALUES
(1, 'Rann Utsav',                         '2024-11-01', '2025-02-28', 'Gujarat Tourism',            500,  1000, 3000, TRUE,  2),
(2, 'Navratri Festival',                   '2024-10-03', '2024-10-12', 'Ahmedabad Municipal',        0,    200,  500,  TRUE,  1),
(3, 'Champaner Heritage Walk',             '2024-01-15', '2024-01-15', 'ASI Gujarat',                50,   100,  500,  FALSE, 10),
(4, 'Gir Wildlife Photo Exhibition',       '2024-02-01', '2024-02-28', 'Wildlife Trust India',       100,  300,  1000, FALSE, 6),
(5, 'Modhera Dance Festival',              '2024-01-19', '2024-01-21', 'Dept. of Culture Gujarat',   200,  400,  1200, TRUE,  8),
(6, 'Marine Bio Awareness Camp',           '2024-06-01', '2024-06-05', 'Forest Dept. Gujarat',       0,    100,  300,  FALSE, 9),
(7, 'Sardar Patel Jayanti Celebration',    '2024-10-31', '2024-10-31', 'Govt. of Gujarat',           0,    0,    0,    TRUE,  11),
(8, 'Unity Marathon',                      '2024-11-15', '2024-11-15', 'Kevadia Dev Authority',      100,  200,  500,  FALSE, 11),
(9, 'Laser & Light Show - Valley of Flowers','2024-12-01','2024-12-31','SSNNL Gujarat',              200,  400,  800,  FALSE, 11);

-- ===================== SPOT FACILITY =====================
-- Facility names: Parking, Restroom, Cafeteria, Internal Transport,
--                 Wheelchair Availability, First Aid
INSERT INTO SPOT_FACILITY (spot_id, facility_name, is_available) VALUES
-- Sabarmati Ashram (1)
(1,  'Parking',                TRUE),
(1,  'Restroom',               TRUE),
(1,  'Cafeteria',              FALSE),
(1,  'Wheelchair Availability',TRUE),

-- Rann of Kutch (2)
(2,  'Parking',                TRUE),
(2,  'Restroom',               TRUE),
(2,  'Cafeteria',              TRUE),
(2,  'Internal Transport',          TRUE),

-- Somnath Temple (3)
(3,  'Parking',                TRUE),
(3,  'Restroom',               TRUE),
(3,  'First Aid',              TRUE),

-- Rani ki Vav (4)
(4,  'Parking',                TRUE),
(4,  'Restroom',               TRUE),
(4,  'First Aid',              TRUE),

-- Laxmi Vilas Palace (5)
(5,  'Parking',                TRUE),
(5,  'Restroom',               TRUE),
(5,  'Cafeteria',              TRUE),
(5,  'Wheelchair Availability',TRUE),

-- Gir National Park (6)
(6,  'Parking',                TRUE),
(6,  'Restroom',               TRUE),
(6,  'Cafeteria',              TRUE),
(6,  'Internal Transport',          TRUE),
(6,  'First Aid',              TRUE),

-- Akshardham Temple (7)
(7,  'Parking',                TRUE),
(7,  'Restroom',               TRUE),
(7,  'Cafeteria',              TRUE),
(7,  'Wheelchair Availability',TRUE),
(7,  'Internal Transport',          FALSE),

-- Modhera Sun Temple (8)
(8,  'Parking',                TRUE),
(8,  'Restroom',               TRUE),
(8,  'First Aid',              TRUE),

-- Marine National Park (9)
(9,  'Parking',                TRUE),
(9,  'Restroom',               TRUE),
(9,  'First Aid',              TRUE),

-- Champaner-Pavagadh (10)
(10, 'Parking',                TRUE),
(10, 'Restroom',               TRUE),
(10, 'First Aid',              TRUE),

-- Statue of Unity (11)
(11, 'Parking',                TRUE),
(11, 'Restroom',               TRUE),
(11, 'Cafeteria',              TRUE),
(11, 'Internal Transport',          TRUE),
(11, 'Wheelchair Availability',TRUE),
(11, 'First Aid',              TRUE);

-- ===================== SPOT TIMING =====================
INSERT INTO SPOT_TIMING (spot_id, day_of_week, open_time, close_time, is_closed) VALUES
(1,  'Monday',    '08:00', '19:00', FALSE),
(1,  'Tuesday',   '08:00', '19:00', FALSE),
(1,  'Wednesday', '08:00', '19:00', FALSE),
(1,  'Sunday',    '08:00', '12:00', FALSE),
(2,  'Monday',    '06:00', '22:00', FALSE),
(2,  'Saturday',  '06:00', '22:00', FALSE),
(2,  'Sunday',    '06:00', '22:00', FALSE),
(3,  'Monday',    '05:00', '21:00', FALSE),
(3,  'Sunday',    '05:00', '21:00', FALSE),
(4,  'Monday',    '08:00', '18:00', FALSE),
(4,  'Friday',    '00:00', '00:00', TRUE),
(5,  'Monday',    '09:30', '17:00', FALSE),
(5,  'Sunday',    '10:00', '15:00', FALSE),
(6,  'Wednesday', '06:00', '18:00', FALSE),
(6,  'Sunday',    '06:00', '18:00', FALSE),
(7,  'Monday',    '09:00', '19:00', FALSE),
(7,  'Sunday',    '09:00', '19:00', FALSE),
(11, 'Monday',    '08:00', '18:00', FALSE),
(11, 'Tuesday',   '08:00', '18:00', FALSE),
(11, 'Wednesday', '08:00', '18:00', FALSE),
(11, 'Thursday',  '08:00', '18:00', FALSE),
(11, 'Friday',    '08:00', '18:00', FALSE),
(11, 'Saturday',  '08:00', '20:00', FALSE),
(11, 'Sunday',    '08:00', '20:00', FALSE);

-- ===================== GUIDE =====================
INSERT INTO GUIDE (
    guide_id, name, contact_no, is_certified, license_no,
    years_of_experience, fees_local, fees_domestic, fees_foreign
) VALUES
(1, 'Harshad Mehta',   '8000100001', TRUE,  'LIC-GUJ-001', 12, 300,  600,  1500),
(2, 'Seema Desai',     '8000100002', TRUE,  'LIC-GUJ-002', 8,  250,  500,  1200),
(3, 'Ravi Trivedi',    '8000100003', FALSE, NULL,           3,  150,  300,  700),
(4, 'Anjali Bhatt',    '8000100004', TRUE,  'LIC-GUJ-003', 15, 400,  800,  2000),
(5, 'Mohan Das',       '8000100005', FALSE, NULL,           1,  100,  200,  500),
(6, 'Zainab Sheikh',   '8000100006', TRUE,  'LIC-GUJ-004', 10, 350,  700,  1800);

-- ===================== GUIDE LANGUAGE =====================
INSERT INTO GUIDE_LANGUAGE (guide_id, language) VALUES
(1, 'Gujarati'),
(1, 'Hindi'),
(1, 'English'),
(2, 'Gujarati'),
(2, 'Hindi'),
(2, 'English'),
(3, 'Gujarati'),
(3, 'Hindi'),
(4, 'Gujarati'),
(4, 'Hindi'),
(4, 'English'),
(4, 'French'),
(5, 'Gujarati'),
(6, 'Gujarati'),
(6, 'Hindi'),
(6, 'English'),
(6, 'French'),
(6, 'Mandarin');

-- ===================== GUIDE ASSIGNMENT =====================
INSERT INTO GUIDE_ASSIGNMENT (spot_id, guide_id, assigned_date, fee_charged) VALUES
(1,  1, '2024-01-10', 600),
(2,  4, '2024-01-12', 2000),
(4,  2, '2024-02-05', 500),
(6,  1, '2024-02-18', 1500),
(6,  4, '2024-03-15', 2000),
(4,  6, '2024-03-01', 1800),
(9,  3, '2024-04-10', 300),
(10, 2, '2024-05-01', 500),
(5,  4, '2024-02-10', 800),
(7,  6, '2024-03-10', 1800),
(11, 1, '2024-05-15', 600),
(11, 4, '2024-06-10', 800),
(11, 6, '2024-07-20', 1800);

-- ===================== FEEDBACK =====================
INSERT INTO FEEDBACK (
    feedback_id, visit_id, feedback_type, rating,
    comments, feedback_date, complain_against, status, resolved_date
) VALUES
(1,  1,  'General',    5, 'Wonderful place, must visit.',           '2024-01-10', NULL,          'Closed',   '2024-01-11'),
(2,  2,  'Complaint',  3, 'Facilities could be improved.',          '2024-01-12', 'Staff',       'Resolved', '2024-01-20'),
(3,  3,  'General',    5, 'Spiritually enriching.',                 '2024-01-15', NULL,          'Closed',   '2024-01-16'),
(4,  4,  'Complaint',  2, 'Guides were not punctual.',              '2024-02-06', 'Guide',       'Resolved', '2024-02-15'),
(5,  5,  'General',    4, 'Beautiful palace, great history.',       '2024-02-10', NULL,          'Closed',   '2024-02-11'),
(6,  6,  'Complaint',  1, 'Overcrowded, poor sanitation.',          '2024-02-18', 'Management',  'Open',     NULL),
(7,  7,  'Suggestion', 4, 'Add more multilingual guides.',          '2024-03-01', NULL,          'Open',     NULL),
(8,  8,  'General',    5, 'Divine experience.',                     '2024-03-10', NULL,          'Closed',   '2024-03-11'),
(9,  9,  'General',    5, 'Rann is magical at night!',              '2024-03-22', NULL,          'Closed',   '2024-03-23'),
(10, 10, 'Complaint',  3, 'Parking lot was messy.',                 '2024-04-05', 'Contractor',  'Resolved', '2024-04-12'),
(11, 11, 'General',    4, 'Marine life is stunning.',               '2024-04-10', NULL,          'Closed',   '2024-04-11'),
(12, 12, 'General',    5, 'UNESCO site - truly majestic.',          '2024-05-01', NULL,          'Closed',   '2024-05-02'),
(13, 13, 'General',    5, 'Statue is breathtaking in person!',      '2024-05-15', NULL,          'Closed',   '2024-05-16'),
(14, 14, 'Complaint',  3, 'Bus transport queue was very long.',     '2024-06-10', 'Management',  'Resolved', '2024-06-20'),
(15, 15, 'General',    5, 'One of the best tourist spots ever!',    '2024-07-20', NULL,          'Closed',   '2024-07-21');

-- ===================== TOURIST PACKAGE =====================
INSERT INTO TOURIST_PACKAGE (
    package_id, package_name, operator_name, package_type,
    duration_days, max_group_size,
    price_local, price_domestic, price_foreign,
    start_date, end_date,
    is_transport_included, is_accommodation_included, is_guide_included
) VALUES
(1, 'Gujarat Heritage Circuit',  'Explore Gujarat Pvt Ltd',  'Heritage',  5, 20, 4000,  8000,  20000, '2024-01-01', '2024-03-31', TRUE,  TRUE,  TRUE),
(2, 'Rann Adventure Package',    'Kutch Tourism Co',          'Nature',    3, 15, 2500,  5000,  12000, '2024-11-01', '2025-02-28', TRUE,  TRUE,  FALSE),
(3, 'Spiritual Gujarat Tour',    'Divyayatra Tours',          'Religious', 4, 30, 1500,  3000,  8000,  '2024-01-01', '2024-12-31', TRUE,  TRUE, FALSE),
(4, 'Wildlife & Nature Escape',  'Nature Trails India',       'Wildlife',  4, 10, 3000,  7000,  18000, '2024-10-01', '2025-03-31', TRUE,  TRUE,  TRUE),
(5, 'Royal Vadodara Weekend',    'Royal Gujarat Holidays',    'Heritage',  2, 25, 1800,  4000,  9000,  '2024-01-01', '2024-12-31', FALSE, FALSE, FALSE),
(6, 'Statue & Narmada Explorer', 'Unity Tours Pvt Ltd',       'Heritage',  3, 20, 2000,  5000,  13000, '2024-05-01', '2024-12-31', TRUE,  TRUE,  TRUE);

-- ===================== PACKAGE SPOT =====================
INSERT INTO PACKAGE_SPOT (package_id, spot_id, day_number, visit_order_no) VALUES
(1, 1,  1, 1),   -- Heritage Circuit → Ashram
(1, 8,  2, 1),   -- Heritage Circuit → Modhera Sun Temple
(1, 4,  3, 1),   -- Heritage Circuit → Rani ki Vav
(1, 10, 4, 1),   -- Heritage Circuit → Champaner
(1, 5,  5, 1),   -- Heritage Circuit → Laxmi Vilas
(2, 2,  1, 1),   -- Rann Adventure → Rann of Kutch
(2, 9,  3, 2),   -- Rann Adventure → Marine National Park
(3, 3,  1, 1),   -- Spiritual Tour → Somnath
(3, 7,  3, 2),   -- Spiritual Tour → Akshardham
(4, 6,  1, 1),   -- Wildlife → Gir
(4, 9,  3, 2),   -- Wildlife → Marine Park (shared with package 2)
(5, 5,  1, 1),   -- Vadodara → Laxmi Vilas
(5, 10, 2, 2),   -- Vadodara → Champaner
(6, 11, 1, 1),   -- SOU Package → Statue of Unity (Day 1)
(6, 7,  2, 1),   -- SOU Package → Akshardham (Day 2) — spot shared with package 3
(6, 1,  3, 1);   -- SOU Package → Sabarmati Ashram (Day 3) — spot shared with package 1

-- ===================== PACKAGE BOOKING =====================
INSERT INTO PACKAGE_BOOKING (
    booking_id, package_id, tourist_id,
    booking_date, tour_start_date, group_size,
    advance_payment, booking_status, amount_to_be_paid, payment_status
) VALUES
(1,  1, 3,  '2023-12-01', '2024-01-10', 2,  4000,  'Confirmed',  16000, 'Partial'),
(2,  2, 5,  '2024-10-15', '2024-11-05', 1,  6000,  'Confirmed',  12000, 'Partial'),
(3,  3, 4,  '2023-12-20', '2024-01-15', 4,  6000,  'Confirmed',  12000, 'Paid'),
(4,  4, 8,  '2024-09-01', '2024-10-10', 2,  9000,  'Confirmed',  36000, 'Partial'),
(5,  1, 6,  '2023-12-10', '2024-02-01', 3,  6000,  'Confirmed',  24000, 'Paid'),
(6,  5, 9,  '2024-03-01', '2024-04-01', 5,  5000,  'Cancelled',  20000, 'Refunded'),
(7,  2, 10, '2024-10-20', '2024-12-01', 1,  6000,  'Confirmed',  12000, 'Paid'),
(8,  3, 1,  '2024-01-05', '2024-02-20', 1,  1500,  'Confirmed',  3000,  'Paid'),
(9,  4, 2,  '2024-09-15', '2024-11-01', 2,  2000,  'Waitlisted', 14000, 'Pending'),
(10, 5, 7,  '2024-03-10', '2024-04-15', 3,  2700,  'Confirmed',  5400,  'Partial'),
(11, 6, 5,  '2024-04-20', '2024-05-15', 1,  6500,  'Confirmed',  13000, 'Partial'),
(12, 6, 8,  '2024-05-01', '2024-06-10', 2,  13000, 'Confirmed',  26000, 'Paid');

-- ===================== ACCOMMODATION =====================
INSERT INTO ACCOMMODATION (
    accommodation_id, name, type, address, contact_no,
    total_rooms, available_rooms, rating,
    price_local, price_domestic, price_foreign,
    website_url, is_govt_approved, district_id
) VALUES
(1, 'Taj Vivanta Ahmedabad',    'Hotel',       '132 Ft Ring Rd, Ahmedabad',     '07921234567', 120, 30, 4.5, 3000, 5000, 10000, 'https://vivanta.tajhotels.com',  TRUE,  1),
(2, 'The Gateway Vadodara',     'Hotel',       'Akota, Vadodara',               '02652345678', 80,  15, 4.3, 2500, 4500, 9000,  'https://gateway.tajhotels.com',  TRUE,  2),
(3, 'Rann Riders Resort',       'Resort',      'White Rann, Bhuj',              '02832500100', 40,  5,  4.6, 4000, 6000, 14000, NULL,                             TRUE,  3),
(4, 'Somnath Guest House',      'Guest House', 'Near Temple, Somnath',          '02876543210', 20,  10, 3.8, 800,  1500, 4000,  NULL,                             FALSE, 4),
(5, 'Gir Jungle Lodge',         'Resort',      'Sasan Gir',                     '02877654321', 30,  8,  4.4, 3500, 6000, 13000, NULL,                             TRUE,  8),
(6, 'Gandhinagar Tulip Inn',    'Hotel',       'Sector 11, Gandhinagar',        '07923456789', 60,  20, 4.0, 1500, 2500, 6000,  'https://tulipinn.com',           TRUE,  5),
(7, 'Kevadia Jungle Resort',    'Resort',      'Kevadia Colony, Narmada',       '02640300200', 50,  12, 4.7, 3500, 7000, 15000, NULL,                             TRUE,  9);

-- ===================== ACCOMMODATION ALLOTMENT =====================
INSERT INTO ACCOMMODATION_ALLOTMENT (
    accommodation_id, package_id, check_in_date, check_out_date
) VALUES
(1, 1, '2024-01-10', '2024-01-15'),
(3, 2, '2024-11-05', '2024-11-08'),
(5, 4, '2024-10-10', '2024-10-14'),
(2, 5, '2024-04-15', '2024-04-17'),
(6, 1, '2024-02-01', '2024-02-06'),
(4, 3, '2024-01-15', '2024-01-19'),
(7, 6, '2024-05-15', '2024-05-18');

-- ===================== TRANSPORT ROUTE =====================
INSERT INTO TRANSPORT_ROUTE (
    route_id, source_district_id, destination_district_id,
    transport_mode, distance_km, avg_duration_hrs
) VALUES
(1,  1, 5, 'Road',  30.0,  0.5),    -- Ahmedabad → Gandhinagar
(2,  1, 7, 'Road',  120.0, 2.5),    -- Ahmedabad → Patan
(3,  1, 2, 'Road',  110.0, 2.0),    -- Ahmedabad → Vadodara
(4,  1, 2, 'Rail',  110.0, 1.5),    -- Ahmedabad → Vadodara (train)
(5,  3, 4, 'Road',  320.0, 5.5),    -- Kutch → Somnath
(6,  2, 4, 'Road',  290.0, 5.0),    -- Vadodara → Somnath
(7,  4, 8, 'Road',  90.0,  2.0),    -- Somnath → Junagadh
(8,  8, 6, 'Road',  100.0, 2.5),    -- Junagadh → Rajkot
(9,  1, 3, 'Air',   400.0, 1.0),    -- Ahmedabad → Kutch (flight)
(10, 6, 3, 'Road',  290.0, 5.0),    -- Rajkot → Kutch
(11, 1, 3, 'Road',  400.0, 7.0),    -- Ahmedabad → Kutch (road)
(12, 5, 7, 'Road',  100.0, 2.0),    -- Gandhinagar → Patan
(13, 1, 9, 'Road',  200.0, 3.5),    -- Ahmedabad → Narmada (SOU road)
(14, 2, 9, 'Road',  90.0,  1.5),    -- Vadodara → Narmada (nearest city to SOU by road)
(15, 2, 9, 'Rail',  85.0,  1.0),    -- Vadodara → Narmada (train — Vadodara is nearest railhead)
(16, 9, 5, 'Road',  185.0, 3.0);    -- Narmada → Gandhinagar (return route)