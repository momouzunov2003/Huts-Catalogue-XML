# Huts Catalogue XML

This project is a catalogue of huts represented in XML format.
The project includes tools to render the XML data into a more readable format.
Due to constraints out of our control, the XML is transformed into PDF via Apache FOP.
We have included a more modern and stylish HTML version of the catalogue.

## Requirements

### Running
- Python 3.x
- Web browser

### Building
- xsltproc (for building the HTML file | transforming the xml)
- wkhtmltopdf (for building the PDF file)
- Apache FOP (supplied in this repo)

## Running the Project

To render the XML data, you need to run `python render.py serve`.
Make sure you have Python installed on your system.

## Building PDF using Apache FOP

This method for building the PDF file is far more troublesome.
Apache FOP doesn't allow DOCTYPE declarations.
This renders the course requirement for presenting the graphics as XML entities impossible.
Therefore the xml needs tobe transformed and the entities be resolved. 
his is done by hardcoding the path to each image in a intermediate XSL transformation file.
This is not a perfect solution but a working one nonetheless.

### Step 1: Transform the original XML file

We need to remove the DOCTYPE declarations and replace the XML entities with the actual image paths.
Also need to remove the `<?xml-stylesheet?>` declaration which points to the original XSLT.
This is done through the intermediate XSL transformation.

```bash
xsltproc -o intermediate-transformation.xsl original.xml --output intermediate.xml
```

### Step 2: Transform the intermediate XML file to a PDF using the Apache FOP XSL file

We now have a XML file that is compatible with Apache FOP.
We can now use the Apache FOP to transform the XML to a PDF file.

```bash
./apache-fop/fop -c './apache-fop/fop.xconf' -xml intermediate.xml -xsl pdf-fop.xsl -pdf output.pdf
```

## Building PDF from HTML file

To render the XML data into a more readable format, you can build an HTML or PDF file.
To build the HTML file, run the following command:

```bash
xsltproc -o huts.html huts.xsl huts.xml 
```

To build the PDF file, run the following command:

```bash
wkhtmltopdf --encoding utf-8 huts.html huts.pdf
```

For pretty HTML file you can use the following command:

```bash
xsltproc huts.xsl huts.xml | tidy -i -xml --indent-spaces 4 -q > huts.html
```

To speed up this process you can use the `render.py` script.
```bash
python render.py render pdf <input file>
```
