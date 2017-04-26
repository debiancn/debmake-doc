<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>
<!-- vim: set sts=2 ai expandtab: -->

<!--############################################################################
    XSLT Stylesheet DocBook -> LaTeX
    ############################################################################ -->

  <xsl:param name="xetex.font">
    <!-- Western centric Adobe PostScript looks-alike: gsfonts: missing some odd codes, mono is thin
    <xsl:text>\setmainfont{Nimbus Roman No9 L}&#10;</xsl:text>
    <xsl:text>\setsansfont{Nimbus Sans L}&#10;</xsl:text>
    <xsl:text>\setmonofont{Nimbus Mono L}&#10;</xsl:text>
    -->

    <!-- Western centric Bitstream Vera Fonts extended: DejaVu: too big and spaced
    <xsl:text>\setmainfont{DejaVu Serif}&#10;</xsl:text>
    <xsl:text>\setsansfont{DejaVu Sans}&#10;</xsl:text>
    <xsl:text>\setmonofont{DejaVu Sans Mono}&#10;</xsl:text>
    -->

    <!-- Western centric MS (monotype) fonts looks-alike: Liberation : Best looking -->
    <xsl:text>\setmainfont{Liberation Serif}&#10;</xsl:text>
    <xsl:text>\setsansfont{Liberation Sans}&#10;</xsl:text>
    <xsl:text>\setmonofont{Liberation Mono}&#10;</xsl:text>

    <xsl:choose>
      <xsl:when test="$lingua = 'zh-cn' or $lingua = 'zh_CN' or $lingua = 'zh_cn'">
	<!-- zh_CN centric: fonts-arphic-gbsn00lp, fonts-wqy-zenhei -->
    <!-- TODO: perhaps replace with fonts-noto-cjk or Fandol fonts from
         texlive-lang-chinese? -->
        <xsl:text>\usepackage{xeCJK}&#10;</xsl:text>
        <xsl:text>\setCJKmainfont{AR PL SungtiL GB}&#10;</xsl:text>
        <xsl:text>\setCJKsansfont{WenQuanYi Zen Hei}&#10;</xsl:text>
        <xsl:text>\setCJKmonofont{WenQuanYi Zen Hei Mono}&#10;</xsl:text>
      </xsl:when>
      <xsl:when test="$lingua = 'zh-tw' or $lingua = 'zh_TW' or $lingua = 'zh_tw'">
        <!-- zh_TW centric: fonts-arphic-bsmi00lp, fonts-wqy-zenhei -->
        <xsl:text>\usepackage{xeCJK}&#10;</xsl:text>
        <xsl:text>\setCJKmainfont{AR PL Mingti2L Big5}&#10;</xsl:text>
        <xsl:text>\setCJKsansfont{WenQuanYi Zen Hei}&#10;</xsl:text>
        <xsl:text>\setCJKmonofont{WenQuanYi Zen Hei Mono}&#10;</xsl:text>
      </xsl:when>
      <xsl:when test="$lingua = 'ja'">
        <!-- ja centric: fonts-ipafont-mincho fonts-ipafont-gothic -->
        <xsl:text>\usepackage{xeCJK}&#10;</xsl:text>
        <xsl:text>\setCJKmainfont{IPAMincho}&#10;</xsl:text>
        <xsl:text>\setCJKsansfont{IPAPGothic}&#10;</xsl:text>
        <xsl:text>\setCJKmonofont{IPAGothic}&#10;</xsl:text>
      </xsl:when>
      <xsl:when test="$lingua = 'ko'">
        <!-- ko centric: fonts-unfonts-core -->
        <xsl:text>\usepackage{xeCJK}&#10;</xsl:text>
        <xsl:text>\setCJKmainfont{UnBatang}&#10;</xsl:text>
        <xsl:text>\setCJKsansfont{UnDotum}&#10;</xsl:text>
        <xsl:text>\setCJKmonofont{UnDotum}&#10;</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <!-- only western char -->
      </xsl:otherwise>
    </xsl:choose>
  </xsl:param>

</xsl:stylesheet>

<!--
= Asian font basics =

Use xCJK only for CJK http://bugs.debian.org/666569

