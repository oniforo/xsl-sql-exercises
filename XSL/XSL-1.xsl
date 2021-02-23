<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <TripsToPlan>
            <ids>
                <xsl:apply-templates select="Trips/tripID"/>
            </ids>
            <numberofShifts>
                <xsl:value-of select="count(Trips/tripID)"/>
            </numberofShifts>
        </TripsToPlan>
    </xsl:template>

    <xsl:template match="tripID">
        <xsl:choose>
            <xsl:when test="position() != last()">
                <xsl:value-of select="concat(., ',')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
