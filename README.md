# postgis_playground

Messing around with PostGIS

A fun example could be to use https://postgis.net/docs/ST_Intersects.html
and some other commands to find a large convex area that doesn't contain any roads
(and even more fun, but probably very difficult and slow, would be to find the
_largest_ convex area in some US state that doesn't contain any roads).

TODO Add script that downloads necessary shapefiles from https://www2.census.gov/geo/tiger/TIGER2022/

```bash
docker-compose build --pull
```

```bash
docker-compose -f docker-compose.yml up
```

```bash
docker-compose exec main bash
./insert_states.sh
psql -U itme playground
SELECT name, statefp FROM states LIMIT 2;
SELECT name, ST_Area(wkb_geometry::geography) as area_m2 FROM states LIMIT 3;
```

```bash
docker-compose exec main bash -c "psql -U itme playground"
```
