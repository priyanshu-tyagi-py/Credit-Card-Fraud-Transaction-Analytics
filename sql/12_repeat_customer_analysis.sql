--Repeat Customer Analysis--
WITH customer_activity AS (
    SELECT 
        cc_num,
        COUNT(*) AS transaction_count
    FROM bank_transactions
    GROUP BY cc_num
)

SELECT 
    COUNT(*) AS total_customers,

    SUM(
        CASE
            WHEN transaction_count > 1 THEN 1
            ELSE 0
        END
    ) AS repeat_customers,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN transaction_count > 1 THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS repeat_customer_pct

FROM customer_activity;
