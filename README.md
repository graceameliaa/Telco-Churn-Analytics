# Telco Customer Churn Analytics & Prediction
📌 Introduction

This repository contains an end-to-end data science project focused on analyzing and predicting customer churn for a telecommunications company. The project addresses the critical business need to identify customers at high risk of leaving, understand the key drivers behind their decision, and provide actionable insights for retention strategies.

The entire analytics lifecycle is covered, from initial data processing and exploratory analysis to predictive modeling and results visualization.

⚙️ Tech Stack

	• Database & ETL: SQL Server (for data cleaning, transformation, and analysis)
	• Business Intelligence: Power BI (for interactive dashboards and customer analytics)
	• Machine Learning: Python (Pandas, Scikit-learn, imbalanced-learn, Matplotlib, Seaborn)
	• Development Environment: Google Colab or Jupyter Notebook

🏛️ Project Architecture & Workflow
The project follows a structured, multi-stage workflow:

	1. SQL ETL & Data Preparation: The raw data is loaded into a SQL Server database. A series of SQL scripts are used to explore, clean, and transform the data into a production-ready analytical table (production_Churn).
	2. Exploratory Data Analysis (EDA) with Power BI: The cleaned data is connected to Power BI to build a comprehensive "Customer Analytics" dashboard. This dashboard provides a high-level overview of customer demographics, service adoption, and revenue metrics.
	3. Predictive Modeling: The analytical data is loaded into a Python environment. A Random Forest Classifier model is trained to predict customer churn. The process includes handling class imbalance (SMOTE) and hyperparameter tuning (GridSearchCV) to optimize model performance, focusing on recall.
	4. Results Visualization: The model's predictions and feature importance are visualized to provide clear, actionable insights into the key drivers of churn.

📊 Key Insights from Power BI Dashboards

From the Customer Analytics Dashboard:

	• Competitor Pressure is the Main Reason for Leaving: The primary driver for churn is "Competitor", with customers citing reasons like "competitor had better devices" or "competitor made better offer." This is a direct signal to the marketing and strategy teams to re-evaluate pricing, promotions, and product positioning in the market.
	• Age as a Key Demographic Indicator: Analysis of customer demographics reveals a key risk segment: customers aged 50 and above exhibit a significantly higher churn rate, pointing to a need for retention strategies focused on this older demographic.
	• Service Type Matters: Customers using Fiber Optic internet service show a notably higher churn rate. This could point to potential issues with service reliability, pricing perception, or the customer experience for this specific, high-speed product.

From the Churn Prediction Dashboard:

	• Contract Flexibility is the Biggest Churn Risk: Contract Type is the most powerful indicator of churn. Customers on a Month-to-Month contract are drastically more likely to churn. Retention efforts should be laser-focused on converting these customers to longer-term plans, perhaps through targeted promotional offers.
	• Gender as a Predictive Signal: When analyzing churn predictions by demographic, female customers are identified as a higher-risk segment. This insight enables the marketing team to design targeted retention campaigns aimed specifically at improving engagement and satisfaction among women, potentially saving a significant portion of the revenue lost to churn.

🤖 Machine Learning Model Performance

After experimenting with four different modeling approaches, the final model was selected based on its superior ability to identify customers who are truly at risk of churning (optimizing for Recall).

The winning model was: Random Forest with SMOTE (Data Balancing) and Hyperparameter Tuning.

• Final Classification Report:
              precision    recall  f1-score   support

     Churned       0.68      0.68      0.68       347
      Stayed       0.87      0.87      0.87       855

    accuracy                           0.82      1202

• Key Churn Drivers (Feature Importance): The model identified the following factors as the most significant predictors of churn. This tells the business where to focus their retention efforts.

🚀 How to Use This Project

This project is structured into three main components: Database (SQL), Machine Learning (Python), and Visualization (Power BI). Please follow the steps in this order for the best results.

1. Database ETL (SQL)

First, prepare the data using the provided SQL scripts located in the /sql_scripts folder. These scripts will perform the necessary exploration, cleaning, and transformation. Execute them in your SQL
Server environment in the following sequence:

	1. Data_Exploration_Value.sql: Initial exploration of data values.
	2. Data_Exploration_Null_Check.sql: Identifies and handles missing values.
	3. Make_New_Table.sql: Cleans the raw data and creates the final production table, prod_Churn. This table is the primary source for the Power BI dashboard.
	4. View.sql: Creates two specific views (view_ChurnData and view_JoinData) that will be used as the data source for the machine learning model.

2. Machine Learning Model (Python)

Next, run the Jupyter Notebook to train the predictive model and generate predictions on new data.

	1. Open and run the Final_Churn_Prediction.ipynb notebook, located in the /notebooks folder.
	2. Data Source: The notebook connects directly to the SQL database and uses:
		• view_ChurnData for training and testing the model.
		• view_JoinData as the "new" data for generating predictions.
	3. Output: The script will produce a file named Churned_Only_Prediction.csv, which contains a list of customers the model predicts will churn.

3. Visualization (Power BI)

Finally, view the interactive dashboards that combine the cleaned data and the model's predictions.

	1. Open the .pbix file located in the /powerbi_dashboard folder.
	2. Data Source: The dashboard connects to two sources:
	   • The prod_Churn table from your SQL database.
	   • The Churned_Only_Prediction.csv file generated by the machine learning notebook.
	3. Configuration: You may need to update the data source paths in Power BI to point to your local SQL Server instance and the location of your CSV file.
	4. Preview: You can also see static images of the completed dashboards in the /images folder.

🔮 Future Improvements

	• Model Deployment: Deploy the trained model as a REST API using Flask or FastAPI for real-time predictions.
	• Advanced Models: Experiment with gradient boosting models like XGBoost or LightGBM, which often provide a performance lift.
	• Deeper Analysis: Perform a customer lifetime value (CLV) analysis to prioritize retention efforts on high-value customers.

🙏 Acknowledgements

The dataset used for this project is a public dataset sourced from Kaggle. You can find the original dataset [here](https://www.kaggle.com/datasets/nguyenduongthanhthuy/telecom-churn-dataset/data).
