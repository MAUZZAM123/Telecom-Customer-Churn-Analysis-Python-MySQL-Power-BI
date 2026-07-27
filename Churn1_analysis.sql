-- Churn count by gender.
SELECT
    gender,
    COUNT(customerID) AS total_churns
FROM customer_churn
WHERE Churn = 'Yes'
GROUP BY gender;

-- Churn rate by gender.
SELECT
    gender,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customer_churn
GROUP BY gender;

-- Churn rate by contract type.
SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customer_churn
GROUP BY Contract
ORDER BY churn_rate_percentage DESC;

-- Churn rate by payment method.
SELECT
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customer_churn
GROUP BY PaymentMethod
ORDER BY churn_rate_percentage DESC;

-- Churn rate by internet service.
SELECT
    InternetService,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customer_churn
GROUP BY InternetService
ORDER BY churn_rate_percentage DESC;

-- Churn rate by senior citizen status.
SELECT
    CASE
        WHEN SeniorCitizen = 1 THEN 'Senior Citizen'
        ELSE 'Non-Senior Citizen'
    END AS senior_citizen_status,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customer_churn
GROUP BY SeniorCitizen
ORDER BY churn_rate_percentage DESC;

-- Churn rate by partner status.
SELECT
    Partner,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customer_churn
GROUP BY Partner
ORDER BY churn_rate_percentage DESC;		

-- Churn rate by dependents.
SELECT
    Dependents,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customer_churn
GROUP BY Dependents
ORDER BY churn_rate_percentage DESC;

-- Churn rate by paperless billing.
SELECT
    PaperlessBilling,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customer_churn
GROUP BY PaperlessBilling
ORDER BY churn_rate_percentage DESC;

-- Churn rate by phone service.
SELECT
    PhoneService,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customer_churn
GROUP BY PhoneService
ORDER BY churn_rate_percentage DESC;

-- Churn rate by online security.
SELECT
    OnlineSecurity,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customer_churn
GROUP BY OnlineSecurity
ORDER BY churn_rate_percentage DESC;

-- Churn rate by tech support.
SELECT
    TechSupport,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customer_churn
GROUP BY TechSupport
ORDER BY churn_rate_percentage DESC;

-- Churn rate by streaming TV.
SELECT
    StreamingTV,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customer_churn
GROUP BY StreamingTV
ORDER BY churn_rate_percentage DESC;

-- Churn rate by streaming movies.
SELECT
    StreamingMovies,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customer_churn
GROUP BY StreamingMovies
ORDER BY churn_rate_percentage DESC;

-- Which payment method has the highest churn?
SELECT
    PaymentMethod,
    COUNT(*) AS churned_customers
FROM customer_churn
WHERE Churn = 'Yes'
GROUP BY PaymentMethod
ORDER BY churned_customers DESC
LIMIT 1;

-- What is the overall customer churn rate?
SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS overall_churn_rate_percentage
FROM customer_churn;

-- Which customer characteristics are associated with higher churn?
SELECT
    Contract,
    InternetService,
    PaymentMethod,
    SeniorCitizen,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customer_churn
GROUP BY
    Contract,
    InternetService,
    PaymentMethod,
    SeniorCitizen
ORDER BY churn_rate_percentage DESC;