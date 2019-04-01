select*from [Detalle Ni�os]
where UBIGEO='50101'
drop table Red, MicroRed, Establecimiento
select*from MicroRed
select*from Localidad
select*from Establecimiento

SELECT*FROM MicroRed
select UBIGEO FROM [Detalle Ni�os]
select*from Distrito
alter table [Detalle Ni�os] add Departamento as Disa
ALTER TABLE [Detalle Ni�os] drop column Departamento
alter table [Detalle Ni�os] ADD UBIGEO INT;
alter table [Detalle Ni�os] ADD IPRESS nvarchar(6);

delete from [Detalle Ni�os]
where Provincia=''
select*from UBIGEO
select*from IPRESS


update [Detalle Ni�os] 
set UBIGEO=[Detalle Ni�os].Provincia+[Detalle Ni�os].Distrito
******************************************************************************************
 update [Detalle Ni�os] 
set IPRESS=[Detalle Ni�os].Red+[Detalle Ni�os].MicroRed+[Detalle Ni�os].Establecimiento
 
*/******************************************CREANDO_TABLA_IPRESS*******************************************/
 select e.IdRed+e.IdMicroRed+e.IdEstablecimiento as IPRESS, e.IdRed, r.Descripcion Red, e.IdMicroRed , m.Descripcion MicroRed, e.IdEstablecimiento, e.Descripcion Establecimiento INTO IPRESS from Establecimiento as e inner join Red as r on r.IdRed = e.IdRed
 inner join MicroRed as m on m.IdRed=r.IdRed and e.IdMicroRed = m.IdMicroRed
*/************************************************************************************************************/

