CREATE EXTENSION postgis;

CREATE TABLE tableB AS 
SELECT ST_Intersection(popp.geom, ST_Buffer(majrivers.geom, 100000.0)) AS budynki100 FROM popp , majrivers
WHERE popp.f_codedesc='Building'; 


CREATE TABLE aiportsNew AS 
SELECT elev,name,geom FROM airports;

SELECT name, ST_AsText(geom), ST_X(geom) AS zachod FROM airportsNew
ORDER BY zachod LIMIT 1;
SELECT name, ST_AsText(geom), ST_X(geom) AS wschod FROM airportsNew
ORDER BY wschod DESC LIMIT 1;

INSERT INTO airportsNew VALUES ('airportB',
				(SELECT ST_Centroid (ST_Union(
				(SELECT geom FROM airportsNew WHERE st_y(geom) IN (SELECT MIN(st_y(geom)) FROM airportsNew)),
				(SELECT geom FROM airportsNew WHERE st_y(geom) IN (SELECT MAX(st_y(geom)) FROM airportsNew))))), 100);
								
SELECT ST_area(ST_buffer(ST_ShortestLine(lakes.geom, lakes.geom)), 1000) FROM lakes, airports 
		WHERE lakes LIKE 'Iliamna Lake' AND airports.name = 'AMBLER'
		
