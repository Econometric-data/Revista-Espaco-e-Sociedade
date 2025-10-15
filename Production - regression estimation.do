// Clear existing data and memory
clear all

// Set working directory to current path (assuming the Excel file is here)
cd "."

// Import data from Excel
import excel "Database for regression.xlsx", sheet("Base de dados") firstrow

// Create logarithmic transformations of variables
gen lProduction = ln(Production)
gen lProductivity = ln(Productivity)
gen lOccupiedPeople = ln(OccupiedPeople)
gen lTotalTillage = ln(TotalTillage)
gen lAnnualInvestment = ln(AnnualInvestment)
gen lCapitalStock = ln(CapitalStock)
gen lPlantedPastages = ln(PlantedPastages)
gen lNaturalPastages = ln(NaturalPastages)
gen lTotalPastages = ln(TotalPastages)
gen lPIA = ln(PIA)

// Set panel data structure
xtset Codigo Ano, delta(5)

// Create lagged differences
gen Productionlag = Production - Production[_n-1]
gen OccupiedPeoplelag = OccupiedPeople - OccupiedPeople[_n-1]
gen TotalTillagelag = TotalTillage - TotalTillage[_n-1]

// Create logarithmic transformations of lagged variables
gen lProductionlag = ln(Productionlag)
gen lOccupiedPeoplelag = ln(OccupiedPeoplelag)
gen lTotalTillagelag = ln(TotalTillagelag)
gen lTFP = ln(TFP)

//drop variables 
drop if NORDESTEMATOGROSSENSE == 1
drop if SUDESTEMATOGROSSENSE == 1
drop NORDESTEMATOGROSSENSE
drop SUDESTEMATOGROSSENSE

* --- Command Block for Estimation and Export ---

* Model 1 (First Stage): Random-Effects Regression
xtreg lTotalTillage lTFP lPIA lAnnualInvestment lCapitalStock NORTEMATOGROSSENSE SUDOESTEMATOGROSSENSE year1980 year1985 year1995 year2006, re vce(robust)
estimates store first_stage
esttab first_stage using first_stage.rtf, replace se ///
       star(* 0.10 ** 0.05 *** 0.01) ///
       title("First stage") ///
       label nogaps

* Model 2 (Second Stage): Random-Effects Instrumental Variables
xtivreg lProduction (lTotalTillage = lTFP lPIA lAnnualInvestment lCapitalStock NORTEMATOGROSSENSE SUDOESTEMATOGROSSENSE year1980 year1985 year1995 year2006), re vce(robust)
estimates store second_stage
esttab second_stage using second_stage.rtf, replace se ///
       star(* 0.10 ** 0.05 *** 0.01) ///
       title("Second stage") ///
       label nogaps
