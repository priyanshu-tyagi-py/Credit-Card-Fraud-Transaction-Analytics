--Geographic Spending Analysis--
SELECT 
    state,
    city,
    COUNT(*) AS total_transactions,
    ROUND(SUM(amt),2) AS total_spending
FROM bank_transactions
GROUP BY state, city
ORDER BY total_spending DESC
LIMIT 20;
