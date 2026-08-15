-- =========================================================
-- TRANSPORT / BUS OPERATIONS SQL DATABASE
-- MYSQL COMPLETE SCRIPT
-- =========================================================

-- 1. DROP DATABASE
DROP DATABASE IF EXISTS Transport_DB;

-- 2. CREATE DATABASE
CREATE DATABASE Transport_DB;

-- 3. USE DATABASE
USE Transport_DB;


-- =========================================================
-- 4. CREATE ROUTES TABLE
-- =========================================================

CREATE TABLE routes (
    route_id INT PRIMARY KEY,
    route_name VARCHAR(50) NOT NULL,
    source VARCHAR(100) NOT NULL,
    destination VARCHAR(100) NOT NULL,
    distance_km DECIMAL(6,2)
);


-- =========================================================
-- 5. CREATE BUSES TABLE
-- =========================================================

CREATE TABLE buses (
    bus_id INT PRIMARY KEY,
    bus_number VARCHAR(20) NOT NULL,
    bus_type VARCHAR(50),
    capacity INT
);


-- =========================================================
-- 6. CREATE DRIVERS TABLE
-- =========================================================

CREATE TABLE drivers (
    driver_id INT PRIMARY KEY,
    driver_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    experience_years INT
);


-- =========================================================
-- 7. CREATE TRIPS TABLE
-- =========================================================

CREATE TABLE trips (
    trip_id INT PRIMARY KEY,
    route_id INT,
    bus_id INT,
    driver_id INT,
    start_time DATETIME,
    end_time DATETIME,

    FOREIGN KEY (route_id)
        REFERENCES routes(route_id),

    FOREIGN KEY (bus_id)
        REFERENCES buses(bus_id),

    FOREIGN KEY (driver_id)
        REFERENCES drivers(driver_id)
);


-- =========================================================
-- 8. CREATE PASSENGERS TABLE
-- =========================================================

CREATE TABLE passengers (
    passenger_id INT PRIMARY KEY,
    trip_id INT,
    passenger_count INT,
    ticket_revenue DECIMAL(10,2),
    boarding_stop VARCHAR(100),
    dropping_stop VARCHAR(100),

    FOREIGN KEY (trip_id)
        REFERENCES trips(trip_id)
);


-- =========================================================
-- 9. CREATE DELAYS TABLE
-- =========================================================

CREATE TABLE delays (
    delay_id INT PRIMARY KEY,
    trip_id INT,
    delay_minutes INT,
    delay_reason VARCHAR(100),

    FOREIGN KEY (trip_id)
        REFERENCES trips(trip_id)
);


-- =========================================================
-- 10. CREATE STOPS TABLE
-- =========================================================

CREATE TABLE stops (
    stop_id INT PRIMARY KEY,
    stop_name VARCHAR(100) NOT NULL,
    city VARCHAR(100)
);


-- =========================================================
-- 11. CREATE STOP_TIMES TABLE
-- =========================================================

CREATE TABLE stop_times (
    trip_id INT,
    stop_id INT,
    arrival_time DATETIME,
    departure_time DATETIME,

    PRIMARY KEY (trip_id, stop_id),

    FOREIGN KEY (trip_id)
        REFERENCES trips(trip_id),

    FOREIGN KEY (stop_id)
        REFERENCES stops(stop_id)
);


-- =========================================================
-- 12. INSERT ROUTES
-- =========================================================

INSERT INTO routes
(route_id, route_name, source, destination, distance_km)
VALUES
(1, 'Route 101', 'Coimbatore', 'Gandhipuram', 8.5),
(2, 'Route 102', 'Coimbatore', 'Ukkadam', 10.2),
(3, 'Route 103', 'Gandhipuram', 'Sulur', 16.8),
(4, 'Route 104', 'Coimbatore', 'Singanallur', 7.4),
(5, 'Route 105', 'Ukkadam', 'RS Puram', 6.9),
(6, 'Route 106', 'Coimbatore', 'Saravanampatti', 14.5),
(7, 'Route 107', 'Gandhipuram', 'Peelamedu', 9.8),
(8, 'Route 108', 'Ukkadam', 'Kuniyamuthur', 11.6),
(9, 'Route 109', 'Coimbatore', 'Kovaipudur', 13.2),
(10, 'Route 110', 'Gandhipuram', 'Vadavalli', 15.7);


-- =========================================================
-- 13. INSERT BUSES
-- =========================================================

INSERT INTO buses
(bus_id, bus_number, bus_type, capacity)
VALUES
(201, 'TN-38-1001', 'AC', 300),
(202, 'TN-38-1002', 'Non-AC', 300),
(203, 'TN-38-1003', 'AC', 350),
(204, 'TN-38-1004', 'Non-AC', 250),
(205, 'TN-38-1005', 'AC', 250),
(206, 'TN-38-1006', 'AC', 350),
(207, 'TN-38-1007', 'Non-AC', 300),
(208, 'TN-38-1008', 'AC', 300),
(209, 'TN-38-1009', 'Non-AC', 250),
(210, 'TN-38-1010', 'AC', 350);


-- =========================================================
-- 14. INSERT DRIVERS
-- =========================================================

INSERT INTO drivers
(driver_id, driver_name, phone, experience_years)
VALUES
(301, 'Arun Kumar', '9000000001', 8),
(302, 'Vijay Kumar', '9000000002', 6),
(303, 'Suresh Babu', '9000000003', 10),
(304, 'Ravi Kumar', '9000000004', 7),
(305, 'Manoj Raj', '9000000005', 5),
(306, 'Karthik S', '9000000006', 9),
(307, 'Prakash M', '9000000007', 11),
(308, 'Dinesh R', '9000000008', 4),
(309, 'Ganesh P', '9000000009', 8),
(310, 'Senthil K', '9000000010', 12);


-- =========================================================
-- 15. INSERT TRIPS
-- =========================================================

