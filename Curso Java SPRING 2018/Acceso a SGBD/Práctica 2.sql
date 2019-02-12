#1
INSERT INTO empleados (numero, nombre, puesto, jefe, fechaalta, salario, comision, dnumero)
VALUES (9000, 'Ale', 'Director', 8039, '2008-04-28', 1500, null, 40);

#2
INSERT INTO empleados (numero, nombre, puesto, jefe, fechaalta, salario, dnumero)
VALUES (9001, 'Antonio', 'Consultor', 9000, '2008-04-28', 1000, 40);

#3 Dará error debido a que ya existe un departamento con clave 30
INSERT INTO departamentos
VALUES(30, 'nuevo', 'Ronda');

#4
INSERT INTO departamentos
SELECT 50, d.nombre, 'Salamanca'
FROM departamentos d
WHERE d.numero = 30;

#1
UPDATE empleados
SET comision = 100
WHERE dnumero = (SELECT numero
FROM departamentos
WHERE nombre = 'Contabilidad');

UPDATE empleados
JOIN departamentos
ON departamentos.numero = empleados.dnumero
AND departamentos.nombre = 'Contabilidad'
SET comision = 100;

UPDATE empleados
JOIN departamentos d
ON d.numero = empleados.dnumero
AND d.nombre = 'Ventas'
SET comision = comision +
(comision * 0.02 * TIMESTAMPDIFF(YEAR, NOW(), fechaAlta));

DELETE FROM empleados
WHERE dnumero = 40
AND puesto = 'Director';

DELETE FROM departamentos WHERE numero = 40;