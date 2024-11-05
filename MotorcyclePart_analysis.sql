
-- SQL query for analyzing motorcycle part sales

-- This query calculates the net revenue from wholesale orders by product line, month, and warehouse.


SELECT 
    product_line,  -- The type of motorcycle part sold
    TO_CHAR(date, 'Month') AS month,  -- Extract the month from the date in a readable format
    warehouse,  -- The warehouse from which the order was processed
    SUM(total) AS total_sales,  -- Calculate the total sales revenue for each group
    SUM(payment_fee) AS total_payment_fees,  -- Calculate the total payment fees for each group
    SUM(total) - SUM(payment_fee) AS net_revenue  -- Calculate net revenue as total sales minus total payment fees

FROM sales  -- From the sales table which contains the order data
WHERE client_type = 'Wholesale'  -- Filter to include only wholesale orders

-- Group the results by product line, month, and warehouse to aggregate the data appropriately
GROUP BY product_line, TO_CHAR(date, 'Month'), warehouse

-- Order the results for better readability and analysis
ORDER BY product_line, month, net_revenue DESC;  -- Sort by product line, month, and net revenue in descending order

-- End of the SQL query for analyzing motorcycle part sales
