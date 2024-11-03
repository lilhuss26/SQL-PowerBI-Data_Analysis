# SQL-Sales-Data-Analysis

## Snowflake Schema

**Data Model Enhancements:**

* **Date Dimension:** Added a dedicated date dimension for granular time-based analysis.
* **Fact Table Optimization:** Summarized order and order item information in a `SalesFact` table for efficient querying.
* **Normalized Data:** `SalesFact` contains foreign keys to related dimension tables (except supplier) promoting data integrity and flexibility.
![{9D6276B2-CAC6-49D1-96B8-BA9F34FC8D2D}](https://github.com/user-attachments/assets/7bbd590b-cff3-453a-b26c-2c31ddad5821)

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