== Universal ==

  fonts-noto-cjk (multiple languages and font types,思源黑体,思源等宽黑体,思源宋体)
    Noto Sans CJK JP
    Noto Sans CJK KR
    Noto Sans CJK SC
    Noto Sans CJK TC
    Noto Sans Mono CJK JP
    Noto Sans Mono CJK KR
    Noto Sans Mono CJK SC
    Noto Sans Mono CJK TC
    Noto Serif CJK JP (* post-Stretch)
    Noto Serif CJK KR (* post-Stretch)
    Noto Serif CJK SC (* post-Stretch)
    Noto Serif CJK TC (* post-Stretch)

== Sanserif ==
  simplified Chinese: 黑体 hēi tǐ
    fonts-wqy-zenhei (zh_CN centric)
      WenQuanYi Zen Hei,文泉驛正黑,文泉驿正黑
      WenQuanYi Zen Hei Sharp,文泉驛點陣正黑,文泉驿点阵正黑
      WenQuanYi Zen Hei Mono,文泉驛等寬正黑,文泉驿等宽正黑
  traditional Chinese: 黑體 hēi tǐ
  Japanese: ゴシック kaku goshikku, gothic
    fonts-ipafont-gothic (ja centric)
      IPAGothic,IPAゴシック
      IPAPGothic,IPA Pゴシック

== Serif ==
中国大陆一般称：宋体；台湾香港一般称：明體
  simplified Chinese: 宋体/(明体), Sòngtǐ
    fonts-arphic-gbsn00lp (zh_CN centric)
      AR PL SungtiL GB
  traditional Chinese: (宋體)/明體, Sòngtǐ
    fonts-arphic-bsmi00lp (zh_TW centric)
      AR PL Mingti2L Big5
      (Missing some character in output...)
    fonts-arphic-uming    (zh_TW centric)
      AR PL UMing
       = "AR PL Mingti2L Big5" and "AR PL SungtiL GB" + extra in Taiwan-style
       (BUild failure happened thus not used)
  Japanese: 明朝体, Minchōtai
    fonts-ipafont-mincho (ja centric)
      IPAMincho,IPA明朝:style=Regular
      IPAPMincho,IPA P明朝:style=Regular
  Korean: Hangul: 명조체; Hanja: 明朝體; Revised Romanization: Myeongjoche

== Script () ==
  simplified Chinese: 楷书; kǎishū
    fonts-arphic-gkai00mp (zh_CN centric)
      AR PL KaitiM GB
  traditional Chinese: 楷書; kǎishū
    fonts-arphic-bkai00mp (zh_TW centric)
      AR PL KaitiM Big5
    fonts-arphic-ukai     (zh_TW centric)
      AR PL UKai
       = AR PL KaitiM Big5" + "AR PL KaitiM GB" + extra in Taiwan-style
  Japanese: 楷書, kaisho (教科書体)

Korean:
fonts-baekmuk 1st most popular    which contains 4 font families.
                                latex-cjk-xcjk suggest this
      /usr/share/fonts/truetype/baekmuk/dotum.ttf
      /usr/share/fonts/truetype/baekmuk/hline.ttf
      /usr/share/fonts/truetype/baekmuk/gulim.ttf
      /usr/share/fonts/truetype/baekmuk/batang.ttf
      Baekmuk Batang,백묵 바탕:style=Regular       ... serif
      Baekmuk Dotum,백묵 돋움:style=Regular        ... san-serif  medium (print?)
      Baekmuk Gulim,백묵 굴림:style=Regular        ... san-serif  thin   (screen?)
      Baekmuk Headline,백묵 헤드라인:style=Regular ... bold san-serif    (best screen small)
fonts-unfonts-core    2nd popular and increasing
                    made from the HLaTeX's PostScript fonts
                    UnBatang, UnDotum, Ungraphic, Unpilgi, and UnGungseo
      UnBatang  ... serif
      UnDotum   ... san-serif
      UnGungseo ... Kai/kaisho
                    latex-cjk-xcjk uses UnBatang as example
fonts-alee    3rd most popular    many fonts by alee
fonts-nanum                       Myeongjo and Gothic Korean font families/screen font
fonts-nanum-coding                Korean fixed width font family

encoding names (largely obsoleted and replaced by UTF-8 on modern Linux systems):
  * GB2312, GBK or GB18030: Simplified Chinese
  * Big5:                   Traditional Chinese
-->