INSERT INTO trips
(trip_id, route_id, bus_id, driver_id, start_time, end_time)
VALUES
(1001, 1, 201, 301, '2026-08-01 06:30:00', '2026-08-01 07:10:00'),
(1002, 2, 202, 302, '2026-08-01 07:00:00', '2026-08-01 07:45:00'),
(1003, 3, 203, 303, '2026-08-01 07:30:00', '2026-08-01 08:25:00'),
(1004, 4, 204, 304, '2026-08-01 08:00:00', '2026-08-01 08:40:00'),
(1005, 5, 205, 305, '2026-08-01 08:30:00', '2026-08-01 09:05:00'),
(1006, 6, 206, 306, '2026-08-01 09:00:00', '2026-08-01 09:55:00'),
(1007, 7, 207, 307, '2026-08-01 09:30:00', '2026-08-01 10:15:00'),
(1008, 8, 208, 308, '2026-08-01 10:00:00', '2026-08-01 10:50:00'),
(1009, 9, 209, 309, '2026-08-01 10:30:00', '2026-08-01 11:20:00'),
(1010, 10, 210, 310, '2026-08-01 11:00:00', '2026-08-01 12:00:00'),
(1011, 1, 201, 301, '2026-08-01 12:00:00', '2026-08-01 12:40:00'),
(1012, 2, 202, 302, '2026-08-01 13:00:00', '2026-08-01 13:45:00'),
(1013, 3, 203, 303, '2026-08-01 14:00:00', '2026-08-01 14:55:00'),
(1014, 4, 204, 304, '2026-08-01 15:00:00', '2026-08-01 15:40:00'),
(1015, 5, 205, 305, '2026-08-01 16:00:00', '2026-08-01 16:35:00'),
(1016, 6, 206, 306, '2026-08-01 16:30:00', '2026-08-01 17:25:00'),
(1017, 7, 207, 307, '2026-08-01 17:00:00', '2026-08-01 17:45:00'),
(1018, 8, 208, 308, '2026-08-01 17:30:00', '2026-08-01 18:20:00'),
(1019, 9, 209, 309, '2026-08-01 18:00:00', '2026-08-01 18:50:00'),
(1020, 10, 210, 310, '2026-08-01 18:30:00', '2026-08-01 19:30:00');


-- =========================================================
-- 16. INSERT PASSENGERS
-- =========================================================

INSERT INTO passengers
(passenger_id, trip_id, passenger_count, ticket_revenue, boarding_stop, dropping_stop)
VALUES
(1, 1001, 145, 3625.00, 'Coimbatore', 'Gandhipuram'),
(2, 1002, 180, 4500.00, 'Coimbatore', 'Ukkadam'),
(3, 1003, 220, 6600.00, 'Gandhipuram', 'Sulur'),
(4, 1004, 125, 3125.00, 'Coimbatore', 'Singanallur'),
(5, 1005, 110, 2750.00, 'Ukkadam', 'RS Puram'),
(6, 1006, 205, 6150.00, 'Coimbatore', 'Saravanampatti'),
(7, 1007, 165, 4125.00, 'Gandhipuram', 'Peelamedu'),
(8, 1008, 190, 4750.00, 'Ukkadam', 'Kuniyamuthur'),
(9, 1009, 155, 4650.00, 'Coimbatore', 'Kovaipudur'),
(10, 1010, 240, 7200.00, 'Gandhipuram', 'Vadavalli'),
(11, 1011, 135, 3375.00, 'Coimbatore', 'Gandhipuram'),
(12, 1012, 175, 4375.00, 'Coimbatore', 'Ukkadam'),
(13, 1013, 230, 6900.00, 'Gandhipuram', 'Sulur'),
(14, 1014, 118, 2950.00, 'Coimbatore', 'Singanallur'),
(15, 1015, 105, 2625.00, 'Ukkadam', 'RS Puram'),
(16, 1016, 215, 6450.00, 'Coimbatore', 'Saravanampatti'),
(17, 1017, 170, 4250.00, 'Gandhipuram', 'Peelamedu'),
(18, 1018, 195, 4875.00, 'Ukkadam', 'Kuniyamuthur'),
(19, 1019, 160, 4800.00, 'Coimbatore', 'Kovaipudur'),
(20, 1020, 250, 7500.00, 'Gandhipuram', 'Vadavalli');


-- =========================================================
-- 17. INSERT DELAYS
-- =========================================================

INSERT INTO delays
(delay_id, trip_id, delay_minutes, delay_reason)
VALUES
(1, 1001, 5, 'Traffic'),
(2, 1002, 12, 'Traffic'),
(3, 1003, 25, 'Road Work'),
(4, 1004, 8, 'Traffic'),
(5, 1005, 3, 'Minor Delay'),
(6, 1006, 18, 'Heavy Traffic'),
(7, 1007, 10, 'Passenger Boarding'),
(8, 1008, 22, 'Traffic'),
(9, 1009, 7, 'Minor Delay'),
(10, 1010, 30, 'Road Work'),
(11, 1011, 4, 'Minor Delay'),
(12, 1012, 15, 'Traffic'),
(13, 1013, 28, 'Road Work'),
(14, 1014, 6, 'Traffic'),
(15, 1015, 2, 'Minor Delay'),
(16, 1016, 20, 'Heavy Traffic'),
(17, 1017, 11, 'Passenger Boarding'),
(18, 1018, 24, 'Traffic'),
(19, 1019, 9, 'Minor Delay'),
(20, 1020, 35, 'Road Work');


-- =========================================================
-- 18. INSERT STOPS
-- =========================================================

INSERT INTO stops
(stop_id, stop_name, city)
VALUES
(1, 'Coimbatore', 'Coimbatore'),
(2, 'Gandhipuram', 'Coimbatore'),
(3, 'RS Puram', 'Coimbatore'),
(4, 'Ukkadam', 'Coimbatore'),
(5, 'Kuniyamuthur', 'Coimbatore'),
(6, 'Sulur', 'Coimbatore'),
(7, 'Peelamedu', 'Coimbatore'),
(8, 'Singanallur', 'Coimbatore'),
(9, 'Vadavalli', 'Coimbatore'),
(10, 'Kovaipudur', 'Coimbatore'),
(11, 'Saravanampatti', 'Coimbatore');


