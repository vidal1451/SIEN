select*from [Detalle Niños]
select*from IPRESS
select*from Altura
select*from #ControlNiños
alter table Distrito add IdProv  nvarchar(4)
select*from Provincia
update Distrito
set IdProv = Distrito.IdDpto+Distrito.IdProvincia
alter table Provincia add IdProv nvarchar(4)
select*from UBIGEO
select*from #ControlN
select*from #Control

/***************************NiÑOS CON SOLO ESE RANGO DE HEMOGLONINA*************************/*
select* into #ControlN from (select i.Red, i.MicroRed, i.Establecimiento, u.Distrito, Fecha,
nDNI, Edad, Hemoglobina, Altitud from [Detalle Niños] as d inner join IPRESS AS i on  i.IPRESS = d.IPRESS 
inner join UBIGEO as u on d.UBIGEO = u.ID_UBIGEO
where Altitud between 500 and 5000)D
where Hemoglobina between 4 and 18.5

/***************************AJUSTANDO_HBC_ALTITUD********************/*
select Red, MicroRed, Establecimiento, Distrito, Fecha, c.nDNI, Edad, c.Hemoglobina, c.Altitud, c.Hemoglobina-a.Ajuste as HBC 
into #Control from #ControlN as c, Altura as a 
where c.Altitud between a.Altura_min and a.Altura_max

************************************************
select Red, MicroRed, Establecimiento, Distrito, Fecha, DATENAME(month, Fecha ) as Mes, nDNI, Edad, Hemoglobina, Altitud, HBC, Anemia from #Control
where Edad between 6.0 and 59.99
order by Mes asc

select Fecha, MicroRed, Establecimiento, nDni, HBC, Contar = Row_number() over(partition by nDni order by Fecha asc) FROM #Control
where Edad between 6.0 and 59.99


************************************************
select*from (select Mes, HBC, MicroRed, Establecimiento, Distrito, nDni from #Control) s
pivot (max(HBC) for [Mes] in ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12])) p

**************************************************
Select DATENAME(month, Fecha ) AS nMes, nDni, HBC from #Control

******************************************************
************ULTIMA REVISION*****************
SELECT MAX(Fecha) AS ultimoRegistro, nDNI INTO #CD from #Control
group by nDNI

SELECT * FROM
(
select	MicroRed, Establecimiento, Distrito, Fecha, nDni, HBC, Anemia, Contar = Row_number() over(partition by nDni order by Fecha desc)
from #Control)X
WHERE contar=1


************************************************
ALTER TABLE #Control
ADD Anemia AS
CASE
  WHEN HBC< 10.5 THEN '1'
  ELSE '0'
END

************************************************
delete from #Control 
where nDNI = '--------'

************************************************
************************************************
alter table #Control add Mes as month(Fecha)

**************************************************  
