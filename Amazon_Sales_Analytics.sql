-- Total Orders
SELECT COUNT(*) AS Total_Orders
FROM Amazon_Sales;

-- Total Revenue
SELECT
SUM(TRY_CAST(Amount AS FLOAT)) AS Revenue
FROM Amazon_Sales;

-- Total Profit
SELECT
SUM(Profit) AS Profit
FROM Amazon_Sales;

-- Revenue & Porfit
SELECT
SUM(TRY_CAST(Amount AS FLOAT)) AS Revenue,
SUM(Profit) AS Profit
FROM Amazon_Sales;

-- Profit Margin
SELECT
ROUND(
SUM(Profit)*100.0/
SUM(TRY_CAST(Amount AS FLOAT))
,2) AS Profit_Margin
FROM Amazon_Sales;

-- Status Wise Orders
SELECT
Status,
COUNT(*) AS Total_Orders
FROM Amazon_Sales
GROUP BY Status
ORDER BY Total_Orders DESC;

-- Category Wise Orders
SELECT
Category,
COUNT(*) AS Total_Orders
FROM Amazon_Sales
GROUP BY Category
ORDER BY Total_Orders DESC;


-- Category Wise Revenue
SELECT
Category,
ROUND(SUM(TRY_CAST(Amount AS FLOAT)),2) AS Revenue
FROM Amazon_Sales
GROUP BY Category
ORDER BY Revenue DESC;

-- Category Wise Profit
SELECT
Category,
ROUND(SUM(TRY_CAST(Amount AS FLOAT)),2) AS Revenue
FROM Amazon_Sales
GROUP BY Category
ORDER BY Revenue DESC;

-- Revenue Vs Profit By Category
SELECT
Category,
ROUND(SUM(TRY_CAST(Amount AS FLOAT)),2) AS Revenue,
ROUND(SUM(Profit),2) AS Profit
FROM Amazon_Sales
GROUP BY Category
ORDER BY Revenue DESC;

-- State Wise Revenue
SELECT TOP 10
ship_state,
SUM(TRY_CAST(Amount AS FLOAT)) AS Revenue
FROM Amazon_Sales
GROUP BY ship_state
ORDER BY Revenue DESC;

-- State wise profit ranking

WITH StateProfit AS
(
SELECT
ship_state,
SUM(Profit) AS Profit
FROM Amazon_Sales
WHERE ship_state IS NOT NULL
GROUP BY ship_state
)

SELECT
ship_state,
Profit,
DENSE_RANK() OVER
(
ORDER BY Profit DESC
) AS Profit_Rank
FROM StateProfit;

-- Cancellation Rate
SELECT
ROUND(
COUNT(CASE WHEN Status='Cancelled' THEN 1 END)
*100.0/COUNT(*)
,2) AS Cancellation_Rate
FROM Amazon_Sales;


-- Return Rate

SELECT
ROUND(COUNT(CASE
WHEN Status LIKE '%Returned%' THEN 1
END)*100.0/COUNT(*),2) AS Return_Rate
FROM Amazon_Sales;


-- Average delivery days
SELECT
ROUND(AVG(Delivery_Days),2) AS Avg_Delivery_Days
FROM Amazon_Sales
WHERE Delivery_Days IS NOT NULL;

-- Delay Analysis
SELECT Delay_Flag,
COUNT(*) AS Orders_Count
FROM Amazon_Sales
GROUP BY Delay_Flag;

-- Top 5 Orders Per State
WITH CTE AS
(
SELECT
ship_state,
Order_ID,
TRY_CAST(Amount AS FLOAT) AS Revenue,
ROW_NUMBER() OVER
(
PARTITION BY ship_state
ORDER BY TRY_CAST(Amount AS FLOAT) DESC
) rn
FROM Amazon_Sales
WHERE ship_state IS NOT NULL
)
SELECT *
FROM CTE
WHERE rn <= 5;


-- Revnue Quartile (NTILE)
WITH RevenueState AS
(
SELECT
ship_state,
SUM(TRY_CAST(Amount AS FLOAT)) AS Revenue
FROM Amazon_Sales
WHERE ship_state IS NOT NULL
GROUP BY ship_state
)
SELECT
ship_state,
Revenue,
NTILE(4) OVER
(
ORDER BY Revenue DESC
) AS Revenue_Quartile
FROM RevenueState;


-- Customer Segmentation

SELECT
Category,
CASE
WHEN TRY_CAST(Amount AS FLOAT) >= 1000
THEN 'Premium'
WHEN TRY_CAST(Amount AS FLOAT) >= 500
THEN 'Regular'
ELSE 'Budget'
END AS Customer_Type,
COUNT(*) AS Orders_Count
FROM Amazon_Sales
GROUP BY
Category,
CASE
WHEN TRY_CAST(Amount AS FLOAT) >= 1000
THEN 'Premium'
WHEN TRY_CAST(Amount AS FLOAT) >= 500
THEN 'Regular'
ELSE 'Budget'
END;



-- Revenue Contribution
SELECT
Category,
ROUND(
SUM(TRY_CAST(Amount AS FLOAT))
*100.0/
(
SELECT SUM(TRY_CAST(Amount AS FLOAT))
FROM Amazon_Sales
)
,2
) AS Revenue_Percent
FROM Amazon_Sales
GROUP BY Category
ORDER BY Revenue_Percent DESC;


-- Running Revenue
WITH DailyRevenue AS
(
SELECT
Date,
SUM(TRY_CAST(Amount AS FLOAT)) AS Revenue
FROM Amazon_Sales
GROUP BY Date
)
SELECT
Date,
Revenue,
SUM(Revenue) OVER
(
ORDER BY Date
) AS Running_Revenue
FROM DailyRevenue;


-- Profit Statistics
SELECT
MIN(Profit) AS MinProfit,
MAX(Profit) AS MaxProfit,
AVG(Profit) AS AvgProfit
FROM Amazon_Sales;
