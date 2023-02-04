---COMANDO SQL PARA LA PRÁCTICA MÓDULO SQL

SELECT organizations.name, brands.name, vehiculos.modelo, vehiculos.color, vehiculos.matricula, vehiculos.km, vehiculos.aseguradora, vehiculos.poliza, vehiculos.fechacompra
FROM flotakeepcoding.vehiculos
join flotakeepcoding.modelos on vehiculos.modelo = modelos.idmodelo
JOIN flotakeepcoding.brands ON modelos.brand = brands.idbrand
JOIN flotakeepcoding.organizations ON brands.organization = organizations.idorganization
WHERE vehiculos.activo = 'si'
group  BY vehiculos.modelo, brands.name, organizations.name, vehiculos.color, vehiculos.matricula, vehiculos.km, vehiculos.aseguradora, vehiculos.poliza, vehiculos.fechacompra;