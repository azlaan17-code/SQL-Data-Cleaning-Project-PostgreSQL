# SQL_Data_Cleaning_Project

# Customer Data Cleaning – PostgreSQL Project

## Project Overview

**Project Title**: Customer Data Cleaning  
**Level**: Beginner to Intermediate  
**Database**: PostgreSQL  

This project demonstrates practical SQL data cleaning techniques applied to a messy customer dataset containing 2,000+ records.

The dataset included inconsistent string formatting, NULL values, mixed state codes, and timestamp irregularities. The objective was to clean, standardize, and transform the raw dataset into structured, analysis-ready data using SQL.

---

## Objectives

1. Set up the customer database with proper schema structure.  
2. Clean string formatting issues in name fields.  
3. Handle missing values using NULL management techniques.  
4. Standardize categorical fields such as state values.  
5. Convert timestamps into consistent date format.  
6. Prepare cleaned data for reporting and analytics.

---

## Project Structure

### 1. Database Setup

```sql
CREATE TABLE customers
(
    customer_id VARCHAR(50) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    state VARCHAR(50),
    signup_date TIMESTAMP
);
```

---

### 2. Data Cleaning & Standardization

#### 2.1 Remove Unwanted Characters (String Cleaning)

```sql
UPDATE customers
SET first_name = REPLACE(first_name, '''',''),
    last_name  = REPLACE(last_name, '''','');
```

#### 2.2 Create Full Name Column

```sql
ALTER TABLE customers 
ADD COLUMN full_name VARCHAR(50);

UPDATE customers
SET full_name = TRIM(CONCAT(first_name, ' ', last_name));
```

#### 2.3 Handle NULL Values

```sql
UPDATE customers
SET first_name = COALESCE(first_name, 'unknown'),
    last_name  = COALESCE(last_name, 'unknown'),
    email      = COALESCE(email, 'unknown');
```

#### 2.4 Standardize State Values

```sql
UPDATE customers
SET state = INITCAP(TRIM(state));

UPDATE customers
SET state = CASE state
    WHEN 'Ny' THEN 'New York'
    WHEN 'Fl' THEN 'Florida'
    WHEN 'Tx' THEN 'Texas'
    WHEN 'Ca' THEN 'California'
    ELSE state
END;
```

#### 2.5 Convert Timestamp to Date

```sql
UPDATE customers
SET signup_date = signup_date::date;
```

---

## Business Impact

- Improved data consistency across 2,000+ customer records  
- Standardized categorical fields for accurate aggregation and reporting  
- Reduced ambiguity caused by NULL values and inconsistent formatting  
- Prepared structured data for dashboards and analytical workflows  
- Increased reliability of downstream reporting and decision-making  

---

## SQL Concepts Used

- String Functions (REPLACE, TRIM, INITCAP, CONCAT)  
- NULL Handling (COALESCE)  
- Conditional Logic (CASE)  
- Type Casting (::date)  
- Table Modification (ALTER TABLE)  
- Data Transformation (UPDATE)  

---

## Findings

- Significant formatting inconsistencies existed in name and state columns.  
- NULL values required controlled handling to avoid reporting distortion.  
- Timestamp-to-date conversion improved time-based aggregation capability.  
- Standardization enhanced overall data reliability.

---

## Conclusion

This project demonstrates hands-on SQL data cleaning using PostgreSQL. By applying string manipulation, NULL handling, conditional logic, and type casting, raw customer data was transformed into structured, analysis-ready format suitable for reporting and business intelligence use cases.

---

## Author – Mohammed Azlaan

This project is part of my SQL portfolio showcasing practical data cleaning and transformation skills essential for data analyst roles.
