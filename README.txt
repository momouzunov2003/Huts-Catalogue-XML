# Huts Catalogue XML

This project is a catalogue of huts represented in XML format. The project includes tools to render the XML data into a more readable format.

## Requirements

### Running
- Python 3.x
- Web browser

### Building
- xsltproc (for building the HTML file)
- wkhtmltopdf (for building the PDF file)

## Running the Project

To render the XML data, you need to run the `render.py` script. Make sure you have Python installed on your system.

## Building

To render the XML data into a more readable format, you can build an HTML or PDF file. To build the HTML file, run the following command:

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