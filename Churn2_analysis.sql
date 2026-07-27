CREATE DATABASE CHURN_ANALYSIS;

USE CHURN_ANALYSIS;

CREATE TABLE customer_churn (
    customerID VARCHAR(20) PRIMARY KEY,
    gender VARCHAR(10),
    SeniorCitizen TINYINT,
    Partner VARCHAR(3),
    Dependents VARCHAR(3),
    tenure INT,
    PhoneService VARCHAR(3),
    MultipleLines VARCHAR(20),
    InternetService VARCHAR(20),
    OnlineSecurity VARCHAR(20),
    OnlineBackup VARCHAR(20),
    DeviceProtection VARCHAR(20),
    TechSupport VARCHAR(20),
    StreamingTV VARCHAR(20),
    StreamingMovies VARCHAR(20),
    Contract VARCHAR(20),
    PaperlessBilling VARCHAR(3),
    PaymentMethod VARCHAR(50),
    MonthlyCharges DECIMAL(10,2),
    TotalCharges VARCHAR(20),
    Churn VARCHAR(3)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/archive (17)/WA_Fn-UseC_-Telco-Customer-Churn.csv'
INTO TABLE customer_churn
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select *  from customer_churn;

-- FOR NULL CHECKING 
SELECT customerID, COUNT(*)
FROM customer_churn
GROUP BY customerID
HAVING COUNT(*) > 1;

SELECT *
FROM customer_churn
WHERE customerID IS NULL
   OR gender IS NULL
   OR SeniorCitizen IS NULL;


