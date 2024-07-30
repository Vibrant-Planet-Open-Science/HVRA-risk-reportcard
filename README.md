# SARA-risk-reportcard
Authors:
  - Dr. Sophie Gilbert
  - Dr. Michael Koontz
  - [Dr. Katharyn Duffy](https://orcid.org/0000-0001-6108-7718)
  - Dr. Tyler Hoecker
  - Dr. Joe Shannon

Open code to expose the spatial extent of a Strategic Asset or Resource (SARA) *(also known as a Highly Valuable Resource or Asset (HVRA))* to risk of loss via fire.

This code base executes the following steps:
- Import existing HVRA response functions via a `.csv` file
- Expose those response functions to predicted flame length rasters by fire intensity class
- Calculate the cumulative loss or gain of an HVRA based on a 10-year cumultive burn probability





## Required Packages:

`install.packages('colorRamps')`

`install.packages(aws.s3)` #optional, but required if you are accessing data via s3

`install.packages(dplyr)`

`install.packages(kableExtra)`

`install.packages(colorRamps)`

`install.packages(viridis)`

