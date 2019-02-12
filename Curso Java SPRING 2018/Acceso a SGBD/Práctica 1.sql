SELECT * FROM departamentos;


SELECT nombre, puesto, salario
FROM empleados
ORDER BY nombre DESC;

SELECT COUNT(nombre) FROM empleados;

SELECT COUNT(DISTINCT(puesto)) FROM empleados;

SELECT SUM(salario) FROM empleados;


SELECT DISTINCT puesto FROM empleados;

SELECT puesto FROM empleados GROUP BY puesto;

SELECT COUNT(puestosdistintos.puesto) FROM
(SELECT puesto
FROM empleados
GROUP BY puesto) AS puestosdistintos;


SELECT * FROM empleados WHERE nombre LIKE '%z';


SELECT * FROM empleados
WHERE (salario > 2000) AND (salario < 4000);

SELECT * FROM empleados
WHERE (salario BETWEEN 2000 AND 4000); #Menor o igual y mayor o igual


SELECT nombre FROM empleados
WHERE YEAR(fechaAlta) = 1981;

SELECT nombre FROM empleados
WHERE fechaAlta BETWEEN '1981-01-01' AND '1981-12-31';

SELECT nombre FROM empleados
WHERE fechaAlta > '1981-01-01' AND fechaAlta <= '1981-12-31';

SELECT nombre FROM empleados
WHERE fechaAlta LIKE '1981%';


SELECT salario, ceil(salario * 1.10) AS sueldazo
FROM empleados;


SELECT empleados.nombre, departamentos.nombre
FROM empleados
LEFT JOIN departamentos ON departamentos.numero = empleados.dnumero
WHERE empleados.comision IS NULL;


SELECT e.*, d.*
FROM empleados e, departamentos d
WHERE e.dnumero = d.numero;

SELECT empleados.*, departamentos.*
FROM empleados
INNER JOIN departamentos ON empleados.dnumero = departamentos.numero;


SELECT empleados.nombre AS empleado, departamentos.nombre AS departamento
FROM empleados, departamentos
WHERE empleados.dnumero = departamentos.numero
AND departamentos.nombre <> 'Ventas';


SELECT empleados.nombre, jefes.nombre AS jefe
FROM empleados, empleados jefes
WHERE jefes.numero = empleados.jefe;

SELECT empleados.nombre, jefes.nombre AS jefe
FROM empleados
LEFT JOIN empleados jefes
ON jefes.numero = empleados.jefe;

SELECT empleados.nombre, TIMESTAMPDIFF(MONTH, NOW(), fechaAlta) FROM empleados
INNER JOIN departamentos ON empleados.dnumero = departamentos.numero
WHERE departamentos.ciudad = 'Sevilla';


SELECT DATEDIFF(NOW(), fechaAlta)/30 FROM empleados;

SELECT EXTRACT(YEAR_MONTH FROM NOW());

SELECT empleados.nombre,
PERIOD_DIFF(EXTRACT(YEAR_MONTH FROM NOW()), EXTRACT(YEAR_MONTH FROM fechaAlta)) AS meses
FROM empleados
INNER JOIN departamentos ON empleados.dnumero = departamentos.numero
WHERE departamentos.ciudad = 'Sevilla';


SELECT nombre, puesto, 'Sin comisión'
FROM empleados
WHERE comision IS NULL
UNION
SELECT nombre, puesto, CONCAT('Con comisión: ', comision) AS comision
FROM empleados
WHERE NOT(comision IS NULL);

SELECT IF(comision IS NULL, 'Sin comisión', CONCAT('Con comisión: ', comision))
FROM empleados;

SELECT CASE
WHEN comision IS NULL THEN 'Sin comisión'
WHEN comision IS NOT NULL THEN CONCAT('Con comisión: ', comision)
END
FROM empleados;


SELECT nombre, puesto, IFNULL(CONCAT('Con comisión: ', comision), 'Sin comisión') AS comisión
FROM empleados;



SELECT nombre, salario FROM empleados
ORDER BY salario
LIMIT 5;

SELECT tabla.nombre, tabla.salario
FROM (SELECT nombre, salario FROM empleados
ORDER BY salario
LIMIT 5) AS tabla
ORDER BY tabla.salario DESC;

SELECT departamentos.nombre, AVG(empleados.salario) AS MediaSalario
FROM empleados
INNER JOIN departamentos
ON departamentos.numero = empleados.dnumero
GROUP BY departamentos.numero;


SELECT departamentos.nombre, AVG(empleados.salario) AS MediaSalario
FROM empleados
INNER JOIN departamentos
ON departamentos.numero = empleados.dnumero
WHERE departamentos.nombre IN ('Ventas', 'Contabilidad')
GROUP BY departamentos.numero;

SELECT departamentos.nombre, AVG(empleados.salario) AS MediaSalario
FROM empleados
INNER JOIN departamentos
ON departamentos.numero = empleados.dnumero
WHERE departamentos.nombre = 'Ventas' OR departamentos.nombre = 'Contabilidad'
GROUP BY departamentos.numero;


SELECT departamentos.nombre
FROM empleados
INNER JOIN departamentos
ON departamentos.numero = empleados.dnumero
GROUP BY departamentos.numero
HAVING COUNT(empleados.numero) > 2;


SELECT empleados.nombre
FROM empleados
INNER JOIN
(SELECT MAX(salario) AS sal, dnumero AS num
FROM empleados
GROUP BY dnumero) AS tabla
ON empleados.salario = tabla.sal
AND empleados.dnumero = tabla.num;

SELECT empleados.nombre
FROM empleados,
(SELECT MAX(salario) AS sal, dnumero AS num
FROM empleados
GROUP BY dnumero) AS tabla
WHERE empleados.salario = tabla.sal
AND empleados.dnumero = tabla.num;
