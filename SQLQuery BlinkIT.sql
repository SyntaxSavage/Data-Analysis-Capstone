SELECT * FROM dbo.[BlinkIT Grocery Data]

SELECT COUNT(*) FROM [BlinkIT Grocery Data]

UPDATE [BlinkIT Grocery Data]
SET [Item Fat Content] =
CASE 
WHEN [Item Fat Content] IN ('LF', 'low fat') THEN 'Low Fat'
WHEN [Item Fat Content] = 'reg' THEN 'Regular'
ELSE [Item Fat Content]
END

/* (A). KPI's */

SELECT DISTINCT [Item Fat Content] FROM dbo.[BlinkIT Grocery Data]
/*(1)*/

SELECT CAST(SUM(Sales)/ 1000000 AS DECIMAL(10,2)) AS totalSales FROM dbo.[BlinkIT Grocery Data]
WHERE [Outlet Establishment Year] = 2022

/*(2)*/
SELECT CAST(AVG(Sales) AS DECIMAL(10,2)) FROM dbo.[BlinkIT Grocery Data]
WHERE [Outlet Establishment Year] = 2022

/*(3)*/
SELECT COUNT(*) FROM dbo.[BlinkIT Grocery Data]
WHERE [Outlet Establishment Year] = 2022

SELECT CAST(AVG(Rating) AS DECIMAL(10,2)) FROM dbo.[BlinkIT Grocery Data]

/* (B).Total Sales by Fat Content */

SELECT [Item Fat Content], 
	CAST(SUM(Sales)/1000 AS DECIMAL(10,2)) AS totalSales,
	CAST(AVG(Sales) AS DECIMAL(10,2)) AS avgSales,
	COUNT(*) AS noofitems,
	CAST(AVG(Rating) AS DECIMAL(10,2)) AS agvRating
FROM dbo.[BlinkIT Grocery Data]
GROUP BY [Item Fat Content]
ORDER BY totalSales DESC

/* (C).Total Sales by Item Type */

SELECT [Item Type], 
	CAST(SUM(Sales) AS DECIMAL(10,2)) AS totalSales,
	CAST(AVG(Sales) AS DECIMAL(10,2)) AS avgSales,
	COUNT(*) AS noofitems,
	CAST(AVG(Rating) AS DECIMAL(10,2)) AS agvRating
FROM dbo.[BlinkIT Grocery Data]
GROUP BY [Item Type]
ORDER BY totalSales DESC

SELECT TOP 5 [Item Type], 
	CAST(SUM(Sales) AS DECIMAL(10,2)) AS totalSales,
	CAST(AVG(Sales) AS DECIMAL(10,2)) AS avgSales,
	COUNT(*) AS noofitems,
	CAST(AVG(Rating) AS DECIMAL(10,2)) AS agvRating
FROM dbo.[BlinkIT Grocery Data]
GROUP BY [Item Type]
ORDER BY totalSales DESC

SELECT TOP 5 [Item Type], 
	CAST(SUM(Sales) AS DECIMAL(10,2)) AS totalSales,
	CAST(AVG(Sales) AS DECIMAL(10,2)) AS avgSales,
	COUNT(*) AS noofitems,
	CAST(AVG(Rating) AS DECIMAL(10,2)) AS agvRating
FROM dbo.[BlinkIT Grocery Data]
GROUP BY [Item Type]
ORDER BY totalSales ASC

/* (D).Fat Content by Outlet for Total Sales */

SELECT TOP 5 [Outlet Location Type],[Item Fat Content], 
	CAST(SUM(Sales) AS DECIMAL(10,2)) AS totalSales,
	CAST(AVG(Sales) AS DECIMAL(10,2)) AS avgSales,
	COUNT(*) AS noofitems,
	CAST(AVG(Rating) AS DECIMAL(10,2)) AS agvRating
FROM dbo.[BlinkIT Grocery Data]
GROUP BY [Outlet Location Type],[Item Fat Content]
ORDER BY totalSales ASC



SELECT [Outlet Location Type],
	ISNULL([Low Fat], 0) AS Low_Fat, 
       ISNULL([Regular], 0) AS Regular
