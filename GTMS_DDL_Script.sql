-- =====================================================
-- GTMS (Gujarat Tourism Management System) DDL Script
-- =====================================================

CREATE schema GTMS;
SET search_path TO GTMS;

-- ====================== DISTRICT ======================
CREATE TABLE DISTRICT (
    district_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    region VARCHAR(100)
);

-- ====================== TOURIST SPOT ======================
CREATE TABLE TOURIST_SPOT (
    spot_id INT PRIMARY KEY,
    spot_name VARCHAR(200) NOT NULL,
    district_id INT,
    category VARCHAR(100),
    address TEXT,
    established_year INT CHECK (established_year > 0),
    entry_fee_local_inr DECIMAL(10,2) CHECK (entry_fee_local_inr >= 0),
    entry_fee_domestic_inr DECIMAL(10,2) CHECK (entry_fee_domestic_inr >= 0),
    entry_fee_foreign_inr DECIMAL(10,2) CHECK (entry_fee_foreign_inr >= 0),
    avg_visit_duration DECIMAL(5,2),
    best_season VARCHAR(50),
    is_unesco_heritage BOOLEAN DEFAULT FALSE,
    rating DECIMAL(3,1) CHECK (rating BETWEEN 0 AND 5),
    total_reviews INT DEFAULT 0,
    image_url VARCHAR(500),

    FOREIGN KEY (district_id)
        REFERENCES DISTRICT(district_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- ====================== TOURIST ======================
CREATE TABLE TOURIST (
    tourist_id INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100),
    last_name VARCHAR(100),
    tourist_type VARCHAR(50) CHECK (tourist_type IN ('LOCAL','DOMESTIC','FOREIGN')),
    gender VARCHAR(20),
    DOB DATE,
    nationality VARCHAR(100),
    phone VARCHAR(20) UNIQUE,
    email VARCHAR(200) UNIQUE,
    id_proof_type VARCHAR(50),
    id_proof_number VARCHAR(100)
);

-- ====================== VISIT ======================
CREATE TABLE VISIT (
    visit_id INT PRIMARY KEY,
    visit_date DATE NOT NULL,
    entry_time TIME,
    exit_time TIME,
    ticket_count INT CHECK (ticket_count >= 0),
    tourist_type VARCHAR(50),
    total_fee_paid FLOAT CHECK (total_fee_paid >= 0),

    tourist_id INT,
    spot_id INT,

    FOREIGN KEY (tourist_id)
        REFERENCES TOURIST(tourist_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,

    FOREIGN KEY (spot_id)
        REFERENCES TOURIST_SPOT(spot_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- ====================== ENTRY TICKET ======================
CREATE TABLE ENTRY_TICKET (
    ticket_id INT PRIMARY KEY,
    visit_id INT,
    tourist_type VARCHAR(50),
    valid_from DATE,
    valid_to DATE,
    price FLOAT CHECK (price >= 0),

    FOREIGN KEY (visit_id)
        REFERENCES VISIT(visit_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ====================== EVENT ======================
CREATE TABLE EVENT (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(200) NOT NULL,
    start_date DATE,
    end_date DATE,
    organizer_name VARCHAR(200),
    fee_local FLOAT,
    fee_domestic FLOAT,
    fee_foreign FLOAT,
    is_annual BOOLEAN DEFAULT FALSE,

    spot_id INT,

    FOREIGN KEY (spot_id)
        REFERENCES TOURIST_SPOT(spot_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- ====================== SPOT FACILITY ======================
CREATE TABLE SPOT_FACILITY (
    spot_id INT,
    facility_name VARCHAR(100),
    is_available BOOLEAN DEFAULT TRUE,

    PRIMARY KEY (spot_id, facility_name),

    FOREIGN KEY (spot_id)
        REFERENCES TOURIST_SPOT(spot_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ====================== SPOT TIMING ======================
CREATE TABLE SPOT_TIMING (
    spot_id INT,
    day_of_week VARCHAR(10),
    open_time TIME,
    close_time TIME,
    is_closed BOOLEAN DEFAULT FALSE,

    PRIMARY KEY (spot_id, day_of_week),

    FOREIGN KEY (spot_id)
        REFERENCES TOURIST_SPOT(spot_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ====================== GUIDE ======================
CREATE TABLE GUIDE (
    guide_id INT PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    contact_no VARCHAR(20),
    is_certified BOOLEAN DEFAULT FALSE,
    license_no VARCHAR(100) UNIQUE,
    years_of_experience INT CHECK (years_of_experience >= 0),
    fees_local FLOAT,
    fees_domestic FLOAT,
    fees_foreign FLOAT
);

-- ====================== GUIDE LANGUAGE ======================
CREATE TABLE GUIDE_LANGUAGE (
    guide_id INT,
    language VARCHAR(50),

    PRIMARY KEY (guide_id, language),

    FOREIGN KEY (guide_id)
        REFERENCES GUIDE(guide_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ====================== GUIDE ASSIGNMENT ======================
CREATE TABLE GUIDE_ASSIGNMENT (
    spot_id INT,
    guide_id INT,
    assigned_date DATE,
    fee_charged FLOAT,

    PRIMARY KEY (spot_id, guide_id, assigned_date),

    FOREIGN KEY (spot_id)
        REFERENCES TOURIST_SPOT(spot_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (guide_id)
        REFERENCES GUIDE(guide_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ====================== FEEDBACK ======================
CREATE TABLE FEEDBACK (
    feedback_id INT PRIMARY KEY,
    visit_id INT,
    feedback_type VARCHAR(50),
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comments TEXT,
    feedback_date DATE,
    complain_against VARCHAR(200),
    status VARCHAR(50),
    resolved_date DATE,

    FOREIGN KEY (visit_id)
        REFERENCES VISIT(visit_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ====================== TOURIST PACKAGE ======================
CREATE TABLE TOURIST_PACKAGE (
    package_id INT PRIMARY KEY,
    package_name VARCHAR(200) NOT NULL,
    operator_name VARCHAR(200),
    package_type VARCHAR(100),
    duration_days INT CHECK (duration_days > 0),
    max_group_size INT CHECK (max_group_size > 0),
    price_local FLOAT,
    price_domestic FLOAT,
    price_foreign FLOAT,
    start_date DATE,
    end_date DATE,
    is_transport_included BOOLEAN,
    is_accommodation_included BOOLEAN,
    is_guide_included BOOLEAN
);

-- ====================== PACKAGE SPOT ======================
CREATE TABLE PACKAGE_SPOT (
    package_id INT,
    spot_id INT,
    day_number INT,
    visit_order_no INT,

    PRIMARY KEY (package_id, spot_id),

    FOREIGN KEY (package_id)
        REFERENCES TOURIST_PACKAGE(package_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (spot_id)
        REFERENCES TOURIST_SPOT(spot_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ====================== PACKAGE BOOKING ======================
CREATE TABLE PACKAGE_BOOKING (
    booking_id INT PRIMARY KEY,
    package_id INT,
    tourist_id INT,
    booking_date DATE,
    tour_start_date DATE,
    group_size INT,
    advance_payment FLOAT,
    booking_status VARCHAR(50),
    amount_to_be_paid FLOAT,
    payment_status VARCHAR(50),

    FOREIGN KEY (package_id)
        REFERENCES TOURIST_PACKAGE(package_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,

    FOREIGN KEY (tourist_id)
        REFERENCES TOURIST(tourist_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- ====================== ACCOMMODATION ======================
CREATE TABLE ACCOMMODATION (
    accommodation_id INT PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    type VARCHAR(100),
    address TEXT,
    contact_no VARCHAR(20),
    total_rooms INT,
    available_rooms INT,
    rating FLOAT CHECK (rating BETWEEN 0 AND 5),
    price_local FLOAT,
    price_domestic FLOAT,
    price_foreign FLOAT,
    website_url TEXT,
    is_govt_approved BOOLEAN,

    district_id INT,

    FOREIGN KEY (district_id)
        REFERENCES DISTRICT(district_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- ====================== ACCOMMODATION ALLOTMENT ======================
CREATE TABLE ACCOMMODATION_ALLOTMENT (
    accommodation_id INT,
    package_id INT,
    check_in_date DATE,
    check_out_date DATE,

    PRIMARY KEY (accommodation_id, package_id),

    FOREIGN KEY (accommodation_id)
        REFERENCES ACCOMMODATION(accommodation_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (package_id)
        REFERENCES TOURIST_PACKAGE(package_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ====================== TRANSPORT ROUTE ======================
CREATE TABLE TRANSPORT_ROUTE (
    route_id INT PRIMARY KEY,
    source_district_id INT,
    destination_district_id INT,
    transport_mode VARCHAR(50),
    distance_km FLOAT CHECK (distance_km > 0),
    avg_duration_hrs FLOAT CHECK (avg_duration_hrs > 0),

    FOREIGN KEY (source_district_id)
        REFERENCES DISTRICT(district_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,

    FOREIGN KEY (destination_district_id)
        REFERENCES DISTRICT(district_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);
