SELECT
  transaction_id,
  COUNT(*) AS total_dupe
FROM
  `rakamin-kf-analytics-463306.kimia_farma.kf_table_analytics`
GROUP BY transaction_id
HAVING COUNT(*) > 1;
