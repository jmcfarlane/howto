<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template name="do_wrap">
    <xsl:variable name="title" select="//@title" />
    <html>
      <head>
        <title>
          Standalone Howto: <xsl:value-of select="$title" />
        </title>
        <link type="text/css"
              rel="stylesheet"
              href="http://static-01.rockfloat.com/lib/commons-min.css" />
      </head>
      <body id="body">
        <div class="main" align="center">
            <div class="page">
              <div id="header">
                <div id="header-content">	
                  <h1 id="logo-text">
                    <a href="/" title="">Rock<span>float</span></a>
                  </h1>	
                  <h2 id="slogan">Love what you do...</h2>		
                </div>
              </div>
              <div id="nav-wrap">
                <div id="nav">
                  <ul>
                    <li><a href="">Standalone Howto Docs</a></li>
                  </ul>
                </div>
              </div>
              <div id="content-wrap">
                <div id="content">
                  <div id="sidebar" >	
                    <div class="sep"></div>
                      <div class="sidebox">
                        <h1>What I'm Reading</h1>
                        <div id="delicious_feeds">Loading...</div>
                          <div class="float-right small">
                            <a href="http://delicious.com">
                              Powered by Delicious
                            </a>
                        </div>
                    </div>
                  </div>

                  <div id="main">		
                    <div class="box">
                      <xsl:call-template name="content" />
                    </div>
                  </div>
                </div>
              </div>
            </div>
        </div>
        <script type="text/javascript"
                src="http://static-02.rockfloat.com/lib/commons-min.js">
        </script>
      </body>
    </html>
  </xsl:template>

  <!-- Start things off -->
  <xsl:template name="wrap">
    <xsl:variable name="usewrapper">True</xsl:variable>
    <xsl:choose>
      <xsl:when test="$usewrapper = 'True'">
        <xsl:call-template name="do_wrap" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="content" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