-- =========================================================
-- 19. INSERT STOP TIMES
-- =========================================================

INSERT INTO stop_times
(trip_id, stop_id, arrival_time, departure_time)
VALUES
(1001, 1, '2026-08-01 06:30:00', '2026-08-01 06:32:00'),
(1001, 2, '2026-08-01 06:45:00', '2026-08-01 06:47:00'),
(1001, 3, '2026-08-01 07:00:00', '2026-08-01 07:02:00'),

(1002, 1, '2026-08-01 07:00:00', '2026-08-01 07:02:00'),
(1002, 4, '2026-08-01 07:20:00', '2026-08-01 07:22:00'),
(1002, 5, '2026-08-01 07:40:00', '2026-08-01 07:42:00'),

(1003, 2, '2026-08-01 07:30:00', '2026-08-01 07:32:00'),
(1003, 6, '2026-08-01 07:55:00', '2026-08-01 07:57:00'),
(1003, 7, '2026-08-01 08:20:00', '2026-08-01 08:22:00'),

(1004, 1, '2026-08-01 08:00:00', '2026-08-01 08:02:00'),
(1004, 8, '2026-08-01 08:20:00', '2026-08-01 08:22:00'),
(1004, 9, '2026-08-01 08:35:00', '2026-08-01 08:37:00'),

(1005, 4, '2026-08-01 08:30:00', '2026-08-01 08:32:00'),
(1005, 10, '2026-08-01 08:50:00', '2026-08-01 08:52:00'),
(1005, 11, '2026-08-01 09:00:00', '2026-08-01 09:02:00');


SELECT * FROM routes;

-- Query 2
SELECT route_id FROM routes;

-- Query 3
SELECT DISTINCT route_id FROM routes;

-- Query 4
SELECT route_name FROM routes;

-- Query 5
SELECT DISTINCT route_name FROM routes;

-- Query 6
SELECT source FROM routes;

-- Query 7
SELECT DISTINCT source FROM routes;

-- Query 8
SELECT destination FROM routes;

-- Query 9
SELECT DISTINCT destination FROM routes;

-- Query 10
SELECT distance_km FROM routes;

-- Query 11
SELECT DISTINCT distance_km FROM routes;

-- Query 12
SELECT COUNT(*) AS total_rows FROM routes;

-- Query 13
SELECT * FROM trips;

-- Query 14
SELECT trip_id FROM trips;

-- Query 15
SELECT DISTINCT trip_id FROM trips;

-- Query 16
SELECT route_id FROM trips;

-- Query 17
SELECT DISTINCT route_id FROM trips;

-- Query 18
SELECT bus_id FROM trips;

-- Query 19
SELECT DISTINCT bus_id FROM trips;

-- Query 20
SELECT driver_id FROM trips;

-- Query 21
SELECT DISTINCT driver_id FROM trips;

-- Query 22
SELECT start_time FROM trips;

-- Query 23
SELECT DISTINCT start_time FROM trips;

-- Query 24
SELECT end_time FROM trips;

-- Query 25
SELECT DISTINCT end_time FROM trips;

-- Query 26
SELECT COUNT(*) AS total_rows FROM trips;

-- Query 27
SELECT * FROM passengers;

-- Query 28
SELECT passenger_id FROM passengers;

-- Query 29
SELECT DISTINCT passenger_id FROM passengers;

-- Query 30
SELECT trip_id FROM passengers;

-- Query 31
SELECT DISTINCT trip_id FROM passengers;

-- Query 32
SELECT passenger_count FROM passengers;

-- Query 33
SELECT DISTINCT passenger_count FROM passengers;

-- Query 34
SELECT ticket_revenue FROM passengers;

-- Query 35
SELECT DISTINCT ticket_revenue FROM passengers;

-- Query 36
SELECT boarding_stop FROM passengers;

-- Query 37
SELECT DISTINCT boarding_stop FROM passengers;

-- Query 38
SELECT dropping_stop FROM passengers;

-- Query 39
SELECT DISTINCT dropping_stop FROM passengers;

-- Query 40
SELECT COUNT(*) AS total_rows FROM passengers;

-- Query 41
SELECT * FROM delays;

-- Query 42
SELECT delay_id FROM delays;

-- Query 43
SELECT DISTINCT delay_id FROM delays;

-- Query 44
SELECT trip_id FROM delays;

-- Query 45
SELECT DISTINCT trip_id FROM delays;

-- Query 46
SELECT delay_minutes FROM delays;

-- Query 47
SELECT DISTINCT delay_minutes FROM delays;

-- Query 48
SELECT delay_reason FROM delays;

-- Query 49
SELECT DISTINCT delay_reason FROM delays;

-- Query 50
SELECT COUNT(*) AS total_rows FROM delays;

-- Query 51
SELECT * FROM routes WHERE distance_km > 10;

-- Query 52
SELECT COUNT(*) AS matching_rows FROM routes WHERE distance_km > 10;

-- Query 53
SELECT * FROM routes WHERE distance_km < 10;

-- Query 54
SELECT COUNT(*) AS matching_rows FROM routes WHERE distance_km < 10;

-- Query 55
SELECT * FROM routes WHERE distance_km >= 15;

-- Query 56
SELECT COUNT(*) AS matching_rows FROM routes WHERE distance_km >= 15;

-- Query 57
SELECT * FROM routes WHERE distance_km BETWEEN 5 AND 15;

-- Query 58
SELECT COUNT(*) AS matching_rows FROM routes WHERE distance_km BETWEEN 5 AND 15;

-- Query 59
SELECT * FROM trips WHERE bus_id = 101;

-- Query 60
SELECT COUNT(*) AS matching_rows FROM trips WHERE bus_id = 101;

-- Query 61
SELECT * FROM trips WHERE driver_id = 501;

-- Query 62
SELECT COUNT(*) AS matching_rows FROM trips WHERE driver_id = 501;

-- Query 63
SELECT * FROM passengers WHERE passenger_count > 100;

