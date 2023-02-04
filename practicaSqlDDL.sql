---PRACTICA SQL BORRAR

create schema flotakeepcoding authorization cjmhonsh;

--CREAR TABLAS
--modelos
create table flotakeepcoding.modelos(
	idmodelo varchar (30) not null, ---PK 
	name varchar (20) not null,
	brand varchar(20) not null --FK 
);


--PK
alter table flotakeepcoding.modelos
add constraint modelos_PK primary key (idmodelo);


--Grupo Organization
create table flotakeepcoding.organizations(
	idorganization varchar (20) not null, ---PK 
	name varchar (100) not null
);






--PK
alter table flotakeepcoding.organizations
add constraint organizations_PK primary key (idorganization);

--Grupo Marcas
create table flotakeepcoding.brands(
	idbrand varchar (20) not null, ---PK 
	name varchar (20) not null,
	organization varchar(20) not null ---FK 
);





--PK
alter table flotakeepcoding.brands
add constraint brands_PK primary key (idbrand);

---FK
alter table flotakeepcoding.brands
add constraint brands_FK foreign key (organization) 
references flotakeepcoding.organizations(idorganization);

--AL haber creado en orden incorrecto las tablas(primero modelos en vez de organizacion que depende de marca que depende de modelos)
--creo aqui el foreign key de modelos

--modleos table FK
alter table flotakeepcoding.modelos
add constraint modelos_FK foreign key (brand) 
references flotakeepcoding.brands(idbrand);

--Aseguradora

create table flotakeepcoding.aseguradoras(
	idaseguradora varchar(20) not null,--PK
	name varchar(100) not null
);

--PK
alter table flotakeepcoding.aseguradoras
add constraint aseguradoras_PK primary key (idaseguradora);

--Activo 

create table flotakeepcoding.activo(
	idactivo varchar(10) not null,--PK
	estado varchar(100) not null
);

--PK
alter table flotakeepcoding.activo
add constraint activo_PK primary key (idactivo);



--VEHICULOS

create table flotakeepcoding.vehiculos(
	idvehiculo varchar(20) not null, --PK 
	modelo varchar(30) not null, --FK 
	color varchar(20) not null, 
	matricula varchar(20) not null,
	km varchar(9) not null,
	aseguradora varchar(100) not null,
	poliza varchar(255) not null,
	fechacompra date not null,
	activo varchar(10) not null
);

--PK
alter table flotakeepcoding.vehiculos
add constraint vehiculos_PK primary key (idvehiculo);

---FK
alter table flotakeepcoding.vehiculos
add constraint vehiculos_FK foreign key (modelo) 
references flotakeepcoding.modelos(idmodelo);


--Monedas
 create table flotakeepcoding.monedas(
	idmoneda varchar(20) not null, --PK
	name varchar(50) not null
);

--PK
alter table flotakeepcoding.monedas
add constraint monedas_PK primary key (idmoneda);

--REVISIONES

create table flotakeepcoding.revisiones(
	idvehiculo varchar(20) not null, --PK and FK 
	idrevision varchar(20) not null, --PK
	fecha date not null,
	km varchar(9) not null,
	importe varchar(50) not null,
	moneda varchar(20) not null --FK	
	
);

--PK
alter table flotakeepcoding.revisiones
add constraint revisiones_PK primary key (idvehiculo, idrevision);



---FK
alter table flotakeepcoding.revisiones 
add constraint revisiones_idvehiculo_FK foreign key (idvehiculo) 
references flotakeepcoding.vehiculos(idvehiculo);

---FK
alter table flotakeepcoding.revisiones 
add constraint revisiones_monedas_FK foreign key (moneda) 
references flotakeepcoding.monedas(idmoneda);


--AÑADIR DATOS


--Organizations
insert into flotakeepcoding.organizations 
values ('Peugeot','Peugeot Société Anonyme');
insert into flotakeepcoding.organizations 
values ('Hyundai','Grupo empresarial Hyundai');

--Marcas
insert into flotakeepcoding.brands  
values ('Opel','Opel', 'Peugeot');
insert into flotakeepcoding.brands  
values ('Peugeot','Peugeot', 'Peugeot');
insert into flotakeepcoding.brands  
values ('Hyundai','Hyundai', 'Hyundai');
insert into flotakeepcoding.brands  
values ('Kia','Kia', 'Hyundai');

--Modelos
insert into flotakeepcoding.modelos  
values ('astra','Astra', 'Opel');
insert into flotakeepcoding.modelos  
values ('corsa','Corsa', 'Opel');
insert into flotakeepcoding.modelos  
values ('508','508', 'Peugeot');
insert into flotakeepcoding.modelos  
values ('308','308', 'Peugeot');
insert into flotakeepcoding.modelos  
values ('sportage','Sportage', 'Kia');
insert into flotakeepcoding.modelos  
values ('stonic','Stonic', 'Kia');
insert into flotakeepcoding.modelos  
values ('tucson','Tucson', 'Hyundai');
insert into flotakeepcoding.modelos  
values ('kona','Kona', 'Hyundai');

