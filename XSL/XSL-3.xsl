<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="//country"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="country">
        <xsl:if test="language = 'English' and language[@percentage &lt; '100']">
            <country name="{@name}">
                <xsl:apply-templates select="language"/>
            </country>
        </xsl:if>
    </xsl:template>

    <xsl:template match="language">
        <xsl:if test=". = 'English'">
            <language percentage="{@percentage}">
                <xsl:value-of select="."/>
            </language>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
