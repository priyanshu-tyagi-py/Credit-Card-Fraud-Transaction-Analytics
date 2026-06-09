--Weekend vs Weekday Spending--
SELECT 
    CASE
        WHEN EXTRACT(DOW FROM trans_date_trans_time) IN (0,6)
        THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,

    COUNT(*) AS total_transactions,
    ROUND(SUM(amt),2) AS total_spending,
    ROUND(AVG(amt),2) AS avg_transaction_value

FROM bank_transactions
GROUP BY day_type;
