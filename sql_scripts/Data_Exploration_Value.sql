-- Grace
-- DATA EXPLORATION CHECKING VALUE

-- Information for the data of Customer Gender and the percentage of the data (Male, Female)
SELECT
	Gender, COUNT(Gender) AS Total_Count, COUNT(Gender) * 100.0 / (SELECT COUNT(*) FROM stg_Churn) AS Percentage
FROM stg_Churn
GROUP BY Gender

--Information for the data of Customer Contract and the percentage of the data (Month-to-Month, One Year, Two Year)
SELECT	
	Contract, COUNT(Contract) AS Total_Count, COUNT(Contract) * 100.0 / (SELECT COUNT(*) FROM stg_Churn) AS Percentage
FROM stg_Churn
GROUP BY Contract

--Information for the data of Customer Status and the percentage of the data (Joined, Churned, Stayed)
SELECT
	Customer_Status, COUNT(Customer_Status) AS Total_Count, 
	SUM(Total_Revenue) AS Total_Rev, SUM(Total_Revenue) / (SELECT SUM(Total_Revenue) FROM stg_Churn) * 100 AS Rev_Percentage
FROM stg_Churn
GROUP BY Customer_Status

--Information for the data of Customer State and the percentage of the data
SELECT	
	State, COUNT(State) AS Total_Count, COUNT(State) * 100.0 / (SELECT COUNT(*) FROM stg_Churn) AS Percentage
FROM stg_Churn
GROUP BY State
Order by Percentage DESC

SELECT
	DISTINCT Internet_Type
FROM stg_Churn
