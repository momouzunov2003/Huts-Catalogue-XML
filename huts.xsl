<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Template to match the root element -->
    <xsl:template match="/">
        <html>
            <body>
                <xsl:for-each select="catalog/huts/hut">
                    <div>
                        <h2>
                            <xsl:value-of select="name"/>
                        </h2>
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>