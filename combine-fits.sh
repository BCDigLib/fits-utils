# path to directory containing FITS files (this will also be the output dir)
fitsdir=""

# xml declaration to be prepended to output file
xmldesc="<?xml version=\"1.0\" encoding=\"utf-8\"?>"

# root element opening tag for output file
rootopen="<combined-fits xmlns=\"http://hul.harvard.edu/ois/xml/ns/fits/fits_output\">"

# root element closing tag for output file
rootclose="</combined-fits>"

echo "Combining FITS files..."

# combine files into a single file and remove the XML declarations
for file in $fitsdir/*fits.xml; do
  echo "Processing $file"
  cat $file | egrep -v "xml version" >> $fitsdir/body.xml
done

# add combined FITS to output file, along with single XML declaration and opening and closing wrapper tags
echo $xmldesc >> $fitsdir/combined-fits.xml
echo $rootopen >> $fitsdir/combined-fits.xml
cat $fitsdir/body.xml >> $fitsdir/combined-fits.xml
echo $rootclose >> $fitsdir/combined-fits.xml

# delete working file
rm $fitsdir/body.xml

echo "Done!"