Select No_Sanad,Code_Kol,Code_Moe,Code_Taf,Bed_Sanad as Debit ,Bes_Sanad as Credit,

    SUM(Bed_Sanad) OVER (ORDER BY No_Sanad, ID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS TotalDebit,

    SUM(Bes_Sanad) OVER (ORDER BY No_Sanad, ID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS TotalCredit,

    SUM(Bed_Sanad - Bes_Sanad) OVER (ORDER BY No_Sanad, ID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningBalance
from Totalsafar.dbo.Hsb_De_Sanad 
Where Sal=1404 And Code_Kol=101 And Code_Moe=101001 And Code_Taf=101001001 
Order by No_Sanad, ID
