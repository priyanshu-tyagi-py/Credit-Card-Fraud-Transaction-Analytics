--Suspicious Transaction Detection--
SELECT 
    first,
    last,
    category,
    amt,
    trans_date_trans_time,

    CASE
        WHEN amt > 1000 THEN 'High Value Transaction'
        WHEN EXTRACT(HOUR FROM trans_date_trans_time) BETWEEN 0 AND 5
             AND amt > 500
        THEN 'Late Night Suspicious Purchase'
        ELSE 'Normal'
    END AS fraud_flag

FROM bank_transactions
WHERE amt > 500
ORDER BY amt DESC
LIMIT 20;
