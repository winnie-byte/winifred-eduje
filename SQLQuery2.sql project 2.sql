-- 1. Retrieve the Total Number of Customers from Each Region
SELECT Region, COUNT(CustomerID) AS TotalCustomers
FROM [capstone project].[dbo].[CustomerData$]
GROUP BY Region;

-- 2. Find the Most Popular Subscription Type by the Number of Customers
SELECT SubscriptionType, COUNT(CustomerID) AS NumberOfCustomers
FROM [capstone project].[dbo].[CustomerData$]
GROUP BY SubscriptionType
ORDER BY NumberOfCustomers DESC;

-- 3. Find Customers Who Canceled Their Subscription Within 6 Months
SELECT CustomerID, CustomerName, SubscriptionType, SubscriptionStart, SubscriptionEnd, SubsciptionDuration
FROM [capstone project].[dbo].[CustomerData$]
WHERE Canceled = 1
AND DATEDIFF(MONTH, SubscriptionStart, SubscriptionEnd) <= 6;

-- 4. Calculate the Average Subscription Duration for All Customers
SELECT AVG(SubsciptionDuration) AS AverageSubscriptionDuration
FROM [capstone project].[dbo].[CustomerData$];

-- 5. Find Customers with Subscriptions Longer Than 12 Months
SELECT CustomerID, CustomerName, SubscriptionType, SubsciptionDuration
FROM [capstone project].[dbo].[CustomerData$]
WHERE SubsciptionDuration > 365;

-- 6. Calculate Total Revenue by Subscription Type
SELECT SubscriptionType, SUM(Revenue) AS TotalRevenue
FROM [capstone project].[dbo].[CustomerData$]
GROUP BY SubscriptionType;

-- 7. Find the Top 3 Regions by Subscription Cancellations
SELECT TOP 3 Region, COUNT(CustomerID) AS Cancellations
FROM [capstone project].[dbo].[CustomerData$]
WHERE Canceled = 1
GROUP BY Region
ORDER BY Cancellations DESC;

-- 8. Find the Total Number of Active and Canceled Subscriptions
SELECT 
    CASE WHEN Canceled = 1 THEN 'Canceled' ELSE 'Active' END AS SubscriptionStatus,
    COUNT(CustomerID) AS TotalSubscriptions
FROM [capstone project].[dbo].[CustomerData$]
GROUP BY Canceled;


