<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output encoding="UTF-8" method="html" indent="yes"
     omit-xml-declaration="yes" />
  <xsl:variable name="destdir">build</xsl:variable>
  <xsl:variable name="usewrapper">True</xsl:variable>

  <xsl:template name="content">
    <xsl:variable name="email" select="/guide/author/@email" />
    <h2><xsl:value-of select="/guide/abstract/@title" /></h2>
    <div id="howto" class="howto">
      <b>By: <xsl:value-of select="/guide/author" /></b>
      <xsl:if test="$email != ''">
        <span>
          &#60;<xsl:value-of select="$email" />&#62;
        </span>
      </xsl:if>
      <xsl:if test="change != ''">
        <div class="green small" style="padding-top:2px;">
          Last updated:
          <xsl:value-of select="(/guide/change/@date)[last()]"/>
        </div>
        <br/>
      </xsl:if>

      <div class="abstract-title">Abstract:</div>
        <xsl:for-each select="/guide/abstract">
          <xsl:apply-templates />
        </xsl:for-each>
      <br/><br/>
                        
      <!-- toc -->
      <div style="margin-top: 10px;">
        <b>Table of Contents:</b>
        <ol>
          <xsl:for-each select="/guide/action">
            <li>
              <a href="javascript:RF.howto.scrollto('{@anchor}')">
                <xsl:value-of select="./@title" />
              </a>
            </li>
          </xsl:for-each>
          <xsl:if test="change != ''">
            <li>
              <a class="green"
                 href="javascript:RF.howto.scrollto('changelog');">
                Changelog
              </a>
            </li>
          </xsl:if>
          <xsl:if test="/guide/convention != ''">
            <li>
              <a class="green"
                 href="javascript:RF.howto.scrollto('conventions');">
                Conventions used
              </a>
            </li>
          </xsl:if>
        </ol>
      </div>
        
      <br/>
      <div class="hr"></div>
        
      <!-- begin howto -->
      <xsl:for-each select="/guide/action">
        <a id="{@anchor}" name="{@anchor}"></a>
        <br/>
        <div class="float-right" style="padding-right:4px;">
          <a href="javascript:RF.howto.scrollto('body');">top</a>
        </div>
        <h4>
            <xsl:number value="position()" format="1. " />
            <xsl:value-of select="./@title" />
        </h4>
        
        <div id="o{position()}" class="howto">
          <xsl:apply-templates/>
        </div>
        <div style="height:20px;"></div>
        <input type="checkbox" onclick="RF.howto.finished({position()});" />
        I'm finished with this step
        <div class="hr"></div>
      </xsl:for-each>
      <br/>

      <xsl:call-template name="changelog" />
      <xsl:call-template name="footer" />
    </div>
  </xsl:template>
    
  <xsl:template name="changelog">
    <xsl:if test="change != ''">
      <div id="changelog">
        <a name="changelog"></a>
        <table class="chart small">
          <tr>
            <th bgcolor="#dddddd"><b>Changelog: Date</b></th>
            <th bgcolor="#dddddd"><b>Description</b></th>
          </tr>
          <xsl:for-each select="/guide/change">
            <tr>
              <td bgcolor="white" valign="top" nowrap="nowrap">
                <xsl:value-of select="./@date" /></td>
              <td bgcolor="white"><xsl:apply-templates/></td>
            </tr>
          </xsl:for-each>
        </table>
      </div>
    </xsl:if>

    <br/>
    This document was originally created on
    <xsl:value-of select="/guide/@created" />
  </xsl:template>
    
  <xsl:template name="footer">
    <br/><br/>
    <xsl:if test="/guide/convention != ''">
      <br/>
      <div id="conventions">
        <a name="conventions"></a>
        <b>Conventions and tips for this howto document:</b>
        <ol>
          <xsl:for-each select="/guide/convention">
            <li><xsl:apply-templates/></li>
          </xsl:for-each>
        </ol>
      </div> 
    </xsl:if>
    <br/>
    <p>
      <b>Disclaimer:</b>
      <br/>
      <i>
        This page is not endorsed by gentoo.org or any other cool
        cats. Any information provided in this document is to be used
        at your own risk.
      </i>
    </p>
  </xsl:template>
    
  <!-- start things off -->
  <xsl:template match="/guide">
    <xsl:call-template name="wrap" />
  </xsl:template>

  <xsl:include href="wrap.xsl"/>
  <xsl:include href="functions.xsl"/>
</xsl:stylesheet>

