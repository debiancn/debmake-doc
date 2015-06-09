<?xml version="1.0" encoding="utf-8" ?>
<!-- vim: set sts=2 ai expandtab:
Extract URL and link location name for &url-***; for use in urls.ent
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:output method="text" indent="no"/>

<xsl:strip-space elements="*"/>
<xsl:variable name="uletters">ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 !#$%()=-~^|\/+*,.?;:@`[]{}&quot;&apos;&amp;&gt;&lt;&#8201;&#8212;’</xsl:variable>
<xsl:variable name="lletters">abcdefghijklmnopqrstuvwxyzabcdefghij</xsl:variable>

<!-- I will use max 32 characters for href references -->

<xsl:template match="text()">
</xsl:template>

<xsl:template match="ulink">
  <xsl:choose>
    <xsl:when test="starts-with(@url,'/')">
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="'&lt;!ENTITY '"/>
          <xsl:choose>
            <xsl:when test="string-length(.) = 0">
              <xsl:choose>
                <xsl:when test="string-length(translate(@url,$uletters,$lletters)) &lt;= 32">
                  <xsl:value-of select="translate(@url,$uletters,$lletters)"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="concat(substring(translate(@url,$uletters,$lletters),1,16),substring(translate(@url,$uletters,$lletters), string-length(translate(@url,$uletters,$lletters))-15,16))"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
              <xsl:choose>
                <xsl:when test="string-length(translate(.,$uletters,$lletters)) &lt;= 32">
                  <xsl:value-of select="translate(.,$uletters,$lletters)"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="concat(substring(translate(.,$uletters,$lletters),1,16),substring(translate(.,$uletters,$lletters), string-length(translate(.,$uletters,$lletters))-15,16))"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:otherwise>
          </xsl:choose>
      <xsl:value-of select="' &quot;'"/>
      <xsl:value-of select="@url"/>
      <xsl:value-of select="'&quot;&gt;&#10;'"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>





