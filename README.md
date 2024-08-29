# Valued resource exposure to fire hazard report 

This open repository contains code to quantify the wildfire risk exposure of valued resources. Wildfire risk to valued resources is quantified as the susceptibility of a valued resource (represented by a "response function" describing the normalzied change in resource value when exposed to one of six fire intensity classes) to fire hazard (the product of burn probability and fire intensity). This framework follows [GTR-315: A Wildfire Risk Assessment Framework
for Land and Resource Management](https://www.fs.usda.gov/rm/pubs/rmrs_gtr315.pdf), and modifications developed by [Vibrant Planet](https://www.vibrantplanet.net/science) 

![Components of fire risk](https://drive.google.com/uc?export=view&id=1YYSM_wYOntjX6PxAt2S3ipNgJ8X0jV_B)


## There are two components to this repository: 
- `demo-code` contains an R script that renders an RMarkdown notebook reporting risk to the resource. 
- `demo-data` contains geospatial files representing an AOI and the extent of a valued resource, and a CSV representing the resource's response function (RF).

The codebase executes the following steps:
- Import existing valued resource response functions via a CSV file
- Expose those response functions to predicted flame length rasters by fire intensity class
- Estimate the cumulative change in resource value based on a 10-year cumulative burn probability

This repository is a worked example for a single resource (Northern Goshawk) and WCS landscape (Central Washington Initiative). Replace the `demo-data` with a geospatial file representing your area of interest, a geospatial file representing the extent of the valued resource of interest, and a CSV file representing the resource's respons to six fire intensity classes. The RF CSV must exactly follow this minimal format:

+-----------------+---------+
| intensity_class | rf_value| 
+=================+=========+
| 1               | -0.221  | 
| 2               | -0.221  | 
| 3               | -0.224  | 
| 4               | -0.225  | 
| 5               | -0.254  | 
| 6               | -0.503  | 
+-----------------+---------+

This repository was developed by scientists at Vibrant Planet and Pyrologix: Sophie Gilbert, Michael Koontz, [Katharyn Duffy](https://orcid.org/0000-0001-6108-7718), Joe Shannon, and Tyler Hoecker.


## Dependencies:

`install.packages(c("colorRamps", "dplyr", "kableExtra", "colorRamps", "viridis"))`
`install.packages(aws.s3)` #optional, but required if you are accessing data via s3
