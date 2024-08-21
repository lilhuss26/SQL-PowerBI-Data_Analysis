create view Product_INF as 
select ProductID,count (ProductID) as Time_Ordered , SUM(TotalAmount) as product_Amount, SUM(Quantity) Product_Quantity,p.SupplierId
from SalesFact 
inner join ProductDim p on SalesFact.ProductID = p.Id
group by ProductID,SupplierId;

select * from Product_INF
order by product_Amount desc
-----------------------------------
-----------------------------------
select ProductID,
min(UnitPrice) as minmum_price,
max(UnitPrice) as maximum_price,
max(UnitPrice)-min(UnitPrice) as Change_
from SalesFact 
group by ProductID
order by Change_

select * from ProductDim
select distinct UnitPrice from SalesFact where ProductID = 15
-----------------------------------
-----------------------------------

select ProductID, case 
  when MAX(UnitPrice) - MIN(UnitPrice) > 0 then MIN(UnitPrice) / (MAX(UnitPrice) - MIN(UnitPrice))
  else 0
  end as ratio
from SalesFact  
group by ProductID;
-------------------------------
-------------------------------
SELECT
  sf.ProductID,
  COUNT(*) AS Time_Ordered,
  SUM(TotalAmount) AS product_Amount,
  SUM(Quantity) AS Product_Quantity,
  p.SupplierId,
  (
    SELECT CASE 
      WHEN MAX(UnitPrice) - MIN(UnitPrice) > 0
	  THEN MIN(UnitPrice) / (MAX(UnitPrice) - MIN(UnitPrice))
      ELSE 0
    END AS ratio
    FROM SalesFact AS sf2
    WHERE sf2.ProductID = sf.ProductID
  ) AS change_ratio
FROM SalesFact sf
INNER JOIN ProductDim p ON sf.ProductID = p.Id
GROUP BY sf.ProductID, p.SupplierId
ORDER BY Time_Ordered DESC;
-----------------------------------
-----------------------------------
select p.SupplierId,s.City,s.Country,
sum(p.product_Amount) as product_Amount from Product_INF p
inner join SupplierDim s on s.Id = p.SupplierId
group by p.SupplierId,s.City,s.Country
order by product_Amount desc

select p.SupplierId,s.Country,sum(p.product_Amount) as product_Amount from Product_INF p
inner join SupplierDim s on s.Id = p.SupplierId
group by p.SupplierId,s.Country
order by product_Amount desc

select sum(p.product_Amount) as product_Amount,p.SupplierId from Product_INF p
-------inner join SupplierDim s on s.Id = p.SupplierId
group by p.SupplierId
order by product_Amount desc


select s.Country,
sum(p.product_Amount) as product_Amount 
from Product_INF p
inner join SupplierDim s on s.Id = p.SupplierId
group by s.Country
order by product_Amount desc