-- Query 64
SELECT COUNT(*) AS matching_rows FROM passengers WHERE passenger_count > 100;

-- Query 65
SELECT * FROM passengers WHERE passenger_count > 200;

-- Query 66
SELECT COUNT(*) AS matching_rows FROM passengers WHERE passenger_count > 200;

-- Query 67
SELECT * FROM passengers WHERE ticket_revenue > 1000;

-- Query 68
SELECT COUNT(*) AS matching_rows FROM passengers WHERE ticket_revenue > 1000;

-- Query 69
SELECT * FROM passengers WHERE ticket_revenue > 5000;

-- Query 70
SELECT COUNT(*) AS matching_rows FROM passengers WHERE ticket_revenue > 5000;

-- Query 71
SELECT * FROM delays WHERE delay_minutes > 10;

-- Query 72
SELECT COUNT(*) AS matching_rows FROM delays WHERE delay_minutes > 10;

-- Query 73
SELECT * FROM delays WHERE delay_minutes > 20;

-- Query 74
SELECT COUNT(*) AS matching_rows FROM delays WHERE delay_minutes > 20;

-- Query 75
SELECT * FROM delays WHERE delay_minutes BETWEEN 5 AND 20;

-- Query 76
SELECT COUNT(*) AS matching_rows FROM delays WHERE delay_minutes BETWEEN 5 AND 20;

-- Query 77
SELECT source, COUNT(*) AS metric FROM routes GROUP BY source;

-- Query 78
SELECT source, COUNT(*) AS metric FROM routes GROUP BY source ORDER BY metric DESC;

-- Query 79
SELECT source, COUNT(*) AS metric FROM routes GROUP BY source ORDER BY metric DESC LIMIT 5;

-- Query 80
SELECT source, COUNT(*) AS metric FROM routes GROUP BY source HAVING COUNT(*) > 10;

-- Query 81
SELECT destination, COUNT(*) AS metric FROM routes GROUP BY destination;

-- Query 82
SELECT destination, COUNT(*) AS metric FROM routes GROUP BY destination ORDER BY metric DESC;

-- Query 83
SELECT destination, COUNT(*) AS metric FROM routes GROUP BY destination ORDER BY metric DESC LIMIT 5;

-- Query 84
SELECT destination, COUNT(*) AS metric FROM routes GROUP BY destination HAVING COUNT(*) > 10;

-- Query 85
SELECT route_id, COUNT(*) AS metric FROM trips GROUP BY route_id;

-- Query 86
SELECT route_id, COUNT(*) AS metric FROM trips GROUP BY route_id ORDER BY metric DESC;

-- Query 87
SELECT route_id, COUNT(*) AS metric FROM trips GROUP BY route_id ORDER BY metric DESC LIMIT 5;

-- Query 88
SELECT route_id, COUNT(*) AS metric FROM trips GROUP BY route_id HAVING COUNT(*) > 10;

-- Query 89
SELECT bus_id, COUNT(*) AS metric FROM trips GROUP BY bus_id;

-- Query 90
SELECT bus_id, COUNT(*) AS metric FROM trips GROUP BY bus_id ORDER BY metric DESC;

-- Query 91
SELECT bus_id, COUNT(*) AS metric FROM trips GROUP BY bus_id ORDER BY metric DESC LIMIT 5;

-- Query 92
SELECT bus_id, COUNT(*) AS metric FROM trips GROUP BY bus_id HAVING COUNT(*) > 10;

-- Query 93
SELECT driver_id, COUNT(*) AS metric FROM trips GROUP BY driver_id;

-- Query 94
SELECT driver_id, COUNT(*) AS metric FROM trips GROUP BY driver_id ORDER BY metric DESC;

-- Query 95
SELECT driver_id, COUNT(*) AS metric FROM trips GROUP BY driver_id ORDER BY metric DESC LIMIT 5;

-- Query 96
SELECT driver_id, COUNT(*) AS metric FROM trips GROUP BY driver_id HAVING COUNT(*) > 10;

-- Query 97
SELECT trip_id, SUM(passenger_count) AS metric FROM passengers GROUP BY trip_id;

-- Query 98
SELECT trip_id, SUM(passenger_count) AS metric FROM passengers GROUP BY trip_id ORDER BY metric DESC;

-- Query 99
SELECT trip_id, SUM(passenger_count) AS metric FROM passengers GROUP BY trip_id ORDER BY metric DESC LIMIT 5;

-- Query 100
SELECT trip_id, SUM(passenger_count) AS metric FROM passengers GROUP BY trip_id HAVING SUM(passenger_count) > 10;

-- Query 101
SELECT boarding_stop, SUM(passenger_count) AS metric FROM passengers GROUP BY boarding_stop;

-- Query 102
SELECT boarding_stop, SUM(passenger_count) AS metric FROM passengers GROUP BY boarding_stop ORDER BY metric DESC;

-- Query 103
SELECT boarding_stop, SUM(passenger_count) AS metric FROM passengers GROUP BY boarding_stop ORDER BY metric DESC LIMIT 5;

-- Query 104
SELECT boarding_stop, SUM(passenger_count) AS metric FROM passengers GROUP BY boarding_stop HAVING SUM(passenger_count) > 10;

-- Query 105
SELECT dropping_stop, SUM(passenger_count) AS metric FROM passengers GROUP BY dropping_stop;

-- Query 106
SELECT dropping_stop, SUM(passenger_count) AS metric FROM passengers GROUP BY dropping_stop ORDER BY metric DESC;

-- Query 107
SELECT dropping_stop, SUM(passenger_count) AS metric FROM passengers GROUP BY dropping_stop ORDER BY metric DESC LIMIT 5;

-- Query 108
SELECT dropping_stop, SUM(passenger_count) AS metric FROM passengers GROUP BY dropping_stop HAVING SUM(passenger_count) > 10;

-- Query 109
SELECT trip_id, SUM(ticket_revenue) AS metric FROM passengers GROUP BY trip_id;

