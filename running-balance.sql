
/* 
   Optimized Running Balance Calculation 
   Author: Armin
   Description: Uses Window Functions with ROWS frame for deterministic results.
*/

SELECT 
    No_Sanad,
    Code_Kol,
    Code_Moe,
    Code_Taf,
    Bed_Sanad AS Debit,
    Bes_Sanad AS Credit,
    -- Cumulative Debit
    SUM(Bed_Sanad) OVER (ORDER BY No_Sanad, ID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS TotalDebit,
    -- Cumulative Credit
    SUM(Bes_Sanad) OVER (ORDER BY No_Sanad, ID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS TotalCredit,
    -- Final Running Balance
    SUM(Bed_Sanad - Bes_Sanad) OVER (ORDER BY No_Sanad, ID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningBalance
FROM 
    Totalsafar.dbo.Hsb_De_Sanad -- Replace with your database.table
WHERE 
    Sal = 1404 
    AND Code_Kol = 101 
    AND Code_Moe = 101001 
    AND Code_Taf = 101001001
ORDER BY 
    No_Sanad, ID;
