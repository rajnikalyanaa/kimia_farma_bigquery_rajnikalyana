SELECT
  COUNT(*) AS total_rows,
  COUNTIF(transaction_id IS NULL) AS null_transaction_id,
  COUNTIF(branch_id IS NULL) AS null_branch_id,
  COUNTIF(branch_name IS NULL) AS null_branch_name,
  COUNTIF(kota IS NULL) AS null_kota,
  COUNTIF(provinsi IS NULL) AS null_provinsi,
  COUNTIF(rating_cabang IS NULL) AS null_rating_cabang,
  COUNTIF(customer_name IS NULL) AS null_customer_name,
  COUNTIF(product_id IS NULL) AS null_product_id,
  COUNTIF(product_name IS NULL) AS null_product_name,
  COUNTIF(actual_price IS NULL) AS null_actual_price,
  COUNTIF(discount_percentage IS NULL) AS null_discount,
  COUNTIF(persentase_gross_laba IS NULL) AS null_laba,
  COUNTIF(nett_sales IS NULL) AS null_nett_sales,
  COUNTIF(nett_profit IS NULL) AS null_nett_profit,
  COUNTIF(rating_transaksi IS NULL) AS null_rating_transaksi
FROM
  `rakamin-kf-analytics-463306.kimia_farma.kf_table_analytics`;
