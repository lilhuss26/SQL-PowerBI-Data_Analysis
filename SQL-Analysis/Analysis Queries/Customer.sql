create view country_Stats as
select c.Country,c.city,CustomerID,
count(OrderID) as orders,
sum(TotalAmount) as Total_Amount from SalesFact
inner join CustmerDim c on c.Id = CustomerID
group by CustomerID,c.City,c.Country;

select c.Country,CustomerID, count(OrderID) as orders, sum(TotalAmount) as Total_Amount from SalesFact
inner join CustmerDim c on c.Id = CustomerID
group by CustomerID,c.Country
order by orders desc;
-------------how many times a customer ordered, and amount he spent

select c.City, count(s.OrderID) as orders, sum(s.TotalAmount) as revenus,count(DISTINCT s.CustomerID) as customers from SalesFact s
inner join CustmerDim c on c.Id = CustomerID
group by c.City
order by orders desc

select c.City,c.Country,s.CustomerID, count(s.OrderID) as orders, sum(s.TotalAmount) as Total_Amount from SalesFact s
inner join CustmerDim c on c.Id = s.CustomerID
group by s.CustomerID,c.City,c.Country
order by Total_Amount desc;
