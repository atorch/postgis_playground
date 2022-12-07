#!/bin/bash

wget -nc https://www2.census.gov/geo/tiger/TIGER2022/COUNTY/tl_2022_us_county.zip
wget -nc https://www2.census.gov/geo/tiger/TIGER2022/STATE/tl_2022_us_state.zip
wget -nc https://www2.census.gov/geo/tiger/TIGER2022/ROADS/tl_2022_06107_roads.zip
wget -nc https://www2.census.gov/geo/tiger/TIGER2022/ROADS/tl_2022_06027_roads.zip

unzip -n tl_2022_us_county.zip -d tl_2022_us_county
unzip -n tl_2022_us_state.zip -d tl_2022_us_state
unzip -n tl_2022_06107_roads.zip -d tl_2022_06107_roads
unzip -n tl_2022_06027_roads.zip -d tl_2022_06027_roads
