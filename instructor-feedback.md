# Exceeds Spec

## The code is appropriately commented

The code is adequately commented and allows for reproducibility by showing step by step how the analysis and construction of the graph were completed. The comments are informative but do not over jumble the code. The comments were also formatted with ARTofR where appropriate.

## At least one piece of functionality has been refactored into a function in its own file.

The moving average function is in its own script in the R folder. Roxygen was included to explain its use and parameters. Data cleaning, 9 week average calculations, and ggplotting also all have their own scripts.

# Collaboration

In reviewing Leela's repository I opened issues for specs that were not yet met. I created an environment initialization r script in her project to contribute.

1.  Self assessment: Analysis not producing expected results issue resolution. <https://github.com/sofiiir/eds214-chemistry-of-stream-water-loquillo-mountains/issues/5>

2.  Peer assessment: Outputs folder not storing intermediate results issue resolution. <https://github.com/sofiiir/eds214-chemistry-of-stream-water-loquillo-mountains/issues/16>

3.  Self assessment: Task to exceed in commenting spec issue resolution. <https://github.com/sofiiir/eds214-chemistry-of-stream-water-loquillo-mountains/issues/11>

Merge conflict resolution <https://github.com/sofiiir/eds214-chemistry-of-stream-water-loquillo-mountains/commit/a11c14437d705b346561debc75d073f218d4c482>

# Instructor feedback

## Automate

[M] **Running the entire analysis requires rendering one Quarto document**

[M] The analysis runs without errors

[M] **The analysis produces the expected output**

[M] **Data import/cleaning is handled in its own script(s)**

## Organize

[M] Raw data is contained in its own folder

[M] Intermediate outputs are created and saved to a separate folder from raw data

[E] **At least one piece of functionality has been refactored into a function in its own file**

## Document

[M] The repo has a README that explains where to find (1) data, (2) analysis script, (3) supporting code, and (4) outputs

[M] **The README includes a flowchart and text explaining how the analysis works**

[E] **The code is appropriately commented**

[M] **Variable and function names are descriptive and follow a consistent naming convention**

## Scale

After cloning the repo on Workbench:

[M] Running the environment initialization script installs all required packages

[M] The analysis script runs without errors

## Collaborate

[M] **The student has provided attentive, constructive feedback in a peer review**

[M] **The student has contributed to a peer's repo by opening an issue and creating a pull request**

[M] The repo has at least three closed GitHub issues

[M] The commit history includes at least one merged branch and a resolved merge conflict

[M] The rendered analysis is accessible via GitHub Pages
