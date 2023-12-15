use World
select * from [dbo].[Country]
---------------1-----------------------------
select * from [dbo].[CountryLanguage]
select distinct Language from [dbo].[CountryLanguage]
------------------2------------------------------
select *
from [dbo].[Country]
where [dbo].[Country].Continent = 'Africa'
order by SurfaceArea

-----------------3--------------------------
select *
FROM [dbo].[City]
where [dbo].[City].Population >2000000
-----------------4-------------------------
select * from [dbo].[Country]
where [dbo].[Country].IndepYear between  1920 and 1990
------------------5----------------------------------
select * from [dbo].[Country]
where [dbo].[Country].IndepYear is null
-------------------6--------------------------------
select * from [dbo].[Country]
where [dbo].[Country].GovernmentForm = 'Republic'
--------------------7--------------------------------
select * from [dbo].[Country]
where  [dbo].[Country].Continent ='Asia' and [dbo].[Country].Population>1000000
--------------------8---------------------------------
select [dbo].[CountryLanguage].CountryCode 
from [dbo].[CountryLanguage]
where [dbo].[CountryLanguage].Language = 'Spanish'
--------------------9----------------------------------
select CountryCode from CountryLanguage
where IsOfficial=1 
group by CountryCode
having count(1)>=3
---------------------10-----------------------------
select sum([dbo].[City].Population)
from [dbo].[City]
---------------------11------------------------
select [dbo].[Country].Continent,[dbo].[Country].Population,[dbo].[Country].Capital
from [dbo].[Country]
--------------------12------------------------


select    Continent  
from Country

order by count  (Name)  


SELECT Continent, COUNT(*)   ,SUM ( CAST(Country.Population  AS bigint))
FROM Country
GROUP BY continent

----------------------13----------------------------------
insert into [dbo].[Country](Code,Name,Continent,Region,SurfaceArea,Population,LocalName,GovernmentForm,Code2,LifeExpectancy)
values ('ATL','Antikya','Africa','thern Africa',2381741,31471000,'Al-Jaza’ir/Algérie','Republic','DO',2.5)
insert into [dbo].[City](ID,Name,CountryCode,District,Population)
values (100000,'Antikya','ATL','Groningen',31471000)
insert into [dbo].[CountryLanguage](CountryCode,Language,IsOfficial,Percentage)
values ('ATL','arabic',1.5,5.5)
---------------------14------------------------------------------------------------------------
update Country
set LifeExpectancy=LifeExpectancy+5
-----------------------15-------------------------------
delete from [dbo].[City]
where CountryCode= 'ATL'
-----------------16-------------------
delete from [dbo].[CountryLanguage]
where CountryCode = 'ATL'
-----------------17------------------
delete from [dbo].[Country]
where Code = 'ATL'
