# Self Assessment

## Automate

#### Running the entire analysis requires rendering one Quarto document

Meets spec. All required code is in one quarto doc and accesses information from different folders adeuqately.

#### The analysis runs without errors

Meets spec. The analysis runs without errors.

#### The analysis produces the expected output

Not yet. The analysis only produces two separate plots for two of the five categories of nutrients but these should be patchworked to create one final plot.

#### Data import/cleaning is handled in its own script(s)

Not yet. Data import and cleaning is currently being handled within the project quarto doc. I will make a separate quarto doc to house data importing and cleaning.

## Organize

#### Raw data is contained in its own folder

Meets spec. Raw data is housed within its own folder data.

#### Intermediate outputs are created and saved to a separate folder from raw data

Not yet. The data frames that are compiled after joining and cleaning the data are not saved anywhere yet.

#### At least one piece of functionality has been refactored into a function in its own file

Meets spec. The moving average function is saved in its own script. This is one of the specs I plan to exceed by having a roxygen skeleton containing all pertinent information to successfully run the anlysis. I will also ensure the comments is informative to exceed this expectation.

## Document

#### The repo has a README that explains where to find (1) data, (2) analysis script, (3) supporting code, and (4) outputs

Not yet. My README contains all of these individual aspects but needs to be flushed out.

#### The README includes a flowchart and text explaining how the analysis works

Not yet. No flow chart is present in my README and a more thorough explanation of how the analysis was completed needs to be added.

#### The code is appropriately commented

Meets spec. Code is appropriately commented. I plan to exceed this spec by ensuring that the comments thoughtfully provide the information of what is being completed in each code chunk.

#### Variable and function names are descriptive and follow a consistent naming convention

Meets spec. Names for variables and functions are consistent and indicate what they are signifying.

## Scale

#### Running the environment initialization script installs all required packages

Not yet. All packages are downloaded on my local computer but a separate script will be added to meet this spec when running on workbench.

#### The analysis script runs without errors

Not yet. The analysis will not run on workbench yet without adequately fulfilling the above spec.