-- Query 110
SELECT trip_id, SUM(ticket_revenue) AS metric FROM passengers GROUP BY trip_id ORDER BY metric DESC;

-- Query 111
SELECT trip_id, SUM(ticket_revenue) AS metric FROM passengers GROUP BY trip_id ORDER BY metric DESC LIMIT 5;

-- Query 112
SELECT trip_id, SUM(ticket_revenue) AS metric FROM passengers GROUP BY trip_id HAVING SUM(ticket_revenue) > 10;

-- Query 113
SELECT trip_id, AVG(delay_minutes) AS metric FROM delays GROUP BY trip_id;

-- Query 114
SELECT trip_id, AVG(delay_minutes) AS metric FROM delays GROUP BY trip_id ORDER BY metric DESC;

-- Query 115
SELECT trip_id, AVG(delay_minutes) AS metric FROM delays GROUP BY trip_id ORDER BY metric DESC LIMIT 5;

-- Query 116
SELECT trip_id, AVG(delay_minutes) AS metric FROM delays GROUP BY trip_id HAVING AVG(delay_minutes) > 10;

-- Query 117
SELECT delay_reason, COUNT(*) AS metric FROM delays GROUP BY delay_reason;

-- Query 118
SELECT delay_reason, COUNT(*) AS metric FROM delays GROUP BY delay_reason ORDER BY metric DESC;

-- Query 119
SELECT delay_reason, COUNT(*) AS metric FROM delays GROUP BY delay_reason ORDER BY metric DESC LIMIT 5;

-- Query 120
SELECT delay_reason, COUNT(*) AS metric FROM delays GROUP BY delay_reason HAVING COUNT(*) > 10;

-- Query 121
SELECT delay_reason, SUM(delay_minutes) AS metric FROM delays GROUP BY delay_reason;

-- Query 122
SELECT delay_reason, SUM(delay_minutes) AS metric FROM delays GROUP BY delay_reason ORDER BY metric DESC;

-- Query 123
SELECT delay_reason, SUM(delay_minutes) AS metric FROM delays GROUP BY delay_reason ORDER BY metric DESC LIMIT 5;

-- Query 124
SELECT delay_reason, SUM(delay_minutes) AS metric FROM delays GROUP BY delay_reason HAVING SUM(delay_minutes) > 10;

-- Query 125
SELECT r.route_name, COUNT(t.trip_id) AS trips
FROM routes r JOIN trips t ON r.route_id=t.route_id
GROUP BY r.route_name ORDER BY trips DESC;

-- Query 126
SELECT r.route_name, SUM(p.passenger_count) AS passengers
FROM routes r JOIN trips t ON r.route_id=t.route_id
JOIN passengers p ON t.trip_id=p.trip_id
GROUP BY r.route_name ORDER BY passengers DESC;

-- Query 127
SELECT r.route_name, SUM(p.ticket_revenue) AS revenue
FROM routes r JOIN trips t ON r.route_id=t.route_id
JOIN passengers p ON t.trip_id=p.trip_id
GROUP BY r.route_name ORDER BY revenue DESC;

-- Query 128
SELECT r.route_name, AVG(d.delay_minutes) AS avg_delay
FROM routes r JOIN trips t ON r.route_id=t.route_id
JOIN delays d ON t.trip_id=d.trip_id
GROUP BY r.route_name ORDER BY avg_delay DESC;

-- Query 129
SELECT r.route_name, COUNT(DISTINCT t.bus_id) AS buses
FROM routes r JOIN trips t ON r.route_id=t.route_id
GROUP BY r.route_name;

-- Query 130
SELECT r.route_name, COUNT(DISTINCT t.driver_id) AS drivers
FROM routes r JOIN trips t ON r.route_id=t.route_id
GROUP BY r.route_name;

-- Query 131
SELECT r.route_name, SUM(p.passenger_count) AS passengers,
SUM(p.ticket_revenue) AS revenue
FROM routes r JOIN trips t ON r.route_id=t.route_id
JOIN passengers p ON t.trip_id=p.trip_id
GROUP BY r.route_name;

-- Query 132
SELECT r.route_name, SUM(p.passenger_count) AS passengers,
AVG(d.delay_minutes) AS avg_delay
FROM routes r JOIN trips t ON r.route_id=t.route_id
JOIN passengers p ON t.trip_id=p.trip_id
LEFT JOIN delays d ON t.trip_id=d.trip_id
GROUP BY r.route_name;

-- Query 133
SELECT r.route_name, SUM(p.ticket_revenue) AS revenue,
AVG(d.delay_minutes) AS avg_delay
FROM routes r JOIN trips t ON r.route_id=t.route_id
JOIN passengers p ON t.trip_id=p.trip_id
LEFT JOIN delays d ON t.trip_id=d.trip_id
GROUP BY r.route_name;

-- Query 134
SELECT r.route_name, COUNT(d.delay_id) AS delay_events
FROM routes r JOIN trips t ON r.route_id=t.route_id
LEFT JOIN delays d ON t.trip_id=d.trip_id
GROUP BY r.route_name ORDER BY delay_events DESC;

-- Query 135
SELECT route_id, trip_id,
ROW_NUMBER() OVER(PARTITION BY route_id ORDER BY start_time) AS trip_number
FROM trips;

-- Query 136
SELECT route_id, trip_id,
RANK() OVER(PARTITION BY route_id ORDER BY start_time) AS trip_rank
FROM trips;

-- Query 137
SELECT trip_id, passenger_count,
RANK() OVER(ORDER BY passenger_count DESC) AS passenger_rank
FROM passengers;

-- Query 138
SELECT trip_id, ticket_revenue,
RANK() OVER(ORDER BY ticket_revenue DESC) AS revenue_rank
FROM passengers;

-- Query 139
SELECT trip_id, delay_minutes,
RANK() OVER(ORDER BY delay_minutes DESC) AS delay_rank
FROM delays;

-- Query 140
SELECT trip_id, passenger_count,
SUM(passenger_count) OVER(ORDER BY trip_id) AS running_passengers
FROM passengers;

