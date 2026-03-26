--10.Show a pivot table of my total withdrawals by category across each month — categories as rows, months as columns.
--Findings:The months where I spent the least money is July,August, and Deceomber
select * FROM
            (SELECT
                MONTH(completion_time) as TxnMonth,
                category,
                withdrawn
            from mpesa_analysis.dbo.Transactions
            where category!='Fuliza/OD' and withdrawn>0
            ) as MonthlyData
pivot(sum(withdrawn) for TxnMonth in  (
    [1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12]
)
                        ) as pivotsummary
