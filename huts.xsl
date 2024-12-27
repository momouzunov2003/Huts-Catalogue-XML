<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <body>
                <xsl:for-each select="catalog/huts/hut">
                    <div>
                        <h2>
                            <xsl:value-of select="name"/>
                        </h2>
                        <xsl:variable name="imageSource" select="unparsed-entity-uri(thumbnail/@source)" />
                        <img src="{$imageSource}"/>
                        <p><u>Описание:</u><xsl:text> </xsl:text> <xsl:value-of select="description"/></p>
                        <p><u>Планина:</u><xsl:text> </xsl:text> <xsl:value-of select="./location/mountain"/></p>
                        <p><u>Адрес:</u><xsl:text> </xsl:text>
                        <xsl:choose>
                            <xsl:when test="string-length(location/address) > 0">
                                <xsl:value-of select="./location/address"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>N/A</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                        </p>
                        <p><u>Координати:</u><xsl:text> </xsl:text> <xsl:value-of select="./location/coordinates/latitude"/> с.ш., <xsl:text> </xsl:text><xsl:value-of select="./location/coordinates/longitude"/> и.д.</p>
                        <p><u>Надморска височина:</u><xsl:text> </xsl:text> <xsl:value-of select="./location/altitude"/> м.</p>
                        <u>Контакти:</u><br/>
                        <u>Телефон:</u><xsl:text> </xsl:text>
                        <xsl:choose>
                            <xsl:when test="count(contacts/phone) > 0">
                                <xsl:for-each select="contacts/phone">                            
                                    <xsl:value-of select="."/>
                                    <xsl:if test="position() != last()">
                                        <xsl:text>, </xsl:text>
                                    </xsl:if>
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>N/A</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                        <br/>
                        <u>E-mail:</u><xsl:text> </xsl:text>
                        <xsl:choose>
                            <xsl:when test="count(contacts/email) > 0">
                                <xsl:for-each select="contacts/email">                            
                                    <xsl:value-of select="."/>
                                    <xsl:if test="position() != last()">
                                        <xsl:text>, </xsl:text>
                                    </xsl:if>
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>N/A</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                        <br/>
                        <u>Сайт:</u><xsl:text> </xsl:text>
                        <xsl:choose>
                            <xsl:when test="count(contacts/url) > 0">
                                <xsl:for-each select="contacts/url">                            
                                    <xsl:value-of select="."/>
                                    <xsl:if test="position() != last()">
                                        <xsl:text>, </xsl:text>
                                    </xsl:if>
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>N/A</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                        <p><u>Капацитет:</u><xsl:text> </xsl:text> <xsl:value-of select="capacity"/></p>
                        <u>Екстри:</u><xsl:text> </xsl:text>
                        <table border="1">
                            <tr>
                                <th>Име</th>
                                <th>Състояние</th>
                            </tr>
                        <xsl:for-each select="amenities/@*">    
                        <tr>                        
                            <td><xsl:value-of select="name()"/></td>
                            <td><xsl:value-of select="."/></td>
                        </tr>
                        </xsl:for-each>
                        </table><br/><br/>
                        <u>Изходни пунктове:</u><xsl:text> </xsl:text>
                        <table border="1">
                            <tr>
                                <th>Име</th>
                                <th>Разстояние(часове/км)</th>
                            </tr>
                        <xsl:for-each select="exit_routes/route">  
                        <tr>                          
                            <td><xsl:value-of select="route_name"/></td>
                            <td><xsl:value-of select="distance"/></td>
                        </tr>
                        </xsl:for-each>
                        </table><br/>
                        <u>Съседни обекти:</u><xsl:text> </xsl:text>
                        <table border="1">
                            <tr>
                                <th>Име</th>
                                <th>Разстояние(часове/км)</th>
                            </tr>
                        <xsl:for-each select="nearby_sites/site">  
                        <tr>                          
                            <td><xsl:value-of select="site_name"/></td>
                            <td><xsl:value-of select="distance"/></td>
                        </tr>
                        </xsl:for-each>
                        </table><br/>
                        <u>Галерия:</u><xsl:text> </xsl:text><br/><br/>
                        <table border="1">
                        <xsl:for-each select="gallery/image">                       
                            <tr><td><img src="{unparsed-entity-uri(@source)}"/></td></tr>
                        </xsl:for-each>
                        </table>
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>