FROM
(
SELECT [Outlet Location Type], [Item Fat Content],
	CAST(SUM(Sales) AS DECIMAL(10,2)) AS totalSales
	
FROM dbo.[BlinkIT Grocery Data]
GROUP BY [Outlet Location Type], [Item Fat Content]
)AS SourceTable
PIVOT
(
	SUM(TotalSales)
	FOR [Item Fat Content] IN ([Low Fat], [Regular])
)	AS PivotTable
ORDER BY [Outlet Location Type];

/* (E).Total Sales by Outlet Establishment */

SELECT [Outlet Establishment Year], 
	CAST(SUM(Sales) AS DECIMAL(10,2)) AS totalSales
FROM dbo.[BlinkIT Grocery Data]
GROUP BY [Outlet Establishment Year]
ORDER BY totalSales ASC

SELECT [Outlet Establishment Year], 
	CAST(SUM(Sales) AS DECIMAL(10,2)) AS totalSales,
	CAST(AVG(Sales) AS DECIMAL(10,1)) AS avgSales,
	COUNT(*) AS noofitems,
	CAST(AVG(Rating) AS DECIMAL(10,2)) AS agvRating
FROM dbo.[BlinkIT Grocery Data]
GROUP BY [Outlet Establishment Year]
ORDER BY totalSales ASC

/* (F).Percentage of Sales by Outlet Size */

SELECT [Outlet Size], 
	CAST(SUM(Sales) AS DECIMAL(10,2)) AS totalSales,
	CAST((SUM(Sales) * 100.0/ SUM(SUM(sales)) OVER()) AS DECIMAL(10,2)) AS SalesPercentage
FROM dbo.[BlinkIT Grocery Data]
GROUP BY [Outlet Size]
ORDER BY totalSales DESC

/* (G).Sales by Outlet Location */

SELECT [Outlet Location Type], 
	CAST(SUM(Sales) AS DECIMAL(10,2)) AS totalSales
FROM dbo.[BlinkIT Grocery Data]
GROUP BY [Outlet Location Type]
ORDER BY totalSales DESC

SELECT [Outlet Location Type], 
	CAST(SUM(Sales) AS DECIMAL(10,2)) AS totalSales,
	CAST((SUM(Sales) * 100.0/ SUM(SUM(sales)) OVER()) AS DECIMAL(10,2)) AS SalesPercentage,
	CAST(AVG(Sales) AS DECIMAL(10,1)) AS avgSales,
	COUNT(*) AS noofitems,
	CAST(AVG(Rating) AS DECIMAL(10,2)) AS agvRating
FROM dbo.[BlinkIT Grocery Data]
GROUP BY [Outlet Location Type]
ORDER BY totalSales DESC

SELECT [Outlet Location Type], 
	CAST(SUM(Sales) AS DECIMAL(10,2)) AS totalSales,
	CAST((SUM(Sales) * 100.0/ SUM(SUM(sales)) OVER()) AS DECIMAL(10,2)) AS SalesPercentage,
	CAST(AVG(Sales) AS DECIMAL(10,1)) AS avgSales,
	COUNT(*) AS noofitems,
	CAST(AVG(Rating) AS DECIMAL(10,2)) AS agvRating
FROM dbo.[BlinkIT Grocery Data]
WHERE [Outlet Establishment Year]= 2022
GROUP BY [Outlet Location Type]
ORDER BY totalSales DESC

/* (H). All Metrics by Outlet Type */

SELECT [Outlet Type], 
	CAST(SUM(Sales) AS DECIMAL(10,2)) AS totalSales,
	CAST((SUM(Sales) * 100.0/ SUM(SUM(sales)) OVER()) AS DECIMAL(10,2)) AS SalesPercentage,
	CAST(AVG(Sales) AS DECIMAL(10,1)) AS avgSales,
	COUNT(*) AS noofitems,
	CAST(AVG(Rating) AS DECIMAL(10,2)) AS agvRating
FROM dbo.[BlinkIT Grocery Data]
GROUP BY [Outlet Type]
ORDER BY totalSales DESC
