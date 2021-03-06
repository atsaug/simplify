<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:m="http://maven.apache.org/POM/4.0.0" exclude-result-prefixes="m">
    <xsl:output method="xml" encoding="utf-8" indent="yes" xslt:indent-amount="4" xmlns:xslt="http://xml.apache.org/xslt" />
    <xsl:strip-space elements="*" />
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