-- Query 141
SELECT trip_id, ticket_revenue,
SUM(ticket_revenue) OVER(ORDER BY trip_id) AS running_revenue
FROM passengers;

-- Query 142
SELECT trip_id, delay_minutes,
AVG(delay_minutes) OVER() AS overall_average_delay
FROM delays;

-- Query 143
SELECT route_id, trip_id,
LAG(start_time) OVER(PARTITION BY route_id ORDER BY start_time) AS previous_trip
FROM trips;

-- Query 144
SELECT route_id, trip_id,
LEAD(start_time) OVER(PARTITION BY route_id ORDER BY start_time) AS next_trip
FROM trips;

-- Query 145
SELECT route_id, SUM(passenger_count) AS passengers,
RANK() OVER(ORDER BY SUM(passenger_count) DESC) AS demand_rank
FROM passengers p JOIN trips t ON p.trip_id=t.trip_id
GROUP BY route_id;

-- Query 146
SELECT route_id, SUM(ticket_revenue) AS revenue,
RANK() OVER(ORDER BY SUM(ticket_revenue) DESC) AS revenue_rank
FROM passengers p JOIN trips t ON p.trip_id=t.trip_id
GROUP BY route_id;

-- Query 147
SELECT route_id, AVG(delay_minutes) AS avg_delay,
RANK() OVER(ORDER BY AVG(delay_minutes) DESC) AS delay_rank
FROM delays d JOIN trips t ON d.trip_id=t.trip_id
GROUP BY route_id;

-- Query 148
SELECT * FROM routes WHERE distance_km > (SELECT AVG(distance_km) FROM routes);

-- Query 149
SELECT * FROM routes WHERE distance_km = (SELECT MAX(distance_km) FROM routes);

-- Query 150
SELECT * FROM routes WHERE distance_km = (SELECT MIN(distance_km) FROM routes);

-- Query 151
SELECT * FROM passengers WHERE passenger_count > (SELECT AVG(passenger_count) FROM passengers);

-- Query 152
SELECT * FROM passengers WHERE ticket_revenue > (SELECT AVG(ticket_revenue) FROM passengers);

-- Query 153
SELECT * FROM delays WHERE delay_minutes > (SELECT AVG(delay_minutes) FROM delays);

-- Query 154
WITH route_passengers AS (
SELECT t.route_id, SUM(p.passenger_count) AS passengers
FROM trips t JOIN passengers p ON t.trip_id=p.trip_id
GROUP BY t.route_id)
SELECT * FROM route_passengers ORDER BY passengers DESC;

-- Query 155
WITH route_revenue AS (
SELECT t.route_id, SUM(p.ticket_revenue) AS revenue
FROM trips t JOIN passengers p ON t.trip_id=p.trip_id
GROUP BY t.route_id)
SELECT * FROM route_revenue ORDER BY revenue DESC;

-- Query 156
WITH route_delay AS (
SELECT t.route_id, AVG(d.delay_minutes) AS avg_delay
FROM trips t JOIN delays d ON t.trip_id=d.trip_id
GROUP BY t.route_id)
SELECT * FROM route_delay ORDER BY avg_delay DESC;

-- Query 157
WITH route_stats AS (
SELECT t.route_id, SUM(p.passenger_count) passengers,
SUM(p.ticket_revenue) revenue, AVG(d.delay_minutes) avg_delay
FROM trips t JOIN passengers p ON t.trip_id=p.trip_id
LEFT JOIN delays d ON t.trip_id=d.trip_id
GROUP BY t.route_id)
SELECT *, CASE
WHEN passengers > 50000 AND avg_delay < 15 THEN 'High Performing'
WHEN passengers > 50000 THEN 'High Demand'
WHEN avg_delay < 15 THEN 'Reliable'
ELSE 'Needs Improvement' END AS performance
FROM route_stats;

-- Query 158
SELECT route_id, route_name,
CASE WHEN distance_km > 15 THEN 'Long'
WHEN distance_km > 8 THEN 'Medium' ELSE 'Short' END AS route_type
FROM routes;

-- Query 159
SELECT trip_id, passenger_count,
CASE WHEN passenger_count > 200 THEN 'High'
WHEN passenger_count > 100 THEN 'Medium' ELSE 'Low' END AS load_type
FROM passengers;

-- Query 160
SELECT delay_id, delay_minutes,
CASE WHEN delay_minutes > 20 THEN 'Severe'
WHEN delay_minutes > 10 THEN 'Moderate' ELSE 'Low' END AS delay_type
FROM delays;

-- Query 161
SELECT COUNT(*) AS missing_route_names FROM routes WHERE route_name IS NULL;

-- Query 162
SELECT COUNT(*) AS missing_distances FROM routes WHERE distance_km IS NULL;

-- Query 163
SELECT COUNT(*) AS missing_passengers FROM passengers WHERE passenger_count IS NULL;

-- Query 164
SELECT COUNT(*) AS missing_revenue FROM passengers WHERE ticket_revenue IS NULL;

-- Query 165
SELECT COUNT(*) AS missing_delays FROM delays WHERE delay_minutes IS NULL;

-- Query 166
SELECT route_id, COUNT(*) AS duplicates FROM routes GROUP BY route_id HAVING COUNT(*) > 1;

-- Query 167
SELECT trip_id, COUNT(*) AS duplicates FROM trips GROUP BY trip_id HAVING COUNT(*) > 1;

-- Query 168
SELECT passenger_id, COUNT(*) AS duplicates FROM passengers GROUP BY passenger_id HAVING COUNT(*) > 1;

-- Query 169
SELECT delay_id, COUNT(*) AS duplicates FROM delays GROUP BY delay_id HAVING COUNT(*) > 1;

-- Query 170
SELECT * FROM routes WHERE distance_km < 0;

-- Query 171
SELECT * FROM passengers WHERE passenger_count < 0;

-- Query 172
SELECT * FROM passengers WHERE ticket_revenue < 0;

-- Query 173
SELECT * FROM delays WHERE delay_minutes < 0;

