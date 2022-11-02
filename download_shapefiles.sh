#!/bin/bash

wget -nc https://www2.census.gov/geo/tiger/TIGER2022/COUNTY/tl_2022_us_county.zip
wget -nc https://www2.census.gov/geo/tiger/TIGER2022/STATE/tl_2022_us_state.zip

unzip -n tl_2022_us_county.zip -d tl_2022_us_county
unzip -n tl_2022_us_state.zip -d tl_2022_us_state
