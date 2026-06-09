--Merchant Performance Analysis--
SELECT 
    merchant,
    COUNT(*) AS total_transactions,
    ROUND(SUM(amt),2) AS total_revenue,
    ROUND(AVG(amt),2) AS avg_order_value,
    COUNT(DISTINCT cc_num) AS unique_customers
FROM bank_transactions
GROUP BY merchant
ORDER BY total_revenue DESC
LIMIT 20;
