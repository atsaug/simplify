<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:m="http://maven.apache.org/POM/4.0.0" exclude-result-prefixes="m">
    <xsl:output method="xml" encoding="utf-8" indent="yes" xslt:indent-amount="4" xmlns:xslt="http://xml.apache.org/xslt" />
    <xsl:strip-space elements="*" />
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>
    <xsl:template match="/m:project/m:properties">
        <xsl:copy>
            <xsl:apply-templates select="node()">
                <xsl:sort select="name()" />
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    <!-- 
     dependency management (internal and external)
     -->
    <xsl:template match="/m:project/m:dependencyManagement/m:dependencies/m:dependency/m:version/text()[. = '${revision}']">
        <xsl:value-of select="/m:project/m:version/text()" />
    </xsl:template>
    <xsl:template match="/m:project/m:dependencyManagement/m:dependencies/m:dependency/m:version/text()[. = '${spring-boot.version}']">
        <xsl:value-of select="/m:project/m:properties/m:spring-boot.version/text()" />
    </xsl:template>
    <!-- 
     plugin management (internal and external)
     -->
    <xsl:template match="/m:project/m:build/m:pluginManagement/m:plugins/m:plugin/m:version/text()[. = '${revision}']">
        <xsl:value-of select="/m:project/m:version/text()" />
    </xsl:template>
    <xsl:template match="/m:project/m:build/m:pluginManagement/m:plugins/m:plugin/m:version/text()[. = '${spring-boot.version}']">
        <xsl:value-of select="/m:project/m:properties/m:spring-boot.version/text()" />
    </xsl:template>
    <!-- 
     deleted from properties 
     -->
    <xsl:template match="/m:project/m:properties/m:revision" />
    <xsl:template match="/m:project/m:properties/m:spring-boot.version" />
    <xsl:template match="/m:project/m:properties/m:main.basedir" />
</xsl:stylesheet>
