<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4" page-height="29.7cm" page-width="21cm" margin="2cm">
                    <fo:region-body/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="A4">
                <fo:flow flow-name="xsl-region-body">
                    <xsl:for-each select="catalog/huts/hut">
                        <fo:block font-family="Arial" page-break-after="always">
                            <fo:block font-size="14pt" font-weight="bold" space-after="10pt">
                                <xsl:value-of select="name"/>
                            </fo:block>
                            <fo:block>
                                <fo:external-graphic src="../{thumbnail/@source}" content-height="scale-to-fit"  content-width="10cm" scaling="non-uniform"/>
                            </fo:block>
                            <fo:block space-after="10pt">
                                <fo:inline font-weight="bold">Описание: </fo:inline>
                                <xsl:value-of select="description"/>
                            </fo:block>
                            <fo:block>
                                <fo:inline font-weight="bold">Планина: </fo:inline>
                                <xsl:value-of select="./location/mountain"/>
                            </fo:block>
                            <fo:block>
                                <fo:inline font-weight="bold">Адрес: </fo:inline>
                                <xsl:choose>
                                    <xsl:when test="string-length(location/address) > 0">
                                        <xsl:value-of select="./location/address"/>
                                    </xsl:when>
                                    <xsl:otherwise>N/A</xsl:otherwise>
                                </xsl:choose>
                            </fo:block>
                            <fo:block>
                                <fo:inline font-weight="bold">Координати: </fo:inline>
                                <xsl:value-of select="./location/coordinates/latitude"/> с.ш., <xsl:value-of select="./location/coordinates/longitude"/> и.д.
                            </fo:block>
                            <fo:block>
                                <fo:inline font-weight="bold">Надморска височина: </fo:inline>
                                <xsl:value-of select="./location/altitude"/> м.
                            </fo:block>
                            <fo:block>
                                <fo:inline font-weight="bold">Контакти: </fo:inline>
                                <xsl:for-each select="contacts/phone">
                                    <fo:block>Телефон: <xsl:value-of select="."/></fo:block>
                                </xsl:for-each>
                                <xsl:for-each select="contacts/email">
                                    <fo:block>E-mail: <xsl:value-of select="."/></fo:block>
                                </xsl:for-each>
                                <xsl:for-each select="contacts/url">
                                    <fo:block>Сайт: <fo:basic-link external-destination="{.}">Линк към сайта</fo:basic-link></fo:block>
                                </xsl:for-each>
                            </fo:block>
                            <fo:block>
                                <fo:inline font-weight="bold">Капацитет: </fo:inline>
                                <xsl:value-of select="capacity"/>
                            </fo:block>
                            <fo:block>
                                <fo:inline font-weight="bold">Екстри: </fo:inline>
                                <fo:table border="1pt solid black" table-layout="fixed">
                                    <fo:table-body>
                                        <xsl:for-each select="amenities/@*">
                                            <fo:table-row>
                                                <fo:table-cell>
                                                    <fo:block>
                                                        <xsl:choose>
                                                            <xsl:when test="name() = 'water'">Вода</xsl:when>
                                                            <xsl:when test="name() = 'electricity'">Електричество</xsl:when>
                                                            <xsl:when test="name() = 'heating'">Отопление</xsl:when>
                                                            <xsl:when test="name() = 'bathroom'">Тоалетна</xsl:when>
                                                            <xsl:when test="name() = 'shower'">Баня</xsl:when>
                                                            <xsl:when test="name() = 'canteen'">Столова</xsl:when>
                                                            <xsl:when test="name() = 'restaurant'">Ресторант</xsl:when>
                                                            <xsl:when test="name() = 'internet'">Интернет</xsl:when>
                                                            <xsl:when test="name() = 'shop'">Магазин</xsl:when>
                                                        </xsl:choose>
                                                    </fo:block>
                                                </fo:table-cell>
                                                <fo:table-cell>
                                                    <fo:block>
                                                        <xsl:choose>
                                                            <xsl:when test=". = 'yes'">Да</xsl:when>
                                                            <xsl:when test=". = 'no'">Не</xsl:when>
                                                            <xsl:otherwise>Няма информация</xsl:otherwise>
                                                        </xsl:choose>
                                                    </fo:block>
                                                </fo:table-cell>
                                            </fo:table-row>
                                        </xsl:for-each>
                                    </fo:table-body>
                                </fo:table>
                            </fo:block>
                            <fo:block>
                                <fo:inline font-weight="bold">Изходни пунктове: </fo:inline>
                                <fo:table border="1pt solid black" table-layout="fixed">
                                    <fo:table-body>
                                        <xsl:for-each select="exit_routes/route">
                                            <fo:table-row>
                                                <fo:table-cell>
                                                    <fo:block><xsl:value-of select="route_name"/></fo:block>
                                                </fo:table-cell>
                                                <fo:table-cell>
                                                    <fo:block><xsl:value-of select="distance"/></fo:block>
                                                </fo:table-cell>
                                            </fo:table-row>
                                        </xsl:for-each>
                                    </fo:table-body>
                                </fo:table>
                            </fo:block>
                            <fo:block>
                                <fo:inline font-weight="bold">Съседни обекти: </fo:inline>
                                <fo:table border="1pt solid black" table-layout="fixed">
                                    <fo:table-body>
                                        <xsl:for-each select="nearby_sites/site">
                                            <fo:table-row>
                                                <fo:table-cell>
                                                    <fo:block><xsl:value-of select="site_name"/></fo:block>
                                                </fo:table-cell>
                                                <fo:table-cell>
                                                    <fo:block><xsl:value-of select="distance"/></fo:block>
                                                </fo:table-cell>
                                            </fo:table-row>
                                        </xsl:for-each>
                                    </fo:table-body>
                                </fo:table>
                            </fo:block>
                            <fo:block>
                                <fo:inline font-weight="bold">Снимки: </fo:inline>
                                <fo:table border="1pt solid black" table-layout="fixed">
                                    <fo:table-body>
                                        <xsl:for-each select="gallery/image">
                                            <fo:table-row>
                                                <fo:table-cell>
                                                    <fo:block>
                                                        <fo:external-graphic src="../{@source}" content-height="scale-to-fit"  content-width="10cm" scaling="non-uniform"/>
                                                    </fo:block>
                                                </fo:table-cell>
                                            </fo:table-row>
                                        </xsl:for-each>
                                    </fo:table-body>
                                </fo:table>
                            </fo:block>
                        </fo:block>
                    </xsl:for-each>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

</xsl:stylesheet>
