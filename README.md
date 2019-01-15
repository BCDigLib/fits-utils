# fits-utils

Includes code related to technical metadata extraction workflows.

## combine-fits.sh

Concatenates several FITS XML files into one master FITS XML file. Based on some 
code from the University of Georgia's [AIP generation workflow](https://github.com/uga-libraries/aip-mac-bash-fits).

Usage:
1. Clone the repository: ```git clone https://github.com/BCDigLib/fits-utils.git```
2. Edit the value of the `fitsdir` variable to point to the FITS files to be combined
3. Run the script: ```fits-utils/combine-fits.sh```
4. Verify that the combined-fits.xml file was created without errors