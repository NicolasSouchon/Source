<?xml version="1.0" encoding="UTF-8"?>
 
 <!-- Start license statement: do not remove 
 
 EpiDoc Standard Stylesheets
 Copyright (C) 2000-2006 by all contributors
 
 This program is free software; you can redistribute it and/or
 modify it under the terms of the GNU General Public License
 as published by the Free Software Foundation; either version 2
 of the License, or (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program; if not, write to the Free Software
 Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 
 Information about the EpiDoc community can be obtained via
  http://epidoc.sf.net.
 
 End license statement: do not remove -->
 

<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    <!-- abbreviations inside an epidoc edition div -->
    <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    <xsl:template match="tei:abbr[contains(ancestor::tei:div/@type, 'edition')]">
        <xsl:choose>
            <xsl:when test="name(..)='expan'">
                <xsl:element name="span">
                    <xsl:attribute name="class">original-characters</xsl:attribute>
                    <xsl:apply-templates />
                </xsl:element>
            </xsl:when>
            <xsl:when test="name(..)!='expan' and not(./@expan)">
                <xsl:element name="span">
                    <xsl:attribute name="class">epigraphic-abbreviation-not-understood</xsl:attribute>
                    <xsl:attribute name="title">
                        <xsl:value-of select="." />
                    </xsl:attribute><xsl:apply-templates />(- - -)</xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="span">
                    <xsl:attribute name="class">error</xsl:attribute>
                    <xsl:attribute name="title">untrapped abbreviation construct for an epidoc division in teiabbr.xsl</xsl:attribute><xsl:apply-templates/></xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    <!-- abbreviations not inside an epidoc edition div -->
    <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
    <xsl:template match="tei:abbr[not(contains(ancestor::tei:div/@type, 'edition'))]">
        <xsl:element name="abbr">
            <xsl:attribute name="title"><xsl:value-of select="@expan"/></xsl:attribute><xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
