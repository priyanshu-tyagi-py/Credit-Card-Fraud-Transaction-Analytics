--High-Value Customer Identification--
WITH customer_summary AS (
    SELECT 
        first,
        last,
        COUNT(*) AS transaction_count,
        ROUND(SUM(amt),2) AS lifetime_spend,
        ROUND(AVG(amt),2) AS avg_transaction_value
    FROM bank_transactions
    GROUP BY first, last
)

SELECT *,
       DENSE_RANK() OVER(
           ORDER BY lifetime_spend DESC
       ) AS customer_rank
FROM customer_summary
ORDER BY customer_rank
LIMIT 20;
