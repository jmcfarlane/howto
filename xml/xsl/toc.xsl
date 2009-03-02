<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output encoding="UTF-8"
            method="html"
            indent="yes"
            omit-xml-declaration="yes" />
  <xsl:variable name="destdir">static/howto</xsl:variable>
  <xsl:variable name="usewrapper">True</xsl:variable>

  <xsl:template name="content">
    <div class="float-right">
      <select size="1" onchange="load(this);">
      <option value=""> -- Quick Navigation -- </option>
      <xsl:for-each select="/files/file">
        <xsl:variable name="howto" select="document(@path)" />
        <option value="{@path}">
          <xsl:value-of select="$howto/guide/abstract/@title" />
        </option>
      </xsl:for-each>
      </select>
    </div>

    <xsl:for-each select="/files/file">
      <xsl:variable name="doc" select="document(./@path)/guide" />
      <div class="howto-toc">
        <h2>
          <a href="{@path}">
            <xsl:value-of select="$doc/abstract/@title" />
          </a>
        </h2>
        <xsl:value-of select="$doc/abstract" />
      </div>
    </xsl:for-each>

    <script type="text/javascript">
    function load(o){
        document.location.href = o.value;
    }
    </script>
  </xsl:template>
  
  <!-- start things off -->
  <xsl:template match="/files">
    <xsl:call-template name="wrap" />
  </xsl:template>

  <xsl:include href="wrap.xsl"/>
  <xsl:include href="functions.xsl"/>
</xsl:stylesheet>

