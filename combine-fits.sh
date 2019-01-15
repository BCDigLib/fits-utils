workflowdocs="/Users/walkerpb/Documents/scripts/aip-mac-bash-fits-master/aip-workflowdocs/"
fitsoutput="/Volumes/digital-library/current-projects/Anansi-Stories-d2/aips/aip-title/fits-output"

echo ""
echo "Combining FITS files..."
echo ""

# combine files into a single file and remove the XML declarations
for file in $fitsoutput/*_fits.xml; do cat $file | egrep -v "xml version" >> $fitsoutput/body.xml; done

# add single XML declaration and opening and closing wrapper tags
cat $workflowdocs/open.xml $fitsoutput/body.xml $workflowdocs/close.xml > $fitsoutput/combined-fits.xml
rm $fitsoutput/body.xml
