--Transaction Failure Analysis--
SELECT 
    category,

    COUNT(*) AS total_transactions,

    SUM(
        CASE
            WHEN is_fraud = 1 THEN 1
            ELSE 0
        END
    ) AS failed_transactions,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN is_fraud = 1 THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS failure_rate_pct

FROM bank_transactions
GROUP BY category
ORDER BY failure_rate_pct DESC;