-- Query 174
SELECT * FROM trips WHERE start_time > end_time;

-- Query 175
SELECT r.route_name, SUM(p.passenger_count) AS passengers
FROM routes r JOIN trips t ON r.route_id=t.route_id
JOIN passengers p ON t.trip_id=p.trip_id
GROUP BY r.route_name ORDER BY passengers DESC;

-- Query 176
SELECT r.route_name, SUM(p.passenger_count) AS passengers
FROM routes r JOIN trips t ON r.route_id=t.route_id
JOIN passengers p ON t.trip_id=p.trip_id
GROUP BY r.route_name ORDER BY passengers ASC;

-- Query 177
SELECT r.route_name, SUM(p.ticket_revenue) AS revenue
FROM routes r JOIN trips t ON r.route_id=t.route_id
JOIN passengers p ON t.trip_id=p.trip_id
GROUP BY r.route_name ORDER BY revenue DESC;

-- Query 178
SELECT r.route_name, SUM(p.ticket_revenue) AS revenue
FROM routes r JOIN trips t ON r.route_id=t.route_id
JOIN passengers p ON t.trip_id=p.trip_id
GROUP BY r.route_name ORDER BY revenue ASC;

-- Query 179
SELECT r.route_name, AVG(p.passenger_count) AS avg_passengers
FROM routes r JOIN trips t ON r.route_id=t.route_id
JOIN passengers p ON t.trip_id=p.trip_id
GROUP BY r.route_name ORDER BY avg_passengers DESC;

-- Query 180
SELECT r.route_name, AVG(p.passenger_count) AS avg_passengers
FROM routes r JOIN trips t ON r.route_id=t.route_id
JOIN passengers p ON t.trip_id=p.trip_id
GROUP BY r.route_name ORDER BY avg_passengers ASC;

-- Query 181
SELECT r.route_name, AVG(p.ticket_revenue) AS avg_revenue
FROM routes r JOIN trips t ON r.route_id=t.route_id
JOIN passengers p ON t.trip_id=p.trip_id
GROUP BY r.route_name ORDER BY avg_revenue DESC;

-- Query 182
SELECT r.route_name, AVG(p.ticket_revenue) AS avg_revenue
FROM routes r JOIN trips t ON r.route_id=t.route_id
JOIN passengers p ON t.trip_id=p.trip_id
GROUP BY r.route_name ORDER BY avg_revenue ASC;

-- Query 183
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 2;

-- Query 184
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 3;

-- Query 185
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 4;

-- Query 186
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 5;

-- Query 187
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 6;

-- Query 188
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 7;

-- Query 189
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 8;

-- Query 190
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 9;

-- Query 191
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 10;

-- Query 192
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 1;

-- Query 193
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 2;

-- Query 194
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 3;

-- Query 195
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 4;

-- Query 196
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 5;

-- Query 197
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 6;

-- Query 198
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 7;

-- Query 199
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 8;

-- Query 200
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 9;

-- Query 201
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 10;

-- Query 202
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 1;

-- Query 203
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 2;

-- Query 204
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 3;

-- Query 205
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 4;

-- Query 206
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 5;

-- Query 207
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 6;

-- Query 208
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 7;

-- Query 209
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 8;

-- Query 210
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 9;

-- Query 211
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 10;

-- Query 212
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 1;

-- Query 213
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 2;

-- Query 214
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 3;

-- Query 215
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 4;

-- Query 216
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 5;

-- Query 217
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 6;

-- Query 218
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 7;

-- Query 219
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 8;

-- Query 220
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 9;

-- Query 221
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 10;

-- Query 222
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 1;

-- Query 223
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 2;

-- Query 224
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 3;

-- Query 225
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 4;

-- Query 226
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 5;

-- Query 227
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 6;

-- Query 228
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 7;

-- Query 229
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 8;

-- Query 230
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 9;

-- Query 231
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 10;

-- Query 232
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 1;

-- Query 233
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 2;

-- Query 234
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 3;

-- Query 235
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 4;

-- Query 236
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 5;

-- Query 237
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 6;

-- Query 238
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 7;

-- Query 239
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 8;

-- Query 240
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 9;

-- Query 241
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 10;

-- Query 242
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 1;

-- Query 243
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 2;

-- Query 244
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 3;

-- Query 245
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 4;

-- Query 246
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 5;

-- Query 247
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 6;

-- Query 248
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 7;

-- Query 249
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 8;

-- Query 250
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 9;

-- Query 251
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 10;

-- Query 252
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 1;

-- Query 253
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 2;

-- Query 254
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 3;

-- Query 255
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 4;

-- Query 256
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 5;

-- Query 257
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 6;

-- Query 258
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 7;

-- Query 259
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 8;

-- Query 260
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 9;

-- Query 261
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 10;

-- Query 262
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 1;

-- Query 263
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 2;

-- Query 264
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 3;

-- Query 265
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 4;

-- Query 266
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 5;

-- Query 267
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 6;

-- Query 268
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 7;

-- Query 269
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 8;

-- Query 270
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 9;

-- Query 271
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 10;

-- Query 272
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 1;

-- Query 273
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 2;

-- Query 274
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 3;

-- Query 275
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 4;

-- Query 276
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 5;

-- Query 277
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 6;

-- Query 278
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 7;

-- Query 279
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 8;

-- Query 280
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 9;

-- Query 281
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 10;

-- Query 282
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 1;

-- Query 283
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 2;

-- Query 284
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 3;

-- Query 285
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 4;

-- Query 286
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 5;

-- Query 287
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 6;

-- Query 288
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 7;

-- Query 289
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 8;

-- Query 290
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 9;

-- Query 291
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 10;

-- Query 292
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 1;

-- Query 293
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 2;

-- Query 294
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 3;

-- Query 295
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 4;

-- Query 296
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 5;

-- Query 297
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 6;

-- Query 298
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 7;

-- Query 299
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 8;

-- Query 300
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 9;

-- Query 301
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 10;

-- Query 302
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 1;

-- Query 303
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 2;

-- Query 304
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 3;

