--Top Spending Categories--
SELECT 
    category,
    COUNT(*) AS total_transactions,
    ROUND(SUM(amt),2) AS total_revenue,
    ROUND(AVG(amt),2) AS avg_transaction_value
FROM bank_transactions
GROUP BY category
ORDER BY total_revenue DESC;
