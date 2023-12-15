use World
-----------1-------------------
select * from [dbo].[City] 
where [CountryCode] = 'EGY'
------------2---------------------------
select * from [dbo].[Country]
where [Population] > 5000000
-------------3--------------------------
select * from [dbo].[CountryLanguage]
where [Language] = 'Dutch' and [IsOfficial] = 0
--------------4-------------------------------
select [Language],[IsOfficial] from [dbo].[CountryLanguage]
where [IsOfficial] = 1
---------------5-------------------------------
select * from [dbo].[Country]
where [Name]= [LocalName]

select [Name] ,District
from [dbo].[City] 
where [District] is not null and [District]=name  
group by Name,District
----------------6------------------------------
select [dbo].[Country].Name,count(*) as City_Number
from [dbo].[Country] inner join [dbo].[City]
on [dbo].[Country].[Code]=[dbo].[City].CountryCode and [dbo].[Country].Continent='Africa'
group by [dbo].[Country].Name
------------------7----------------------------------------
select [dbo].[Country].Name,count(*) as Not_Language
from [dbo].[Country]inner join[dbo].[CountryLanguage]
on [dbo].[Country].[Code]=[dbo].[CountryLanguage].[CountryCode] and [CountryLanguage].IsOfficial = 0
group by [dbo].[Country].[Name]
-------------------------8----------------------------------------
select [dbo].[Country].Name,count(*) as Not_Language
from [dbo].[Country]inner join[dbo].[CountryLanguage]
on [dbo].[Country].[Code]=[dbo].[CountryLanguage].[CountryCode] and [CountryLanguage].IsOfficial = 1
group by [dbo].[Country].[Name]
having count(1)>=2
-------------------------9-----------------------------------------------
select * from [dbo].[Country]
where [LifeExpectancy]>(select AVG([LifeExpectancy])from [dbo].[Country])

select * from [dbo].[Country]
where [LifeExpectancy]in(select min([LifeExpectancy])from [dbo].[Country])
--------------------------10-----------------------------------------------
select [dbo].[Country].Name,count(*)count_country,[dbo].[Country].Population
from [dbo].[Country]
where [Population]>100000000
group by [dbo].[Country].Name,[dbo].[Country].Population
--------------------------11-----------------------------------------------
select [dbo].[Country].Name,MAX([dbo].[City].Population) as Max_Population
from[dbo].[Country]inner join[dbo].[City]
on[dbo].[Country].[Code]=[dbo].[City].[CountryCode]
group by  [dbo].[Country].Name
--------------------------12------------------------------------------
create table WaterResource
(
    ID int not null identity(1,1),
   CountryCode char(3) ,
	Type varchar(100),
   Name char (40) 
   constraint water_pk primary key  (ID),
   constraint water_fk foreign key   (CountryCode) references Country(Code)

)

-------------------------13-------------------------
insert WaterResource
values('ALB','sea','alcantara')

select * from WaterResource