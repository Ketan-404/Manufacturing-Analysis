-- This query calculates the total sum of Manufactured Quantity from the 'manufecturing data' table
SELECT SUM(`Manufactured Qty`) 
FROM zakir.`manufecturing data`;

-- This query calculates the total sum of Rejected Quantity from the 'manufecturing data' table
SELECT SUM(`Rejected Qty`) 
FROM zakir.`manufecturing data`;

-- This query calculates the total sum of Processed Quantity from the 'manufecturing data' table
SELECT SUM(`Processed Qty`) 
FROM zakir.`manufecturing data`;

-- This query calculates the total sum of WO (Work Order) Quantity from the 'manufecturing data' table
SELECT SUM(`WO Qty`) 
FROM zakir.`manufecturing data`;

-- This query groups the data by Employee Name and calculates the total rejected quantity per employee
SELECT `Emp Name`, SUM(`Rejected Qty`) AS Total_Rejected_Qty
FROM zakir.`manufecturing data`
GROUP BY `Emp Name`;

-- This query groups the data by Machine Name and calculates the total rejected quantity per machine
SELECT `Machine Name`, SUM(`Rejected Qty`) AS Total_Rejected_Qty
FROM zakir.`manufecturing data`
GROUP BY `Machine Name`;

-- This query calculates the rejection rate per department by dividing the rejected quantity by manufactured quantity 
-- and multiplying by 100 to get a percentage. It only considers rows where manufactured quantity is greater than 0.
SELECT `Department Name`, SUM(`Rejected Qty`) / SUM(`Manufactured Qty`) * 100 AS `Rejection Rate`
FROM `manufecturing data`
WHERE `Manufactured Qty` > 0
GROUP BY `Department Name`
ORDER BY `Rejection Rate` DESC;

-- This query retrieves the top 5 employees with the highest total production (manufactured quantity) 
-- by summing up the manufactured quantity per employee and sorting the result in descending order
SELECT `Emp Name`, SUM(`Manufactured Qty`) AS `Total Produced`
FROM `Manufecturing Data`
GROUP BY `Emp Name`
ORDER BY `Total Produced` DESC
LIMIT 5;

-- This query calculates the count of orders grouped by Delivery Period to analyze on-time vs. delayed deliveries
SELECT `Delivery Period`, COUNT(*) AS `Order Count`
FROM `Manufecturing Data`
GROUP BY `Delivery Period`;

-- This query calculates the total revenue (sum of TotalValue) per buyer and orders the result in descending order of total revenue
SELECT `Buyer`, SUM(`TotalValue`) AS `Total Revenue`
FROM `Manufecturing Data`
GROUP BY `Buyer`
ORDER BY `Total Revenue` DESC;
