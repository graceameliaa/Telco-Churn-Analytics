CREATE VIEW view_ChurnData AS
	SELECT * FROM prod_Churn
		WHERE Customer_Status IN ('Churned', 'Stayed')

CREATE VIEW view_JoinData AS
	SELECT * FROM prod_Churn
		WHERE Customer_Status IN ('Joined')