-- Query 305
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 4;

-- Query 306
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 5;

-- Query 307
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 6;

-- Query 308
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 7;

-- Query 309
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 8;

-- Query 310
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 9;

-- Query 311
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 10;

-- Query 312
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 1;

-- Query 313
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 2;

-- Query 314
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 3;

-- Query 315
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 4;

-- Query 316
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 5;

-- Query 317
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 6;

-- Query 318
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 7;

-- Query 319
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 8;

-- Query 320
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 9;

-- Query 321
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 10;

-- Query 322
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 1;

-- Query 323
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 2;

-- Query 324
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 3;

-- Query 325
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 4;

-- Query 326
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 5;

-- Query 327
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 6;

-- Query 328
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 7;

-- Query 329
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 8;

-- Query 330
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 9;

-- Query 331
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 10;

-- Query 332
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 1;

-- Query 333
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 2;

-- Query 334
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 3;

-- Query 335
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 4;

-- Query 336
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 5;

-- Query 337
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 6;

-- Query 338
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 7;

-- Query 339
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 8;

-- Query 340
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 9;

-- Query 341
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 10;

-- Query 342
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 1;

-- Query 343
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 2;

-- Query 344
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 3;

-- Query 345
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 4;

-- Query 346
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 5;

-- Query 347
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 6;

-- Query 348
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 7;

-- Query 349
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 8;

-- Query 350
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 9;

-- Query 351
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 10;

-- Query 352
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 1;

-- Query 353
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 2;

-- Query 354
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 3;

-- Query 355
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 4;

-- Query 356
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 5;

-- Query 357
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 6;

-- Query 358
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 7;

-- Query 359
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 8;

-- Query 360
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 9;

-- Query 361
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 10;

-- Query 362
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 1;

-- Query 363
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 2;

-- Query 364
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 3;

-- Query 365
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 4;

-- Query 366
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 5;

-- Query 367
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 6;

-- Query 368
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 7;

-- Query 369
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 8;

-- Query 370
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 9;

-- Query 371
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 10;

-- Query 372
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 1;

-- Query 373
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 2;

-- Query 374
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 3;

-- Query 375
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 4;

-- Query 376
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 5;

-- Query 377
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 6;

-- Query 378
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 7;

-- Query 379
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 8;

-- Query 380
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 9;

-- Query 381
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 10;

-- Query 382
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 1;

-- Query 383
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 2;

-- Query 384
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 3;

-- Query 385
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 4;

-- Query 386
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 5;

-- Query 387
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 6;

-- Query 388
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 7;

-- Query 389
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 8;

-- Query 390
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 9;

-- Query 391
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 10;

-- Query 392
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 1;

-- Query 393
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 2;

-- Query 394
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 3;

-- Query 395
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 4;

-- Query 396
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 5;

-- Query 397
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 6;

-- Query 398
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 7;

-- Query 399
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 8;

-- Query 400
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 9;

-- Query 401
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 10;

-- Query 402
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 1;

-- Query 403
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 2;

-- Query 404
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 3;

-- Query 405
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 4;

-- Query 406
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 5;

-- Query 407
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 6;

-- Query 408
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 7;

-- Query 409
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 8;

-- Query 410
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 9;

-- Query 411
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 10;

-- Query 412
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 1;

-- Query 413
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 2;

-- Query 414
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 3;

-- Query 415
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 4;

-- Query 416
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 5;

-- Query 417
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 6;

-- Query 418
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 7;

-- Query 419
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 8;

-- Query 420
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 9;

-- Query 421
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 10;

-- Query 422
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 1;

-- Query 423
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 2;

-- Query 424
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 3;

-- Query 425
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 4;

-- Query 426
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 5;

-- Query 427
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 6;

-- Query 428
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 7;

-- Query 429
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 8;

-- Query 430
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 9;

-- Query 431
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 10;

-- Query 432
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 1;

-- Query 433
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 2;

-- Query 434
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 3;

-- Query 435
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 4;

-- Query 436
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 5;

-- Query 437
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 6;

-- Query 438
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 7;

-- Query 439
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 8;

-- Query 440
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 9;

-- Query 441
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 10;

-- Query 442
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 1;

-- Query 443
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 2;

-- Query 444
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 3;

-- Query 445
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 4;

-- Query 446
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 5;

-- Query 447
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 6;

-- Query 448
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 7;

-- Query 449
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 8;

-- Query 450
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 9;

-- Query 451
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 10;

-- Query 452
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 1;

-- Query 453
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 2;

-- Query 454
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 3;

-- Query 455
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 4;

-- Query 456
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 5;

-- Query 457
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 6;

-- Query 458
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 7;

-- Query 459
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 8;

-- Query 460
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 9;

-- Query 461
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 10;

-- Query 462
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 1;

-- Query 463
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 2;

-- Query 464
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 3;

-- Query 465
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 4;

-- Query 466
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 5;

-- Query 467
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 6;

-- Query 468
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 7;

-- Query 469
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 8;

-- Query 470
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 9;

-- Query 471
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 10;

-- Query 472
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 1;

-- Query 473
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 2;

-- Query 474
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 3;

-- Query 475
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 4;

-- Query 476
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 5;

-- Query 477
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 6;

-- Query 478
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 7;

-- Query 479
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 8;

-- Query 480
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 9;

-- Query 481
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 10;

-- Query 482
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 1;

-- Query 483
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 2;

-- Query 484
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 3;

-- Query 485
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 4;

-- Query 486
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 5;

-- Query 487
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 6;

-- Query 488
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 7;

-- Query 489
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 8;

-- Query 490
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 9;

-- Query 491
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 10;

-- Query 492
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 1;

-- Query 493
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 2;

-- Query 494
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 3;

-- Query 495
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 4;

-- Query 496
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 5;

-- Query 497
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 6;

-- Query 498
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 7;

-- Query 499
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 8;

-- Query 500
SELECT t.route_id, COUNT(*) AS trip_count
FROM trips t GROUP BY t.route_id
ORDER BY trip_count DESC LIMIT 9;

