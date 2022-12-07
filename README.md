# postgis_playground

Messing around with PostGIS

Goal: use https://postgis.net/docs/ST_Intersects.html
and some other commands to find a large convex area that doesn't contain any roads
(and even more fun, but probably very difficult and slow, would be to find the
_largest_ convex area in some US state or county that doesn't contain any roads).

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
SELECT name, statefp, ST_Area(wkb_geometry::geography) as area_m2 FROM states LIMIT 3;
```

```bash
SELECT c.name AS county_name, ST_Area(c.wkb_geometry::geography) as area_m2
FROM counties AS c JOIN states AS s ON ST_Contains(s.wkb_geometry, c.wkb_geometry) WHERE s.name = 'Illinois' LIMIT 3;
```

```bash
SELECT (ST_Dump(ST_GeneratePoints(wkb_geometry, 5))).geom as point_geom FROM counties AS c WHERE c.geoid = '06027';
```

```bash
SELECT ST_AsGeoJSON(ST_Buffer((ST_Dump(ST_GeneratePoints(wkb_geometry, 5))).geom::geography, 500)) as point_geom FROM counties AS c WHERE c.geoid = '06027';
```

With a little help from https://gis.stackexchange.com/questions/4502/selecting-features-that-do-not-intersect-in-postgis:

```bash
\o /opt/main/convex_areas_without_roads.geojson
\t on

SELECT ST_AsGeoJSON(p.buffered_geom) as road_fid FROM (SELECT ST_Buffer((ST_Dump(ST_GeneratePoints(wkb_geometry, 100))).geom::geography, 4000) as buffered_geom FROM counties AS c WHERE c.geoid = '06027') AS p LEFT JOIN roads as r ON ST_Intersects(p.buffered_geom::geography, r.wkb_geometry::geography) WHERE r.ogc_fid IS NULL;
```

# TODO Query planner, spatial index for ST_Intersects
# TODO Combine geojson lines back into single geojson?

```bash
docker-compose exec main bash -c "psql -U itme playground"
```
