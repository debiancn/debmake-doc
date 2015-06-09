<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- Import our base stylesheet -->
<xsl:import href="file:///usr/share/xml/docbook/stylesheet/docbook-xsl/xhtml-1_1/docbook.xsl"/>

  <!-- parameters for optimal text output -->
  <xsl:param name="callout.graphics" select="0"/>
  <xsl:param name="callout.unicode" select="0"/>
  <xsl:param name="section.autolabel" select="1"/>
  <xsl:param name="section.label.includes.component.label" select="1"/>
  <!-- just title and no toc for appendix chapter -->
  <xsl:param name="generate.toc">
  appendix  title
  article/appendix  nop
  article   toc,title
  book      toc,title
  chapter   title
  part      toc,title
  preface   toc,title
  qandadiv  toc
  qandaset  toc
  reference toc,title
  section   toc
  set       toc,title
  </xsl:param>

  <!-- centering and aligning title elements -->
  <xsl:template match="/*/title[position()=1]" mode="titlepage.mode">
    <br/>
    <center>
      <xsl:apply-imports/>
    </center>
    <br/>
    <hr/> <!-- no underline, but at least something -->
  </xsl:template>
  <xsl:template match="author|editor" mode="titlepage.mode">
    <center>
      <xsl:apply-imports/>
    </center>
  </xsl:template>

  <xsl:template match="releaseinfo" mode="titlepage.mode">
    <center>
      <xsl:apply-imports/>
    </center>
    <hr/>
  </xsl:template>

  <!-- dirty hack to get a left margin for paragraphs etc. -->
  <xsl:template match="legalnotice/*
        |chapter/*[not(name(.)='section') and not(name(.)='title')]
        |section/*[not(name(.)='section') and not(name(.)='title')]
        |appendix/*[not(name(.)='section') and not(name(.)='title')]
	|footnote/*">
    <xsl:copy><table><tr><td>&#xa0;&#xa0;&#xa0;</td><td>
    <xsl:apply-imports/>
    </td></tr></table></xsl:copy>
  </xsl:template>

  <!-- skip URLs if it has something to print -->
  <xsl:template match="ulink[.!='']">
    <xsl:copy-of select="."/>
  </xsl:template>
  <!-- print URLs if nothing to print  -->
  <xsl:template match="ulink[.='']">
    <xsl:value-of select="@url"/>
  </xsl:template>

  <!-- make clear where notes etc. begin and end -->
  <xsl:template match="caution|important|note|tip|warning">
    <table width="80%" border="1">
      <colgroup>
	<col align="justify"/>
      </colgroup>
      <tbody>
	<tr>
	  <td align="justify">
	    <xsl:apply-imports/>
	  </td>
	</tr>
      </tbody>
    </table>
  </xsl:template>
</xsl:stylesheet>
