CREATE OR REPLACE TABLE `rakamin-kf-analytics-463306.kimia_farma.kf_table_analytics` AS
SELECT
  t.transaction_id,
  t.date,
  t.branch_id,
  b.branch_name,
  b.kota,
  b.provinsi,
  b.rating AS rating_cabang,
  t.customer_name,
  t.product_id,
  p.product_name,
  t.price AS actual_price,
  t.discount_percentage,

  -- Menghitung gross laba
  CASE
    WHEN t.price <= 50000 THEN 0.10
    WHEN t.price > 50000 AND t.price <= 100000 THEN 0.15
    WHEN t.price > 100000 AND t.price <= 300000 THEN 0.20
    WHEN t.price > 300000 AND t.price <= 500000 THEN 0.25
    ELSE 0.30
  END AS persentase_gross_laba,

  -- Menghitung harga setelah diskon
  t.price * (1 - t.discount_percentage / 100.0) AS nett_sales,

  -- Menghitung profit bersih
  (t.price * (1 - t.discount_percentage / 100.0)) *
    CASE
      WHEN t.price <= 50000 THEN 0.10
      WHEN t.price > 50000 AND t.price <= 100000 THEN 0.15
      WHEN t.price > 100000 AND t.price <= 300000 THEN 0.20
      WHEN t.price > 300000 AND t.price <= 500000 THEN 0.25
      ELSE 0.30
    END AS nett_profit,

  t.rating AS rating_transaksi

-- Menggabungkan keempat tabel
FROM
  `rakamin-kf-analytics-463306.kimia_farma.kf_final_transaction` AS t
JOIN
  `rakamin-kf-analytics-463306.kimia_farma.kf_kantor_cabang` AS b
  ON t.branch_id = b.branch_id
JOIN
  `rakamin-kf-analytics-463306.kimia_farma.kf_product` AS p
  ON t.product_id = p.product_id;
