CREATE TABLE objects ( name VARCHAR PRIMARY KEY, geom geometry);

INSERT INTO obiekts VALUES('obiekt1',ST_GeomFromText('COMPOUNDCURVE(LINESTRING(0 1,1 1),CIRCULARSTRING(1 1,2 0,3 1), CIRCULARSTRING(3 1,4 2,5 1), LINESTRING(5 1,6 1))',0));
INSERT INTO obiekts VALUES('obiekt2',ST_GeomFromText('MULTICURVE(CIRCULARSTRING(11 2,13 2,11 2),COMPOUNDCURVE(LINESTRING(10 6,14 6),CIRCULARSTRING(14 6,16 4,14 2),CIRCULARSTRING(14 2,12 0, 10 2), LINESTRING(10 2,10 6)))',0));
INSERT INTO objects VALUES ('obiekt3', ST_MakePolygon('LINESTRING(7 15,12 13, 10 17,7 15)'));

INSERT INTO objects VALUES ('obiekt4', ST_LineFromMultiPoint('MULTIPOINT(20 20, 25 25, 27 24, 25 22, 26 21, 22 19, 20.5 19.5)'));

INSERT INTO objects VALUES ('obiekt5', ST_COLLECT('POINT(30 30 59)', 'POINT(38 32 234)'));

INSERT INTO objects VALUES ('obiekt6', ST_COLLECT('LINESTRING(1 1, 3 2)', 'POINT(4 2)'));


SELECT ST_AREA(ST_BUFFER(ST_ShortestLine(ob3.geom, ob4.geom),5))
FROM objects ob3, objects ob4
WHERE ob3.name='obiekt3' AND ob4.name='obiekt4'


SELECT ST_AsText(ST_MakePolygon(ST_AddPoint(geom, ST_StartPoint(geom))))
FROM objects WHERE name='obiekt4';


INSERT INTO objects SELECT 'obiekt7', ST_COLLECT(ob3.geom, ob4.geom)
FROM objects ob3, objects ob4
WHERE ob3.name='obiekt3' AND ob4.name='obiekt4';


SELECT SUM(ST_AREA(ST_BUFFER(geom,5))) FROM objects WHERE ST_HASARC(geom)=false ;
