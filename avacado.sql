select *
From
avacado.dbo.avocado_sales
----The product/price lookup code (PLU) uniquely identifies a product (mainly produce) 
--4046: non-organic small/medium Hass Avocados (~3-5 oz)
--4225: non-organic large Hass Avocados (~8-10 oz)
--4770: non-organic extra large Hass Avocados (~10-15 oz)
--therefore we rename these column , 4046 as medium hass, 4225 as laege hass, 4770 as extra large hass
use
avacado
go
exec sp_rename 'dbo.avocado_sales._4046' , 'Medium_Hass', 'column'
go
select *
From
avacado.dbo.avocado_sales
---
use
avacado
go
exec sp_rename 'dbo.avocado_sales._4225' , 'Large_Hass', 'column'
go
select *
From
avacado.dbo.avocado_sales
----
use
avacado
go
exec sp_rename 'dbo.avocado_sales._4770' , 'Xlarge_Hass', 'column'
go
select *
From
avacado.dbo.avocado_sales
------we are checking ig any value is less than zero
select count(*)
from
avacado.dbo.avocado_sales
where
AveragePrice < 0 or Total_Bags < 0 or Total_Volume < 0 or  Small_Bags < 0 or Large_Bags < 0 or
XLarge_Bags < 0 or medium_hass < 0 or large_hass < 0 or xlarge_hass < 0

----checking is there any mis spelled
select distinct type
from
avacado.dbo.avocado_sales
--checking all region
select distinct region
from
avacado.dbo.avocado_sales
order by region asc
---now there are some city, some state and region. Data IS being overlapped we make it in same unit of city and rempve state and region
delete
from
avacado.dbo.avocado_sales
where
region in 
('California', 'Greatlakes',  'MidSouth', 'NewYork', 'NorthEast', 'SouthCarolina', 'Plains', 'SouthCentral', 'SouthEast', 'TotalUS','West')
--
select distinct region
from
avacado.dbo.avocado_sales
order by region asc

---
