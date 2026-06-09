--Peak Transaction Hours--
SELECT 
    EXTRACT(HOUR FROM trans_date_trans_time) AS transaction_hour,
    COUNT(*) AS total_transactions,
    ROUND(SUM(amt),2) AS total_revenue
FROM bank_transactions
GROUP BY transaction_hour
ORDER BY total_transactions DESC
LIMIT 20;
