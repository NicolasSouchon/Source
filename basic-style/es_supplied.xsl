<?xml version="1.0" encoding='UTF-8'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="supplied[@reason='subaudible']">(<xsl:apply-templates/>)</xsl:template>
    <xsl:template match="supplied[@reason='lost']">[<xsl:apply-templates/>]</xsl:template>
</xsl:stylesheet>
