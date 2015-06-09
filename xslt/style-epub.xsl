<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- Import our base stylesheet -->
<xsl:import href="file:///usr/share/xml/docbook/stylesheet/docbook-xsl/epub/docbook.xsl"/>

  <!-- just title and no toc figure... for book -->
  <!-- just title and no toc for appendix chapter -->
  <xsl:param name="generate.toc">
  appendix  title
  article/appendix  nop
  article   toc,title
  book      toc,title
  chapter   toc,title
  part      toc,title
  preface   toc,title
  qandadiv  toc
  qandaset  toc
  reference toc,title
  section   toc
  set       toc,title
  </xsl:param>

<!-- Since I use xsltproc (not saxon), this is workaround to ensure UTF-8 -->
<xsl:template xmlns="http://www.w3.org/1999/xhtml" name="head.content.generator">
  <xsl:param name="node" select="."/>
  <meta name="generator" content="DocBook {$DistroTitle} V{$VERSION}"/>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</xsl:template>

<xsl:template name="generate.html.title"/>

<!-- We don't want title in HTML -->
<xsl:param name="generate.meta.abstract" select="0"/>
<xsl:param name="html.stylesheet">debian.css</xsl:param>

<!-- I hate when the first subsection is on the same page as content -->
<xsl:param name="chunk.first.sections" select="0"/>
<xsl:param name="chunk.section.depth" select="0"/>
<xsl:param name="chunker.output.indent" select="'yes'"/>

<xsl:param name="toc.section.depth">4</xsl:param>
<xsl:param name="section.label.includes.component.label" select="1"/>
<xsl:param name="section.autolabel" select="1"/>

</xsl:stylesheet>
