<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="Department/Course"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="Course">
        <xsl:if test="
            contains(Title, 'Computer') and 
            @Enrollment[. &lt; 620 and . &gt; 110]
        ">
            <xsl:copy-of select="."/>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
