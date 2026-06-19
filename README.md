# Amazon Fashion Sales Analysis

This project focuses on analyzing Amazon Fashion Sales data using SQL Server. The dataset contains approximately 80,000 orders from different fashion categories across multiple Indian states.

The main objective of this project was to practice SQL on a real-world business dataset and generate useful insights related to sales performance, profitability, customer behavior, cancellations, returns, and delivery performance.

## Dataset Summary

- Total Orders: 79,999
- Total Revenue: ₹48.44 Million
- Total Profit: ₹7.23 Million
- Profit Margin: 14.93%
- Cancellation Rate: 14.25%
- Return Rate: 1.89%
- Average Delivery Time: 3.57 Days

The dataset includes information such as:

- Order ID
- Product Category
- Order Amount
- Order Status
- State
- Date
- Delivery Information

## Data Preparation

Before starting the analysis, the dataset was cleaned and transformed in SQL Server.

Tasks performed:

- Imported CSV data into SQL Server
- Checked for NULL values
- Converted amount column into numeric format
- Created Profit column
- Created Delivery_Days column
- Created Delay_Flag column
- Generated additional business metrics for analysis

## Analysis Performed

### Sales Analysis

- Total Orders
- Total Revenue
- Revenue by Category
- Revenue by State
- Revenue Contribution Percentage

### Profit Analysis

- Total Profit
- Profit Margin
- Category-wise Profit
- State-wise Profit Ranking

### Order Analysis

- Cancellation Rate
- Return Rate
- Order Status Distribution
- Delivery Performance Analysis

### Customer Analysis

- Customer Segmentation
- Premium vs Regular vs Budget Customers

## SQL Concepts Used

The project includes both basic and advanced SQL concepts:

- Aggregate Functions
- CASE WHEN
- GROUP BY
- ORDER BY
- Common Table Expressions (CTEs)
- Window Functions
- ROW_NUMBER()
- DENSE_RANK()
- NTILE()
- LAG()
- Running Totals
- Ranking Functions
- Percentage Calculations

## Key Findings

### Category Insights

- T-shirt category generated the highest revenue.
- T-shirt category contributed more than 50% of total revenue.
- Shirt category was the second highest revenue contributor.

### State Insights

Top Revenue Generating States:

1. Maharashtra
2. Karnataka
3. Uttar Pradesh
4. Telangana
5. Tamil Nadu

Maharashtra generated the highest revenue and profit among all states.

### Order Insights

- Cancellation Rate was approximately 14%.
- Return Rate was below 2%.
- Most orders were delivered within 4 days.
- Delayed orders accounted for a relatively small portion of total orders.

## Advanced SQL Analysis

The project also includes advanced SQL queries such as:

- Top 5 Highest Revenue Orders per State using ROW_NUMBER()
- State Profit Ranking using DENSE_RANK()
- Revenue Quartile Analysis using NTILE()
- Running Revenue Calculation using Window Functions
- Month-over-Month Growth Analysis using LAG()

## Tools Used

- SQL Server
- SQL Server Management Studio (SSMS)
- GitHub

## Project Files

- Amazon_Sales_Analytics.sql → Complete SQL queries used in the analysis
- README.md → Project documentation

## Conclusion

This project helped me strengthen my SQL skills by working on a large real-world dataset and solving business-related analytical problems. It provided hands-on experience with data cleaning, KPI generation, business analysis, and advanced SQL concepts such as Window Functions, CTEs, Ranking Functions, and Running Totals.
