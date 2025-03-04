select DATE_FORMAT(trans_date, '%Y-%m')  as month
, country
,count(*) as trans_count
, count(CASE WHEN state = "approved" THEN 1 ELSE null end) as approved_count
, sum(amount) as trans_total_amount
, sum(CASE WHEN state = "approved" THEN amount ELSE 0 end) as approved_total_amount
FROM transactions
GROUP BY month, country
