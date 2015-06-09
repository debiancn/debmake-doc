<?xml version="1.0" encoding="utf-8" ?>
<!-- vim: set sts=2 ai expandtab: -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:output method="xml" indent="yes" encoding="UTF-8"/>

<!-- xsl:strip-space elements="*"/ -->

<!-- index 1...8 keep chapter, index 9, use appendix instead -->
<xsl:template match="//chapter[last()]">
<appendix>
    <xsl:apply-templates select="@*|node()"/>
</appendix>
</xsl:template>


<xsl:template match="@*|node()">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>

