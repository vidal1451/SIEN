select*from [Detalle Niños]
where UBIGEO='50101'
drop table Red, MicroRed, Establecimiento
select*from MicroRed
select*from Localidad
select*from Establecimiento

SELECT*FROM MicroRed
select UBIGEO FROM [Detalle Niños]
select*from Distrito
alter table [Detalle Niños] add Departamento as Disa
ALTER TABLE [Detalle Niños] drop column Departamento
alter table [Detalle Niños] ADD UBIGEO INT;
alter table [Detalle Niños] ADD IPRESS nvarchar(6);

delete from [Detalle Niños]
where Provincia=''
select*from UBIGEO
select*from IPRESS


update [Detalle Niños] 
set UBIGEO=[Detalle Niños].Provincia+[Detalle Niños].Distrito
******************************************************************************************
 update [Detalle Niños] 
set IPRESS=[Detalle Niños].Red+[Detalle Niños].MicroRed+[Detalle Niños].Establecimiento
 
*/******************************************CREANDO_TABLA_IPRESS*******************************************/
 select e.IdRed+e.IdMicroRed+e.IdEstablecimiento as IPRESS, e.IdRed, r.Descripcion Red, e.IdMicroRed , m.Descripcion MicroRed, e.IdEstablecimiento, e.Descripcion Establecimiento INTO IPRESS from Establecimiento as e inner join Red as r on r.IdRed = e.IdRed
 inner join MicroRed as m on m.IdRed=r.IdRed and e.IdMicroRed = m.IdMicroRed
*/************************************************************************************************************/

