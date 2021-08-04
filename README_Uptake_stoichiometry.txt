This DATSETNAMEreadme.txt file was generated on 2021-08-03 by Nathan Tomczyk


GENERAL INFORMATION

1. Title of Dataset: Net Nutrient Uptake Stoichiometry

2. Author Information
	A. Principal Investigator Contact Information
		Name: Nathan Tomczyk
		Institution: University of Georgia
		Address: 140 E Green St. Athens GA, USA, 30602
		Email: nathan.tomczyk25@uga.edu

	B. Associate or Co-investigator Contact Information
		Name: Amy Rosemond
		Institution: University of Georgia
		Address: 140 E Green St. Athens GA, USA, 30602
		Email: rosemond@uga.edu

	C. Alternate Contact Information
		Name: 
		Institution: 
		Address: 
		Email: 

3. Date of data collection (single date, range, approximate date) <suggested format YYYY-MM-DD>: 2011-07-25 through 2013-07-22

4. Geographic location of data collection <latitude, longiute, or city/region, State, Country, as appropriate>: United States, North Carolina, Macon County, United States Department of Agriculture/ US Forest Service Southern Research Station Coweeta Hydrologic Laboratory

5. Information about funding sources that supported the collection of the data: 
This work was funded by the U.S. National Science Foundation: DEB-0918894 to A.D. Rosemond and J.C. Maerz, DEB-0918904 to J.P. Benstead and DEB-0919054 to V. Gulis and the Coweeta Long Term Ecological Research site (NSF award DEB-0823293


SHARING/ACCESS INFORMATION

1. Licenses/restrictions placed on the data: MIT license

2. Links to publications that cite or use the data: forthcoming... 

3. Links to other publicly accessible locations of the data: 

4. Links/relationships to ancillary data sets: 

5. Was data derived from another source? yes/no
	A. If yes, list source(s): no

6. Recommended citation for this dataset: 


DATA & FILE OVERVIEW

1. File List: 
all.noon.pump.information_clean.csv
conc_nutrient_in_barrels_every_day_clean.csv
all_snax_nutrient_clean.csv
drip_rate_measurements.csv
nutrients_above_0m_clean.csv
snax3_wetted_widths.csv
full_algae_data.csv
wood_wetted_widths.csv
wood_diamaters.csv
leaf_litter_standing_stocks.csv
wood_fungal_biomass.csv
leaf_fungal_biomass2.csv
N.uptake.status.csv
P_uptake_status.csv
Final_uptake_estiamtes.csv
standarized_model_data.csv
unstandardized_model_data.csv

Uptake_stoichiometry_estimates_figures_2021.Rmd
stoichiometry_uptake_model_selection.Rmd
formatting_uptake_regression_data.Rmd

2. Relationship between files, if important: 

3. Additional related data collected that was not included in the current data package: 

4. Are there multiple versions of the dataset? yes/no
	A. If yes, name of file(s) that was updated: 
		i. Why was the file updated? 
		ii. When was the file updated? 


METHODOLOGICAL INFORMATION

1. Description of methods used for collection/generation of data: 
see associated publication for information on methods of data collection

2. Methods for processing the data: 
R markdown files provide detailed data processing protocols.

3. Instrument- or software-specific information needed to interpret the data: 
The origional analyses of these data was completed using R version 3.6.2

4. Standards and calibration information, if appropriate: 

5. Environmental/experimental conditions: 
This was conducting in five headwater streams that were enriched with inorganic nitrogen and phosphorus for two consecutive years.

6. Describe any quality-assurance procedures performed on the data: 


7. People involved with sample collection, processing, analysis and/or submission: 
 Construction of infrastructure was completed with help from Rob Case, Daniel Hutcheson, and Kevin Simpson from YSI Integrated Systems and Services. Ammonium nitrate was provided by The Andersons, Inc. We would also like to thank Jason Coombs, Katie Norris, Christian Barrett, Phillip Bumpers, John Davis, Hannah Dolan, Kaitlin Farrell, Tom Maddox, Chelsea Norman, and James Wood for help with field and laboratory work. This manuscript was improved with comments from Phillip Bumpers, Carolyn Cummins, Laura Naslund, and Caitlin Conn. 

DATA-SPECIFIC INFORMATION FOR: all.noon.pump.information.csv

1. Number of variables: 6

2. Number of cases/rows: 3735

3. Variable List: 
date.time - date and time in YYYY-MM-DD HH:MM format
stream - stream identification (WS06, WS07, WS08, WS09, WS10)
PAR_umol_s_m2_Avg - the photosynthecially active radiation recorded by the data logger in units of umol s-1 m-2 averaged over the previous 15 minutes
WaterDep - depth of water in m recoded by the pressure transducer
average.water.etmp - average water temperature in degrees C over the previous 15 minutes
number.of.strokes - the number of strokes taken by the nutrient dosing pump in the previous 15 minutes


4. Missing data codes: 
no missing data
5. Specialized formats or other abbreviations used: 
NA

DATA-SPECIFIC INFORMATION FOR: conc_nutrient_in_barrels_every_day_clean.csv

1. Number of variables: 4

2. Number of cases/rows: 3760

3. Variable List: 
date- date  in YYYY-MM-DD format
stream - stream identification (WS06, WS07, WS08, WS09, WS10)
conc.DIN.in.barrel - concentration of dissolved inorganic nitrogen (din) in barrell that nutrinet solution was pumped out of. Units are mg/mL
conc.srp.in.barrel- concentration of soluable reactive phosphorus (srp) in barrell that nutrinet solution was pumped out of. Units are mg/mL


4. Missing data codes: 
no missing data
5. Specialized formats or other abbreviations used: 
NA

DATA-SPECIFIC INFORMATION FOR: all_snax_nutrient_clean.csv

1. Number of variables: 9

2. Number of cases/rows: 930

3. Variable List: 
Date- date  in YYYY-MM-DD format
Stream - stream identification (WS06, WS07, WS08, WS09, WS10)
Meter - the location along the stream channel where the nutrient sample was taken. 0 is the top of the reach and 70 is the bottom
NP - the target molar N:P ratio of the nutrient enrichment 
NO3-N the concentration of nitrate ions in ug of nitrogen/L
NH4-N the concentration of ammonium ions in ug of nitrogen/L
DIN the conentration of dissolved inorganic nitrogen (NH4-N+NO3-N) in ug of nitrogen/L 
PO4-P the ceoncentration of phosphate, or soluable reactive phosphorus in units of ug phosphorus/L

4. Missing data codes: 
empty cells indicate missing data

5. Specialized formats or other abbreviations used: 
NA

DATA-SPECIFIC INFORMATION FOR: drip_rate_measurements.csv

1. Number of variables: 3

2. Number of cases/rows: 270

3. Variable List: 
date- date  in YYYY-MM-DD format
stream - stream identification (WS06, WS07, WS08, WS09, WS10)
flow.rate.ml.stroke - the volume of water (ml) moved by the nutrient addition pumps per stroke of the pump

4. Missing data codes: 
no missing data

5. Specialized formats or other abbreviations used: 
NA

DATA-SPECIFIC INFORMATION FOR: nutrients_above_0m_clean.csv

1. Number of variables: 6

2. Number of cases/rows: 279

3. Variable List: 
date- date  in YYYY-MM-DD format
stream - stream identification (WS06, WS07, WS08, WS09, WS10)
SRP (ug/L) concentration of soluable reactive phosphorus (SRP) in units of ug phosphorus/L
NO3-N (ug/L) the concentration of nitrate ions in ug of nitrogen/L
NH4-N (ug/L) the concentration of ammonium ions in ug of nitrogen/L
DIN (ug/L) the conentration of dissolved inorganic nitrogen (NH4-N+NO3-N) in ug of nitrogen/L 

4. Missing data codes: 
blank cells are missing data
5. Specialized formats or other abbreviations used: 
NA

DATA-SPECIFIC INFORMATION FOR: snax3_wetted_widths.csv

1. Number of variables: 5

2. Number of cases/rows: 125

3. Variable List: 
date- date  in YYYY-MM-DD format
stream - stream identification (WS06, WS07, WS08, WS09, WS10)
month.year - date in YY-MM format
month - month of year in MM formate
wetted.width.m - width across the stream channel in meters 

4. Missing data codes: 
no missing data
5. Specialized formats or other abbreviations used: 
NA

DATA-SPECIFIC INFORMATION FOR: full_algae_data.csv

1. Number of variables: 3

2. Number of cases/rows: 670

3. Variable List: 
date- date  in YYYY-MM-DD format
stream - stream identification (WS06, WS07, WS08, WS09, WS10)
chla.mg.m2 - the concentration of chlorophyll-a in samples, units are mg chlorophyll-a m-2

4. Missing data codes: 
no missing data
5. Specialized formats or other abbreviations used: 
NA

DATA-SPECIFIC INFORMATION FOR: wood_wetted_width.csv

1. Number of variables: 3

2. Number of cases/rows: 75

3. Variable List: 
stream - stream identification (WS06, WS07, WS08, WS09, WS10)
meter - the location in the stream the measurement was taken, 0m is the top of the experimental reach and 70m is the bottom
Wetted width (m) - the width of the stream in meters

4. Missing data codes: 
no missing data

5. Specialized formats or other abbreviations used: 
NA

DATA-SPECIFIC INFORMATION FOR: wood_diamaters.csv

1. Number of variables: 3

2. Number of cases/rows: 1114

3. Variable List: 
stream - stream identification (WS06, WS07, WS08, WS09, WS10)
meter - the location in the stream the measurement was taken, 0m is the top of the experimental reach and 70m is the bottom
diameters (cm) - diamaters of all sticks measured on a given transect in cm

4. Missing data codes: 
no missing data

5. Specialized formats or other abbreviations used: 
NA

DATA-SPECIFIC INFORMATION FOR: leaf_litter_standing_stocks

1. Number of variables: 4

2. Number of cases/rows: 1338

3. Variable List: 
stream - stream identification (WS06, WS07, WS08, WS09, WS10)
meter - the location in the stream the measurement was taken, 0m is the top of the experimental reach and 70m is the bottom
date- date  in YYYY-MM-DD format
llss.afdm (g/m2) - the leaf litter standing stocks (llss) quantified based on the ash free dry mass on a meter squared basis.

4. Missing data codes: 
blank cells indicate missing data

5. Specialized formats or other abbreviations used: 
NA

DATA-SPECIFIC INFORMATION FOR: wood_fungal_biomass.csv

1. Number of variables: 3

2. Number of cases/rows: 280

3. Variable List: 
stream - stream identification (WS06, WS07, WS08, WS09, WS10)
date- date  in YYYY-MM-DD format
Fungal biomass.mg.g.afdm - the mass of fungal biomass in mg per grams of ash free dry mass (of wood). Fungi were measured small sticks with a diamater of 0.5cm

4. Missing data codes: 
blank cells indicate missing data

5. Specialized formats or other abbreviations used: 
NA

DATA-SPECIFIC INFORMATION FOR: leaf_fungal_biomass2.csv

1. Number of variables: 3

2. Number of cases/rows: 280

3. Variable List: 
stream - stream identification (WS06, WS07, WS08, WS09, WS10)
date- date  in YYYY-MM-DD format
Fungal biomass.mg/g afdm - the mass of fungal biomass in mg per grams of ash free dry mass (of leafs)

4. Missing data codes: 
missing cells indicate missing data
5. Specialized formats or other abbreviations used: 
NA



DATA-SPECIFIC INFORMATION FOR: N.uptake.status.csv

1. Number of variables: 8

2. Number of cases/rows: 168

3. Variable List: 
NP - target molar N:P enrichment of experimental streams, used to identify streams
date- date  in YYYY-MM-DD format
n.uptake.ug.m2.sec.2.5% - the 2.5 percentile from estiamtes of the net uptake rate for a given stream and date
n.uptake.ug.m2.sec.50% - the 50 percentile from estiamtes of the net uptake rate for a given stream and date
n.uptake.ug.m2.sec.97.5% - the 97.5 percentile from estiamtes of the net uptake rate for a given stream and date
n.status - determination of whether there was net uptake, release, or if a stream was balanced on a given date
binary - a binary version of uptake status -1=relase, 1=uptake, 0=balanced
nutrinet - which nutrient the uptake measurements refer to (DIN=dissolved inorganic nitrogen)

4. Missing data codes: 
missing cells indicate missing data
5. Specialized formats or other abbreviations used: 
NA

DATA-SPECIFIC INFORMATION FOR: P_uptake_status.csv

1. Number of variables: 8

2. Number of cases/rows: 176

3. Variable List: 
NP - target molar N:P enrichment of experimental streams, used to identify streams
date- date  in YYYY-MM-DD format
p.uptake.ug.m2.sec.2.5% - the 2.5 percentile from estiamtes of the net uptake rate for a given stream and date
p.uptake.ug.m2.sec.50% - the 50 percentile from estiamtes of the net uptake rate for a given stream and date
p.uptake.ug.m2.sec.97.5% - the 97.5 percentile from estiamtes of the net uptake rate for a given stream and date
p.status - determination of whether there was net uptake, release, or if a stream was balanced on a given date
binary - a binary version of uptake status -0.9=relase, 1.1=uptake, 0.1=balanced (offset from DIN for plotting)
nutrinet - which nutrient the uptake measurements refer to (SRP=soluable reactive phosphorus)

4. Missing data codes: 
missing cells indicate missing data
5. Specialized formats or other abbreviations used: 
NA

DATA-SPECIFIC INFORMATION FOR: Final_uptake_esatimes.csv

1. Number of variables: 29

2. Number of cases/rows: 218000

3. Variable List: 
stream - stream identification (WS06, WS07, WS08, WS09, WS10)
date- date  in YYYY-MM-DD format
NP - target molar N:P enrichment of experimental streams, used to identify streams
Meter - the location in the stream the measurement was taken, 0m is the top of the experimental reach and 70m is the bottom
PO4.P - the  concentration of soluable reactive phosphorus (SRP) in units of ug phosphorus/L
NO3.N - the concentration of nitrate ions in ug of nitrogen/L
NH4.N - the concentration of ammonium ions in ug of nitrogen/L
DIN - the conentration of dissolved inorganic nitrogen (NH4-N+NO3-N) in ug of nitrogen/L 
background.DIN - the concentration of DIN above the enrichment (ug/l)
background.SRP - the concentration of SRP above the enrichment (ug/l)
conc.DIN.in.barrel - concentration of dissolved inorganic nitrogen (din) in barrell that nutrinet solution was pumped out of. Units are mg/mL
conc.srp.in.barrel- concentration of soluable reactive phosphorus (srp) in barrell that nutrinet solution was pumped out of. Units are mg/mL
flow.rate.ml.stroke - the volume of water (ml) moved by the nutrient addition pumps per stroke of the pump
PAR_umol_s_m2_Avg - the photosynthecially active radiation recorded by the data logger in units of umol s-1 m-2 averaged over the previous 15 minutes
WaterDep - depth of water in m recoded by the pressure transducer
average.water.etmp - average water temperature in degrees C over the previous 15 minutes
number.of.strokes - the number of strokes taken by the nutrient dosing pump in the previous 15 minutes
stream.width - width across the stream channel in meters 
corrected.flow - the discharge of the stream in L/s
input.rate.srp - the concentration of nutrients added to the stream by the doesing system in units of ug P/L stream water
input.rate.din - the concentration of nutrients added to the stream by the doesing system in units of ug N/L stream water
conservative_DIN - the concentration of DIN (ug DIN/L) in the stream if no uptake were occuring, this is equal to the background concentraiton plus the added nutrients
conservative_SRP - the concentration of SRP (ug SRP/L) in the stream if no uptake were occuring, this is equal to the background concentraiton plus the added nutrients
interation - the iteration of the bootstrapping... I know it is spelled wrong.
p.uptake.ug.m2.sec - the uptake rate of SRP in the units of ug P per meter squared per second
n.uptake.ug.m2.sec - the uptake rate of DIN in the units of ug N per meter squared per second
n.uptake.uM.m2.sec - the uptake rate of DIN in the units of uM N per meter squared per second
p.uptake.uM.m2.sec - the uptake rate of SRP in the units of uM P per meter squared per second


4. Missing data codes: 
NA
5. Specialized formats or other abbreviations used: 
NA

DATA-SPECIFIC INFORMATION FOR: standardized_model_data.csv

1. Number of variables: 12

2. Number of cases/rows: 218000

3. Variable List: 
stream - stream identification (WS06, WS07, WS08, WS09, WS10)
date- date  in YYYY-MM-DD format
meter - the location in the stream the measurement was taken, 0m is the top of the experimental reach and 70m is the bottom
iteration - the iteration of the bootstrapping
p.uptake - Yeo-Johnson transformed uptake rates of SRP
n.uptake - Yeo-Johnson transformed uptake rates of DIN
fungi - log transformed and centered (value minus mean and divided by standard deviation) for areal total fungal biomass associated with both leaves and wood
chla - log transformed and centered (value minus mean and divided by standard deviation) for areal total fungal biomass associated with both leaves and wood
corrected.flow - log transformed and centered (value minus mean and divided by standard deviation) for areal chlorophyll-a (index of algal biomass)
temp - log transformed and centered (value minus mean and divided by standard deviation) for stream temperature
light - log transformed and centered (value minus mean and divided by standard deviation) for light levels above the stream
added.NP - log transformed and centered (value minus mean and divided by standard deviation) for added N:P ratio

4. Missing data codes: 
NA
5. Specialized formats or other abbreviations used: 
NA


DATA-SPECIFIC INFORMATION FOR: unstandardized_model_data.csv

1. Number of variables: 10

2. Number of cases/rows: 218000

3. Variable List: 
stream - stream identification (WS06, WS07, WS08, WS09, WS10)
date- date  in YYYY-MM-DD format
NP - target molar N:P enrichment of experimental streams, used to identify streams
conservative_DIN - the concentration of DIN (ug DIN/L) in the stream if no uptake were occuring, this is equal to the background concentraiton plus the added nutrients
conservative_SRP - the concentration of SRP (ug SRP/L) in the stream if no uptake were occuring, this is equal to the background concentraiton plus the added nutrients
interation - the iteration of the bootstrapping... I know it is spelled wrong.
p.uptake.ug.m2.sec - the uptake rate of SRP in the units of ug P per meter squared per second
n.uptake.ug.m2.sec - the uptake rate of DIN in the units of ug N per meter squared per second
n.uptake.uM.m2.sec - the uptake rate of DIN in the units of uM N per meter squared per second
p.uptake.uM.m2.sec - the uptake rate of SRP in the units of uM P per meter squared per second


4. Missing data codes: 
NA
5. Specialized formats or other abbreviations used: 
NA
