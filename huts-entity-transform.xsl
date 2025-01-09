<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes" encoding="UTF-8" />

    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>

    <xsl:template match="processing-instruction('xml-stylesheet')"/>

    <xsl:template match="thumbnail/@source | image/@source">
        <xsl:attribute name="source">
            <xsl:choose>
                <xsl:when test=". = 'hija-pirin-thumbnail'">resources/hija-pirin-thumbnail.jpg</xsl:when>
                <xsl:when test=". = 'hija-pirin-1'">resources/hija-pirin-1.jpg</xsl:when>
                <xsl:when test=". = 'hija-pirin-2'">resources/hija-pirin-2.jpg</xsl:when>
                <xsl:when test=". = 'hija-pirin-3'">resources/hija-pirin-3.jpg</xsl:when>
                <xsl:when test=". = 'hija-levski-thumbnail'">resources/hija-levski-thumbnail.jpg</xsl:when>
                <xsl:when test=". = 'hija-levski-1'">resources/hija-levski-1.jpg</xsl:when>
                <xsl:when test=". = 'hija-levski-2'">resources/hija-levski-2.jpg</xsl:when>
                <xsl:when test=". = 'hija-levski-3'">resources/hija-levski-3.jpg</xsl:when>
                <xsl:when test=". = 'hija-svejen-thumbnail'">resources/hija-svejen-thumbnail.jpg</xsl:when>
                <xsl:when test=". = 'hija-svejen-1'">resources/hija-svejen-1.jpg</xsl:when>
                <xsl:when test=". = 'hija-svejen-2'">resources/hija-svejen-2.jpg</xsl:when>
                <xsl:when test=". = 'hija-svejen-3'">resources/hija-svejen-3.jpg</xsl:when>
                <xsl:when test=". = 'hija-orfei-thumbnail'">resources/hija-orfei-thumbnail.jpg</xsl:when>
                <xsl:when test=". = 'hija-orfei-1'">resources/hija-orfei-1.jpg</xsl:when>
                <xsl:when test=". = 'hija-grunchar-thumbnail'">resources/hija-grunchar-thumbnail.jpg</xsl:when>
                <xsl:when test=". = 'hija-grunchar-1'">resources/hija-grunchar-1.jpg</xsl:when>
                <xsl:when test=". = 'hija-grunchar-2'">resources/hija-grunchar-2.jpg</xsl:when>
                <xsl:when test=". = 'hija-grunchar-3'">resources/hija-grunchar-3.jpg</xsl:when>
                <xsl:when test=". = 'hija-momchil-unak-thumbnail'">resources/hija-momchil-unak-thumbnail.jpg</xsl:when>
                <xsl:when test=". = 'hija-momchil-unak-1'">resources/hija-momchil-unak-1.jpg</xsl:when>
                <xsl:when test=". = 'hija-momchil-unak-2'">resources/hija-momchil-unak-2.jpg</xsl:when>
                <xsl:when test=". = 'hija-momchil-unak-3'">resources/hija-momchil-unak-3.jpg</xsl:when>
                <xsl:when test=". = 'hija-momchil-unak-4'">resources/hija-momchil-unak-4.jpg</xsl:when>
                <xsl:when test=". = 'hija-zavrachica-thumbnail'">resources/hija-zavrachica-thumbnail.jpg</xsl:when>
                <xsl:when test=". = 'hija-zavrachica-1'">resources/hija-zavrachica-1.jpg</xsl:when>
                <xsl:when test=". = 'hija-zavrachica-2'">resources/hija-zavrachica-2.jpg</xsl:when>
                <xsl:when test=". = 'hija-zavrachica-3'">resources/hija-zavrachica-3.jpg</xsl:when>
                <xsl:when test=". = 'hija-yana-thumbnail'">resources/hija-yana-thumbnail.jpg</xsl:when>
                <xsl:when test=". = 'hija-yana-1'">resources/hija-yana-1.jpg</xsl:when>
                <xsl:when test=". = 'hija-yana-2'">resources/hija-yana-2.jpg</xsl:when>
                <xsl:when test=". = 'hija-yana-3'">resources/hija-yana-3.jpg</xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="." />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:template>
</xsl:stylesheet>
