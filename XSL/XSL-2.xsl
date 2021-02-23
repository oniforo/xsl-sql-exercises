<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>
    <xsl:key name="name_key" match="item" use="name"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="products">
        <xsl:copy>
            <xsl:apply-templates select="item[generate-id(.)=generate-id(key('name_key', name)[1])]"/>
            <total_quantity>
                <xsl:value-of select="sum(//quantity)"/>
            </total_quantity>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="item">
        <xsl:variable name="item_name" select="name"/>
        <xsl:variable name="filtered" select="//item[name=$item_name]"/>
        <xsl:variable name="sum" select="sum($filtered/quantity)"/>
        <product>
            <name>
                <xsl:value-of select="name"/>
            </name>
            <quantity>
                <xsl:value-of select="$sum"/>
            </quantity>
            <avg>
                <xsl:value-of select="$sum div count($filtered)"/>
            </avg>
        </product>
    </xsl:template>

</xsl:stylesheet>
