WITH CTE as (
    SELECT log_id
    ,ip
    ,SUBSTRING_INDEX(ip, ".", 1)  as part1
    , SUBSTRING_INDEX(SUBSTRING_INDEX(ip, ".", 2), ".", -1) as part2
    , SUBSTRING_INDEX(SUBSTRING_INDEX(ip, ".", -2), ".", 1)  as part3
    , SUBSTRING_INDEX(ip, ".", -1) as part4
    FROM logs
)
, cnt as (
SELECT ip
, SUM(CASE WHEN CAST(part1 AS signed) > 255
OR CAST(part2 AS signed) > 255
OR CAST(part3 AS signed) > 255
OR CAST(part4 AS signed) > 255 THEN 1 ELSE 0 END) as cnt_octet
, SUM(CASE WHEN LENGTH(part1) > 1 AND part1 LIKE "0%"
OR LENGTH(part2) > 1 AND part2 LIKE "0%"
OR LENGTH(part3) > 1 AND part3 LIKE "0%"
OR LENGTH(part4) > 1 AND part4 LIKE "0%" THEN 1 ELSE 0 END) as cnt_leading
, SUM(CASE WHEN LENGTH(ip)-LENGTH(REPLACE(ip, ".", "")) != 3 THEN 1 ELSE 0 END) as cnt_length
FROM CTE
group by ip
)

SELECT ip, cnt_octet+cnt_leading+cnt_length as invalid_count
FROM cnt
WHERE cnt_octet+cnt_leading+cnt_length > 0
ORDER BY invalid_count DESC, ip DESC
