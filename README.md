# postgis_playground

Messing around with PostGIS

A fun example could be to use https://postgis.net/docs/ST_Intersects.html
and some other commands to find a large convex area that doesn't contain any roads
(and even more fun, but probably very difficult and slow, would be to find the
_largest_ convex area in some US state that doesn't contain any roads).

```bash
docker-compose build --pull
```

```bash
docker-compose -f docker-compose.yml up
```

```bash
docker-compose exec main bash
./insert_shapefiles.sh
psql -U itme playground
SELECT name, statefp FROM states LIMIT 2;
SELECT name, ST_Area(wkb_geometry::geography) as area_m2 FROM states LIMIT 3;
SELECT c.name AS county_name, ST_Area(c.wkb_geometry::geography) as area_m2
FROM counties AS c JOIN states AS s ON ST_Contains(s.wkb_geometry, c.wkb_geometry) WHERE s.name = 'Illinois' LIMIT 3;
```

```bash
docker-compose exec main bash -c "psql -U itme playground"
```
