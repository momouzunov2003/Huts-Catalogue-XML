<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
        <head>
            <link rel="stylesheet" type="text/css" href="hutsStyle.css"/>
        </head>
            <body>
                <xsl:for-each select="catalog/huts/hut">
                    <div>
                        <h2 class="heading">
                            <xsl:value-of select="name"/>
                        </h2>
                        <xsl:variable name="imageSource" select="unparsed-entity-uri(thumbnail/@source)" />
                        <img class="thumbnail" src="{$imageSource}"/>
                        <ul class="main-list">
                            <li><p><b>Описание:</b><xsl:text> </xsl:text> <xsl:value-of select="description"/></p></li>
                            <li><p><b>Планина:</b><xsl:text> </xsl:text> <xsl:value-of select="./location/mountain"/></p></li>
                            <li><p><b>Адрес:</b><xsl:text> </xsl:text>
                            <xsl:choose>
                                <xsl:when test="string-length(location/address) > 0">
                                    <xsl:value-of select="./location/address"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>N/A</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                            </p></li>
                            <li><p><b>Координати:</b><xsl:text> </xsl:text> <xsl:value-of select="./location/coordinates/latitude"/> с.ш., <xsl:text> </xsl:text><xsl:value-of select="./location/coordinates/longitude"/> и.д.</p></li>
                            <li><p><b>Надморска височина:</b><xsl:text> </xsl:text> <xsl:value-of select="./location/altitude"/> м.</p></li>
                            <li><p><b>Контакти:</b></p></li>
                            <ul class="secondary-list">
                                <li><p><b>Телефон:</b><xsl:text> </xsl:text>
                                <ul class="tertiary-list">
                                <xsl:choose>
                                    <xsl:when test="count(contacts/phone) > 0">
                                        <xsl:for-each select="contacts/phone">                            
                                            <li><xsl:value-of select="."/></li>
                                        </xsl:for-each>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <li><xsl:text>N/A</xsl:text></li>
                                    </xsl:otherwise>
                                </xsl:choose>
                                </ul></p>
                                </li>
                                <li><p><b>E-mail:</b><xsl:text> </xsl:text>
                                <ul class="tertiary-list">
                                <xsl:choose>
                                    <xsl:when test="count(contacts/email) > 0">
                                        <xsl:for-each select="contacts/email">                            
                                            <li><xsl:value-of select="."/></li>
                                        </xsl:for-each>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <li><xsl:text>N/A</xsl:text></li>
                                    </xsl:otherwise>
                                </xsl:choose>
                                </ul></p>
                                </li>
                                <li><p><b>Сайт:</b><xsl:text> </xsl:text>
                                <ul class="tertiary-list">
                                <xsl:choose>
                                    <xsl:when test="count(contacts/url) > 0">
                                        <xsl:for-each select="contacts/url">
                                            <xsl:variable name="link" select="." />                        
                                            <li><a href="{$link}" target="_blank">Линк към сайта</a></li>
                                        </xsl:for-each>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <li><xsl:text>N/A</xsl:text></li>
                                    </xsl:otherwise>
                                </xsl:choose>
                                </ul></p></li>
                            </ul>
                            <li><p><b>Капацитет:</b><xsl:text> </xsl:text> <xsl:value-of select="capacity"/></p></li>
                            <li><p><b>Екстри:</b></p><xsl:text> </xsl:text>
                            <table border="1">
                                <tr>
                                    <th>Име</th>
                                    <th>Състояние</th>
                                </tr>
                            <xsl:for-each select="amenities/@*">    
                            <tr>   
                                <xsl:choose>
                                    <xsl:when test="name() = 'water'"><td>Вода</td></xsl:when>
                                    <xsl:when test="name() = 'electricity'"><td>Електричество</td></xsl:when>
                                    <xsl:when test="name() = 'heating'"><td>Отопление</td></xsl:when>
                                    <xsl:when test="name() = 'bathroom'"><td>Тоалетна</td></xsl:when>
                                    <xsl:when test="name() = 'shower'"><td>Баня</td></xsl:when>
                                    <xsl:when test="name() = 'canteen'"><td>Столова</td></xsl:when>
                                    <xsl:when test="name() = 'restaurant'"><td>Ресторант</td></xsl:when>
                                    <xsl:when test="name() = 'internet'"><td>Интернет</td></xsl:when>
                                    <xsl:when test="name() = 'shop'"><td>Магазин</td></xsl:when>
                                </xsl:choose>                     
                                <xsl:choose>
                                    <xsl:when test=". = 'yes'">
                                        <td>Да</td>
                                    </xsl:when>
                                    <xsl:when test=". = 'no'">
                                        <td>Не</td>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <td>Няма информация</td>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </tr>
                            </xsl:for-each>
                            </table></li>
                            <li><p><b>Изходни пунктове:</b></p><xsl:text> </xsl:text>
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
                            </table></li>
                            <li><p><b>Съседни обекти:</b></p><xsl:text> </xsl:text>
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
                            </table></li>
                            <li><p><b>Галерия:</b><br/><br/>
                            <table class="gallery">
                            <xsl:for-each select="gallery/image">                       
                                <tr><td><img src="{unparsed-entity-uri(@source)}"/></td></tr>
                            </xsl:for-each>
                            </table></p></li>
                        </ul>
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>