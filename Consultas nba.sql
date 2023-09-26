/*Posicion candao a */
SELECT COUNT(jugador) from estadisticas where Asistencias_por_partido =(SELECT   MAX(Asistencias_por_partido) from estadisticas);

/* Clave candado a*/
SELECT SUM(peso) from jugadores
 join equipos on jugadores.Nombre_equipo = equipos.Nombre 
 where  Conferencia= 'east' and Posicion like '%c%';
 
 SELECT SUM(Peso) AS Clave_Candado_A
FROM jugadores
WHERE Nombre_equipo IN (SELECT Nombre FROM equipos WHERE Conferencia = 'East')
AND (Posicion = 'C' OR Posicion LIKE '%C%');

/*Posicion candado b */
SELECT COUNT(jugador) from estadisticas 
where Asistencias_por_partido>
(SELECT COUNT(Nombre) from jugadores where Nombre_equipo='Heat');

/* Clave candado b*/
SELECT COUNT(*) from partidos where temporada LIKE '%99%';

/* posicion candado c*/
SELECT (COUNT(*) )/ (SELECT COUNT(*) from jugadores where peso >= 195) + 0.9945 
As 'Posicion' from jugadores join equipos 
 on jugadores.Nombre_equipo= equipos.Nombre 
where procedencia = 'Michigan' and Conferencia= 'East' ;

/*Clave candado c*/
SELECT floor( AVG(puntos_por_partido)+COUNT(Asistencias_por_partido) +SUM(Tapones_por_partido)  )as 'Clave'
from estadisticas join jugadores on estadisticas.jugador=jugadores.codigo join equipos on jugadores.Nombre_equipo= equipos.Nombre 
where Division= 'Central';

/* Posicion candado d*/
SELECT round(tapones_por_partido) 
from estadisticas join jugadores on estadisticas.jugador=jugadores.codigo 
where jugadores.Nombre ='Corey Maggette' and estadisticas.temporada = '00/01';

/* Clave candado d*/
SELECT floor( SUM(puntos_por_partido )) 
from estadisticas join jugadores on jugador = codigo 
where Procedencia = 'argentina';
