# High-Performance Running Balance in T-SQL

This project demonstrates an optimized approach to calculating daily financial balances (Running Totals) using modern SQL Window Functions vs. legacy methods.

## 🚀 The Challenge
In financial systems, calculating a continuous balance (Running Total) while handling:
1. **High Volume Data:** Ensuring performance over millions of rows.
2. **Deterministic Results:** Handling multiple transactions within the same millisecond (Same-time entries).

## 💡 The Solution
Instead of using slow Cursors or expensive Self-Joins, this implementation uses `SUM() OVER()` with a specific window frame:
- **`ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW`**: This ensures the calculation stays within the set-based engine's optimal path.
- **Deterministic Sorting**: By combining `No_Sanad` and `ID`, we guarantee a consistent order even for simultaneous transactions.

## 📊 Performance Benefit
- **Set-based (Window Functions):** O(n) complexity.
- **Legacy (Cursor/Loop):** O(n²) or worse in terms of RBAR (Row By Agonizing Row).

## How to use
Run `schema.sql` to create the environment, then execute `running_total.sql` to see the results.


<p align="center">
  <img src="RunningTotal_total.jpg" alt="SQL Result Preview" width="600">
</p>
