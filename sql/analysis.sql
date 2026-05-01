-- Query 1: Total breaches per industry
SELECT organization_type, 
       COUNT(*) as total_breaches
FROM breaches
GROUP BY organization_type
ORDER BY total_breaches DESC
LIMIT 10;

-- Query 2: Breaches per year
SELECT year,
       COUNT(*) as breach_count
FROM breaches
GROUP BY year
ORDER BY year;

-- Query 3: Top 5 attack methods with percentage
SELECT method,
       COUNT(*) as total,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM breaches), 2) as percentage
FROM breaches
GROUP BY method
ORDER BY total DESC
LIMIT 5;

-- Query 4: Top 10 worst breaches by records lost
SELECT entity, year, records, method
FROM breaches
ORDER BY CAST(records AS INTEGER) DESC
LIMIT 10;

-- Query 5: Running total of breaches by year (window function)
SELECT year,
       COUNT(*) as yearly_count,
       SUM(COUNT(*)) OVER (ORDER BY year) as running_total
FROM breaches
GROUP BY year
ORDER BY year;

-- Query 6: Percentage share per sector
SELECT organization_type,
       COUNT(*) as breaches,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM breaches), 2) as percentage
FROM breaches
GROUP BY organization_type
ORDER BY breaches DESC
LIMIT 10;