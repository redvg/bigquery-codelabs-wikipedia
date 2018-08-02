/*
    1. returns all views in dec 2011
*/

SELECT
  SUM(views) AS views_in_dec_2011
FROM
  `bigquery-samples.wikimedia_pageviews.201112`
  
/*
    2. returns total views for title with 'red' for wikipedia, for dec 11 table
*/
  
SELECT
  title,
  SUM(views) views
FROM
  `bigquery-samples.wikimedia_pageviews.201112`
WHERE
  wikimedia_project = "wp"
  AND REGEXP_CONTAINS(title, 'Red.*t')
GROUP BY
  title
ORDER BY
  views DESC

/*
    3. returns total views for title with 'red' for wikipedia, for all tables in 2011
*/

SELECT
  title,
  SUM(views) views
FROM
  `bigquery-samples.wikimedia_pageviews.2011*`
WHERE
  wikimedia_project = "wp"
  AND REGEXP_CONTAINS(title, 'Red.*t')
GROUP BY
  title
ORDER BY
  views DESC

/*
    4. returns total views for title with 'red' for wikipedia, for nov & dec 11
*/

SELECT
  title,
  SUM(views) views
FROM
  `bigquery-samples.wikimedia_pageviews.2011*`
WHERE
  (_TABLE_SUFFIX = '11'
    OR _TABLE_SUFFIX = '12')
  AND wikimedia_project = "wp"
  AND REGEXP_CONTAINS(title, 'Red.*t')
GROUP BY
  title
ORDER BY
  views DESC