--Aseguradoras
insert into flotakeepcoding.aseguradoras  
values ('Mapfre','Mapfre España, S.A.');
insert into flotakeepcoding.aseguradoras  
values ('AXA','AXA SEGUROS GENERALES, S.A.');



--Monedas
insert into flotakeepcoding.monedas 
values ('euro', '€');
insert into flotakeepcoding.monedas  
values ('USA', 'USA$');




--Activo
insert into flotakeepcoding.activo 
values ('si', 'activo');
insert into flotakeepcoding.activo  
values ('no', 'no activo');



--Vehiculos
insert into flotakeepcoding.vehiculos  
values ('1','astra', 'rojo', 'ABC 1234', '150060','AXA','POL123456780' , '2009-12-20', 'no');
insert into flotakeepcoding.vehiculos  
values ('2','corsa', 'Amarillo', 'BCD 2345', '100400','Mapfre','POL123456781' , '2010-01-10', 'no');
insert into flotakeepcoding.vehiculos  
values ('3','508', 'azul', 'CDE 3456', '59605','AXA','POL123456782' , '2008-10-20', 'si');
insert into flotakeepcoding.vehiculos  
values ('4','308', 'negro', 'DEF 4567', '10500','Mapfre','POL123456783' , '2002-11-20', 'si');
insert into flotakeepcoding.vehiculos  
values ('5','sportage', 'blanco', 'EFG 5678', '80506','AXA','POL123456784' , '2017-12-20', 'si');
insert into flotakeepcoding.vehiculos  
values ('6','stonic', 'rojo', 'FGH 6789', '113025','Mapfre','POL123456785' , '2010-05-20', 'no');
insert into flotakeepcoding.vehiculos  
values ('7','tucson', 'azul', 'GHI 7890', '68001','AXA','POL123456786' , '2016-09-20', 'si');
insert into flotakeepcoding.vehiculos  
values ('8','kona', 'azul', 'HIJ 8901', '30258','Mapfre','POL123456787' , '2020-10-20', 'si');
insert into flotakeepcoding.vehiculos  
values ('9','corsa', 'rojo', 'IJK 9012', '81503','AXA','POL123456788' , '2018-12-01', 'si');
insert into flotakeepcoding.vehiculos  
values ('10','stonic', 'blanco', 'JKL 0123', '20548','Mapfre','POL123456789' , '2020-12-20', 'si');

--Revisiones:  pongo que la revision se hara cada 50K km mas o menos

insert into flotakeepcoding.revisiones  
--(idvehiculo, idrevision, fecha, km, importe, moneda)
values ('1','1', '2015-10-20', '48680', '500','euro');
insert into flotakeepcoding.revisiones  
(idvehiculo, idrevision, fecha, km, importe, moneda)
values ('1','2', '2019-08-20', '103508', '750','euro');
insert into flotakeepcoding.revisiones  
(idvehiculo, idrevision, fecha, km, importe, moneda)
values ('1','3', '2022-11-20', '148036', '1500','euro');
insert into flotakeepcoding.revisiones  
(idvehiculo, idrevision, fecha, km, importe, moneda)
values ('2','4', '2013-10-20', '29050', '500','euro');
insert into flotakeepcoding.revisiones  
(idvehiculo, idrevision, fecha, km, importe, moneda)
values ('2','5', '2019-08-20', '90501', '750','euro');
insert into flotakeepcoding.revisiones  
(idvehiculo, idrevision, fecha, km, importe, moneda)
values ('3','6', '2018-10-05', '51036', '500','euro');
insert into flotakeepcoding.revisiones  
(idvehiculo, idrevision, fecha, km, importe, moneda)
values ('5','7', '2021-10-20', '60580', '500','euro');
insert into flotakeepcoding.revisiones  
(idvehiculo, idrevision, fecha, km, importe, moneda)
values ('6','8', '2014-10-20', '51089', '500','euro');
insert into flotakeepcoding.revisiones  
(idvehiculo, idrevision, fecha, km, importe, moneda)
values ('6','9', '2019-02-20', '90003', '750','euro');
insert into flotakeepcoding.revisiones  
(idvehiculo, idrevision, fecha, km, importe, moneda)
values ('7','1', '2020-11-10', '49056', '500','euro');
insert into flotakeepcoding.revisiones  
(idvehiculo, idrevision, fecha, km, importe, moneda)
values ('9','1', '2022-12-10', '70659', '500','euro');




	
















