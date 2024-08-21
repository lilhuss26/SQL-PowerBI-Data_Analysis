create view Quater_year as
select d.Quarter ,d.Year,count (OrderID) as orders_Count from DateDim d
inner join SalesFact s on CONVERT(DATE, s.OrderDate) = d.FullDate
group by d.Quarter, d.year;


WITH RankedQuarters AS (
  SELECT Quarter, Year,orders_count,
  RANK() OVER (PARTITION BY Year ORDER BY orders_count DESC) AS rank
  FROM Quater_year)
SELECT Quarter,Year, orders_count AS Max_Orders_Count
FROM RankedQuarters
WHERE rank = 1;

select d.Year,sum(s.TotalAmount)as Total FROM SalesFact s
inner join DateDim d on CONVERT(date, s.OrderDate) = d.FullDate 
GROUP BY d.Year
order by Total desc;

select d.Month,avg(s.TotalAmount)as avrage_total FROM SalesFact s
inner join DateDim d on CONVERT(date, s.OrderDate) = d.FullDate 
GROUP BY d.Month
order by avrage_total desc

select d.Year,q.Quarter, sum(s.TotalAmount)as Total FROM SalesFact s
inner join DateDim d on CONVERT(date, s.OrderDate) = d.FullDate 
inner join Quater_year q on q.Quarter = d.Quarter
GROUP BY d.Year,q.Quarter
having q.Quarter = 3 or q.Quarter = 4  
order by Total desc;

select * from Quater_year

select d.Year,q.Quarter, sum(s.TotalAmount)as Total FROM SalesFact s
inner join DateDim d on CONVERT(date, s.OrderDate) = d.FullDate 
inner join Quater_year q on q.Quarter = d.Quarter
GROUP BY d.Year,q.Quarter
having q.Quarter = 1 or q.Quarter = 2  
order by Total desc;

select d.DayName, sum(s.TotalAmount)as Total FROM SalesFact s
inner join DateDim d on CONVERT(date, s.OrderDate) = d.FullDate 
GROUP BY d.DayName
order by Total desc;

create view Quater_year_rev as
select d.Quarter ,d.Year,sum(TotalAmount)as Total from DateDim d
inner join SalesFact s on CONVERT(DATE, s.OrderDate) = d.FullDate
group by d.Quarter, d.year;

select * from Quater_year_rev
WITH RankedQuarters_rev AS (
  SELECT Quarter, Year,Total,
  RANK() OVER (PARTITION BY Year ORDER BY Total DESC) AS rank
  FROM Quater_year_rev)
SELECT Quarter,Year, Total AS Max_Orders_rev
FROM RankedQuarters_rev
WHERE rank = 1;


WITH RankedQuarters AS (
  SELECT Quarter, Year,orders_count,
  RANK() OVER (PARTITION BY Year ORDER BY orders_count DESC) AS rank
  FROM Quater_year)
SELECT Quarter,Year, orders_count AS Max_Orders_Count
FROM RankedQuarters
WHERE rank = 1;

