-- 1. Retrieve the Total Sales for Each Product Category
SELECT Product, SUM(Revenue) AS TotalSales
FROM [capstone project].[dbo].[SalesData$]
GROUP BY Product;

-- 2. Find the Number of Sales Transactions in Each Region
SELECT Region, COUNT(*) AS NumberOfTransactions
FROM [capstone project].[dbo].[SalesData$]
GROUP BY Region;

-- 3. Find the Highest-Selling Product by Total Sales Value
SELECT TOP 1 Product, SUM(Revenue) AS TotalSales
FROM [capstone project].[dbo].[SalesData$]
GROUP BY Product
ORDER BY TotalSales DESC;

-- 4. Calculate Total Revenue per Product
SELECT Product, SUM(Revenue) AS TotalRevenue
FROM [capstone project].[dbo].[SalesData$]
GROUP BY Product;

-- 5. Calculate Monthly Sales Totals for the Current Year
SELECT MONTH(OrderDate) AS SaleMonth, SUM(Revenue) AS MonthlyTotal
FROM [capstone project].[dbo].[SalesData$]
WHERE YEAR(OrderDate) = YEAR(GETDATE())
GROUP BY MONTH(OrderDate)
ORDER BY SaleMonth;

-- 6. Find the Top 5 Customers by Total Purchase Amount
SELECT TOP 5 [Customer Id], SUM(Revenue) AS TotalPurchases
FROM [capstone project].[dbo].[SalesData$]
GROUP BY [Customer Id]
ORDER BY TotalPurchases DESC;

-- 7. Calculate the Percentage of Total Sales Contributed by Each Region
WITH RegionalSales AS (
    SELECT Region, SUM(Revenue) AS TotalSales
    FROM [capstone project].[dbo].[SalesData$]
    GROUP BY Region
)
SELECT Region, TotalSales,
       (TotalSales * 100.0 / (SELECT SUM(TotalSales) FROM RegionalSales)) AS PercentageContribution
FROM RegionalSales;

-- 8. Identify Products with No Sales in the Last Quarter
SELECT Product
FROM [capstone project].[dbo].[SalesData$]
WHERE Product NOT IN (
    SELECT DISTINCT Product
    FROM [capstone project].[dbo].[SalesData$]
    WHERE OrderDate >= DATEADD(QUARTER, -1, GETDATE())
);

