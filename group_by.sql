-- aggregate and group by functions
select max (amount), max (amount), count(*) from SALES 
-- find minimum, maximum and total items 
select sum (amount) from SALES
-- total sales

select avg (amount) from sales
select * from SALES order by TOTALPRICE
select sum (TOTALPRICE) from SALES
select avg (TOTALPRICE) from sales

select *FROM SALES where CITY= 'ADANA'

select max (TOTALPRICE), max (TOTALPRICE), 
count(FICHENO), Sum(TOTALPRICE), avg( TOTALPRICE) 
from SALES where CITY ='ADANA'

select max (TOTALPRICE), max (TOTALPRICE), 
count(FICHENO), Sum(TOTALPRICE), avg( TOTALPRICE) 
from SALES where CITY ='ANKARA'

--GROUP BY FUNCTION:

select 
CITY,
max (TOTALPRICE) as minprice, 
max (TOTALPRICE) AS maxprice, 
count(FICHENO) as rowcount_, 
Sum(TOTALPRICE) totalprice,
avg( TOTALPRICE) avgprice
from SALES 
group by CITY
order by sum(TOTALPRICE)

--en çok satýþ yapan maðaza 
-- Cities are listed by sales numbers:

select 
CITY,sum (TOTALPRICE)
from SALES 
group by CITY
order by sum(TOTALPRICE) DESC

--en çok satýþ yapan ilk 10 maðaza
-- Top 10 cities with the most sales

select top 10
CITY,sum (TOTALPRICE)
from SALES 
group by CITY
order by sum(TOTALPRICE) DESC

-- tarih formatýndan sadece tarih veya zamaný
--seçmek için convert fonksiyonu kullanýlýr.

select 
 * from SALES where CITY ='ANKARA'
 and DATE2='2019-01-01'
order by DATE_

update sales set DATE2 = convert (DATE, DATE_)

select CITY, DATE2, 
sum (TOTALPRICE) as TOTALPRICE
from SALES where CITY = 'ANKARA'
group by DATE2, CITY
order by DATE2, CITY

--Günlere göre satýþ sayýlarýný gösterme
select DATE2, CITY, Sum (TOTALPRICE) 
as TotalPrice, sum (AMOUNT) as Amount from SALES

where DATE2 = '2019-01-01'
group by DATE2, CITY
order by DATE2, Sum (TOTALPRICE) desc

select CATEGORY1,CATEGORY2, CATEGORY3,CATEGORY4,
sum(TOTALPRICE) as Totalprice,
count (*) as ROWCOUNT_,
sum (AMOUNT) as Totalamount from SALES

group by CATEGORY1,CATEGORY2, CATEGORY3,CATEGORY4
order by CATEGORY1,CATEGORY2, CATEGORY3,CATEGORY4

--maðazalarýn müþteri sayýsýný bulma
SELECT CITY,count(DISTINCt CUSTOMERNAME) as
Customer_name,
count (distinct FICHENO) as Customer_count,
count (*) Itemcount
FROM SALES
WHERE DATEPART(MONTH, DATE2) = 1
GROUP BY CITY
--Belli bir cironun üzerinde satýþ yapan maðazalarý bulma
select CITY, sum (TOTALPRICE) 

from SALES
group by CITY
having sum (TOTALPRICE) >40000

order By sum (TOTALPRICE) desc


--Belli sayýnýn üstünde müþteriyi getirme:
select CITY, sum (TOTALPRICE) as Totalprice,
count (distinct CUSTOMERNAME) as Customercount

from SALES
group by CITY
having count (distinct CUSTOMERNAME)>500
and sum(TOTALPRICE) > 300000
order By sum (TOTALPRICE) desc
