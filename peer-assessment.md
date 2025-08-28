---
title: "peer-assessment"
output: html_document
---

## Automate
### Running entire analysis requires rendering one Quarto doc
Meets spec- 
The analysis runs entirely when the Quarto doc is rendered.

### Analysis runs without errors
Meets spec-
No errors occur when running the code and rendering the Quarto doc.

### Analysis produces expected output
Not yet- 
The graph outputs have the correct axes and plot the rolling averages each site really well, including a legend for sample id. However, there needs to be one more graph of average Ca and a total of 5 graphs should be stacked. 

### Data import/cleaning is handled in its own script
Not yet- 
A data-cleaning.R file exists but does not yet have code in it, the majority of data import and cleaning is located in the Quarto doc. 


## Organize
### Raw data is contained in its own folder
Meets spec- 
The raw data (.csv files) is contained within the data folder.

### Intermediate outputs are created and saved to a separate folder from raw data
Not yet-
The intermediate outputs are located and used within the Quarto doc. Some variables are not saved as objects.

### At least one piece of functionality has been refactored into a function in its own file
Meets spec-
The moving-average-function is in a separate .R file and it sourced in the Quarto doc.

## Document
### The repo has a README that explains where to find data, analysis script, supporting code, and outputs
Not yet- 
The README explains where to find the data well and provides access to the raw data. It does not yet explain where to find the analysis script, supporting code, and outputs.

### The README includes a flowchart and text explaining how the analysis works
Not yet-
The README does a good job of introducing the context of the analysis, but does not yet include a flowchart or text explaining how the analysis works.

### The code is appropriately commented
Meets spec-
The comments in the code describe each step in the analysis well, and there is code between lines explaining any additional helpful information. The methods section could have an overarching comment & add which nutrient the rolling mean is being calculated for.

### Variable and function names are descriptive and follow a consistent naming convention
Meets spec- 
Variable and function names are all lowercase with underscores and follow a consistent pattern when doing the same things. 

## Scale
### Running environment initialization script installs all required packages
Not yet-
There might need to be an environment initialization script created to install all of the packages that are loaded in the Quarto doc.

