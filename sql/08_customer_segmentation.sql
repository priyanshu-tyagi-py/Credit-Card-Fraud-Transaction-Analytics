--Customer Segmentation--
WITH customer_summary AS (
    SELECT 
        first,
        last,
        SUM(amt) AS total_spent
    FROM bank_transactions
    GROUP BY first, last
)

SELECT 
    first,
    last,
    ROUND(total_spent,2) AS total_spent,

    CASE
        WHEN total_spent >= 200000 THEN 'VIP Customer'
        WHEN total_spent >= 100000 THEN 'High Spender'
        WHEN total_spent >= 50000 THEN 'Medium Spender'
        ELSE 'Low Spender'
    END AS spending_segment

FROM customer_summary
ORDER BY total_spent DESC
LIMIT 20;
