--On which day of the week do I spend the most money overall?
--Findings: Thursday is the day I spend the most monet while Monday is when I spend the least
select 
day_of_week,
SUM(withdrawn) as spend
from
mpesa_analysis.dbo.Transactions
where category !='Fuliza/OD'
GROUP BY
day_of_week
ORDER BY spend desc
