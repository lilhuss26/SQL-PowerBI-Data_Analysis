# SQL-Sales-Data-Analysis

## Snowflake Schema

**Data Model Enhancements:**

* **Date Dimension:** Added a dedicated date dimension for granular time-based analysis.
* **Fact Table Optimization:** Summarized order and order item information in a `SalesFact` table for efficient querying.
* **Normalized Data:** `SalesFact` contains foreign keys to related dimension tables (except supplier) promoting data integrity and flexibility.

## Analysis Queries

**Key Insights Explored:**

* **Time-Based Analysis:**
  * Quarterly trends
  * Weekday performance
  * Monthly fluctuations
* **Product Analysis:**
  * Supplier performance
  * Price change impact
  * Production location analysis
* **Customer Analysis:**
  * Customer location insights
  * Customer value segmentation
  * Correlation between revenue and order counts

****Visualization:****

*  Take a look on this Repo => [PowerBI_Dashboard_SQL_Analysis](https://github.com/LilHuss26/PowerBI_Dashboard_SQL_Analysis) .


