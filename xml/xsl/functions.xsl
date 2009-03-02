<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="code">
    <xsl:choose>
      <xsl:when test="@box = 'false'">
        <code class="no-border">
          <xsl:apply-templates/>
        </code>
      </xsl:when>
      <xsl:otherwise>
        <xsl:if test="normalize-space(.)">
          <pre><code>
            <xsl:apply-templates/>
          </code></pre>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="list">
    <ol>
      <xsl:for-each select="el|element">
        <li><xsl:apply-templates/></li>
      </xsl:for-each>
    </ol>
  </xsl:template>

  <xsl:template match="table">
    <table class="chart" border="1">
      <xsl:for-each select="header">
        <tr>
          <xsl:for-each select="col">
            <th><xsl:apply-templates/></th>
          </xsl:for-each>
        </tr>
      </xsl:for-each>
      <xsl:for-each select="row">
        <tr>
          <xsl:for-each select="col">
            <td valign="top"><xsl:apply-templates/></td>
          </xsl:for-each>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>

  <!-- Bold -->
  <xsl:template match="b|bold">
    <b><xsl:apply-templates/></b>
  </xsl:template>

  <!-- Paragraph -->
  <xsl:template match="p|paragraph">
    <p><xsl:apply-templates/></p>
  </xsl:template>

  <!-- Paragraph break -->
  <xsl:template match="pb|pbreak|pspace">
    <br/><xsl:apply-templates/>
  </xsl:template>

  <!-- Important -->
  <xsl:template match="em|important|emphasis">
    <span class="red"><xsl:apply-templates/></span>
  </xsl:template>

  <!-- Literal -->
  <xsl:template match="lt|literal">
    <span class="literal"><xsl:apply-templates/></span>
  </xsl:template>

  <!-- Deprecate -->
  <xsl:template match="deprecated|deprecate">
    <span class="deprecated"><xsl:apply-templates/></span>
  </xsl:template>

  <!-- Link -->
  <xsl:template match="link">
    <a href="{@uri}"><xsl:apply-templates/></a>
  </xsl:template>

  <!-- Img -->
  <xsl:template match="img|image">
    <div>
      <img vspace="10" src="../img/howto/{@uri}" border="0" alt="" />
    </div>
  </xsl:template>

  <!-- Line break -->
  <xsl:template match="br">
    <br />
  </xsl:template>

  <!-- Italics -->
  <xsl:template match="i|italics">
    <i><xsl:apply-templates/></i>
  </xsl:template>

  <!-- Comments -->
  <xsl:template match="cmt|comment">
    <span class="comment"><xsl:apply-templates/></span>
  </xsl:template>

  <!-- output -->
  <xsl:template match="output">
    <span class="purple small"><xsl:apply-templates/></span>
    <br/>
  </xsl:template>

  <!-- Subtle -->
  <xsl:template match="subtle">
    <span class="subtle"><xsl:apply-templates/></span>
  </xsl:template>

  <!-- Superscript -->
  <xsl:template match="sup|superscript">
    <sup><xsl:apply-templates/></sup>
  </xsl:template>

  <!--  Tip -->
  <xsl:template match="tip">
    <fieldset>
      <legend><b>Tip</b></legend>
      <img src="/img/tip_small.png" hspace="2" vspace="2" align="left" />
      <xsl:apply-templates/>
    </fieldset>
  </xsl:template>

  <!-- Right pointing arrow -->
  <xsl:template match="rarrow">
    <xsl:text disable-output-escaping="yes">
      <![CDATA[<b class="red">&rarr;</b>]]>
    </xsl:text>
  </xsl:template>

</xsl:stylesheet>

