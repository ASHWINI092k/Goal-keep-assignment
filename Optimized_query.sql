--CTE function "request" will filter out required columns and rows 
WITH request AS (
  SELECT 
    unique_key, zip_code, agency, created_date,closed_date
  FROM
    service_requests
  WHERE
  complaint_type = "Noise - Residential" AND created_date >= CURRENT_DATE - INTERVAL '90 days' AND zip_code IS NOT NULL AND closed_date IS NOT NULL )

SELECT 
  zip_code, agency, COUNT(*) AS No_of_complaints
FROM 
  request    -- using request to get filtered out data to fetch the top 10 records
GROUP BY zip_code, agency 
ORDER BY No_of_complaints DESC  -- So that highest complaint will be at top and  limit operation done top 10 records are fetched
LIMIT 10           --to get the top 10 records
  
