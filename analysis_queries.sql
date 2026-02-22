
-- =====================================================
-- Cab Booking Data Analysis Project
-- Author: Nikhil Joshi
-- Description: SQL queries for cab booking analytics
-- =====================================================

-- 1️⃣ Create Database
CREATE DATABASE IF NOT EXISTS cab_analysis;
USE cab_analysis;

-- 2️⃣ Create Table
CREATE TABLE IF NOT EXISTS cab_data (
Ride_ID INT,
Booking_Date DATE,
Booking_Time TIME,
City VARCHAR(50),
Customer_Type VARCHAR(20),
Distance_km INT,
Fare FLOAT,
Surge_Multiplier FLOAT,
Ride_Status VARCHAR(20),
Payment_Mode VARCHAR(20),
Driver_Rating FLOAT,
Revenue_Status VARCHAR(20),
Day_of_Week VARCHAR(20),
Ride_Hour INT
);

-- =====================================================
-- 📊 BUSINESS ANALYSIS QUERIES
-- =====================================================

-- 3️⃣ Total Revenue (Completed Rides)
SELECT ROUND(SUM(Fare),2) AS Total_Revenue
FROM cab_data
WHERE Ride_Status = 'Completed';

-- 4️⃣ Total Rides
SELECT COUNT(Ride_ID) AS Total_Rides
FROM cab_data;

-- 5️⃣ Revenue by City (Completed Only)
SELECT 
City,
ROUND(SUM(Fare),2) AS Revenue
FROM cab_data
WHERE Ride_Status = 'Completed'
GROUP BY City
ORDER BY Revenue DESC;

-- 6️⃣ Cancellation Percentage
SELECT 
ROUND(
(COUNT(CASE WHEN Ride_Status='Cancelled' THEN 1 END) * 100.0 
/ COUNT(*)),2
) AS Cancellation_Percentage
FROM cab_data;

-- 7️⃣ Peak Ride Hour
SELECT 
Ride_Hour,
COUNT(*) AS Total_Rides
FROM cab_data
GROUP BY Ride_Hour
ORDER BY Total_Rides DESC;

-- 8️⃣ Average Driver Rating by City
SELECT 
City,
ROUND(AVG(Driver_Rating),2) AS Avg_Rating
FROM cab_data
GROUP BY City
ORDER BY Avg_Rating DESC;

-- =====================================================
-- END OF PROJECT QUERIES
-- =====================================================
