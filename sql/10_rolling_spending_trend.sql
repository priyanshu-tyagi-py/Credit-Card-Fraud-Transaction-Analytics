--Rolling Spending Trend--
SELECT 
    DATE(trans_date_trans_time) AS transaction_day,

    ROUND(SUM(amt),2) AS daily_revenue,

    ROUND(
        AVG(SUM(amt)) OVER(
            ORDER BY DATE(trans_date_trans_time)
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS rolling_7_day_avg

FROM bank_transactions
GROUP BY transaction_day
ORDER BY transaction_day
LIMIT 20;
