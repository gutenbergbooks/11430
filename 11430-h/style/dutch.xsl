<!-- dutch.xsl -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:import href="tei2html.xsl"/>

	<xsl:variable name="strUnitsUsed">Original</xsl:variable>

	<xsl:variable name="strAppendix">Appendix</xsl:variable>
	<xsl:variable name="strChapter">Hoofdstuk</xsl:variable>
	<xsl:variable name="strContents">Inhoudsopgave</xsl:variable>
	<xsl:variable name="strTableOfContents">Inhoudsopgave</xsl:variable>
	<xsl:variable name="strFigure">Figuur</xsl:variable>
	<xsl:variable name="strPage">bladzijde</xsl:variable>
	<xsl:variable name="strPlate">Plaat</xsl:variable>
	<xsl:variable name="strNotes">Noten</xsl:variable>
	<xsl:variable name="strPart">Deel</xsl:variable>

	<xsl:template name="authors">
		<xsl:for-each select="//titleStmt/author">
			<xsl:choose>
				<xsl:when test="position() != last() and position() != last() -1 and last() > 2">
					<xsl:value-of select="."/><xsl:text>, </xsl:text>
				</xsl:when>
				<xsl:when test="position() = last() and last() > 1">
					<xsl:text> en </xsl:text><xsl:value-of select="."/><xsl:text>. </xsl:text>
				</xsl:when>
				<xsl:when test="last() = 1">
					<xsl:value-of select="."/><xsl:text>. </xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="PGHeader">
		<p>Het Project Gutenberg EBoek  
			<i><xsl:value-of select="//titleStmt/title"/></i> door
			<b>
				<xsl:call-template name="authors"/>
			</b>
		</p>
		<p class="smallprint">Dit eBoek is voor kosteloos gebruik door iedereen overal, met vrijwel geen beperkingen van welke soort dan ook. U mag het kopieeren, weggeven of hergebruiken onder de voorwaarden van de Project Gutenberg Licentie <a href="#license">achterin dit eBoek</a> (Engelstalig) of on-line op <a href='https://www.gutenberg.org/'>www.gutenberg.org</a></p>
		<p class="smallprint">Titel: <xsl:value-of select="//titleStmt/title"/></p>
		<p class="smallprint">
			<xsl:choose>
				<xsl:when test="count(//titleStmt/author) &gt; 1">
					Auteurs: <xsl:call-template name="authors"/>
				</xsl:when>
				<xsl:otherwise>
					Auteur: <xsl:value-of select="//titleStmt/author"/>.
				</xsl:otherwise>
			</xsl:choose>
		</p>
		<p class="smallprint">Uitgiftedatum: <xsl:value-of select="//publicationStmt/date"/>
		<xsl:if test="//publicationStmt/idno[@type='pgnum' or @type='PGnum']">
			 [EBoek Nummer: <xsl:value-of select="//publicationStmt/idno[@type='pgnum' or @type='PGnum']"/>]
		</xsl:if></p>
		<p class="smallprint">Taal: 
		<xsl:choose>
			<xsl:when test="/TEI.2/@lang='en'">Engels</xsl:when>
			<xsl:when test="/TEI.2/@lang='en-UK' or /TEI.2/@lang='en-uk'">Engels (V.K.)</xsl:when>
			<xsl:when test="/TEI.2/@lang='en-US' or /TEI.2/@lang='en-us'">Engels (V.S.)</xsl:when>
			<xsl:when test="/TEI.2/@lang='de'">Duits</xsl:when>
			<xsl:when test="/TEI.2/@lang='nl'">Nederlands</xsl:when>
			<xsl:when test="/TEI.2/@lang='nl-1900'">Nederlands (oude spelling)</xsl:when>
		</xsl:choose>.</p>
		<p class="smallprint">Character set codering: UTF-8.</p>
		<hr/>
		<p/>
	</xsl:template>

	<xsl:template name="PGFooter">
		<p/>
		<hr/>
		<p id="smallprint">Einde van het Project Gutenberg EBoek 
			<i><xsl:value-of select="//titleStmt/title"/></i> door 
			<b>
				<xsl:call-template name="authors"/>
			</b>
		</p>

		<p class="smallprint">Dit bestand moet <xsl:value-of select="//publicationStmt/idno"/>-h.html of <xsl:value-of select="//publicationStmt/idno"/>-h.zip heten.</p>

		<p class="smallprint">Dit en de bijbehorende bestanden in verschillende formaten kunnen worden gevonden in:</p>

		<p class="smallprint">https://www.gutenberg.org/<xsl:value-of select="substring(//publicationStmt/idno, 1, 1)"/>/<xsl:value-of select="substring(//publicationStmt/idno, 2, 1)"/>/<xsl:value-of select="substring(//publicationStmt/idno, 3, 1)"/>/<xsl:value-of select="substring(//publicationStmt/idno, 4, 1)"/>/<xsl:value-of select="//publicationStmt/idno"/>/</p>

		<p class="smallprint">Geproduceerd door <xsl:value-of select="//titleStmt/respStmt/name"/>.</p>

		<p class="smallprint">Verbeterde edities vervangen de vorige edities&#x2014;de oude edities zullen een andere naam krijgen.</p>

		<p class="smallprint">Omdat we werken produceren van gedrukte edities in het publiek domein, betekent dat dat niemand in de Verenigde Staten een auteursrecht op deze werken heeft. De Stichting (en u!) mag deze werken dus zonder toestemming, en zonder het betalen van vergoedingen, kopi&#x00EB;ren en verspreiden in de Verenigde Staten. Speciale regels, uiteengezet in de Algemene Voorwaarden voor Gebruik van deze licentie zijn van toepassing op het kopi&#x00EB;ren en verspreiden van Project Gutenberg&#x2122; electronische werken om het PROJECT GUTENBERG&#x2122; concept en merkrecht te beschermen. Project Gutenberg is een geregistreerd merk, en mag niet worden gebruikt als u geld in rekening brent voor kopie&#x00EB;n van dit eBoek. Als u geen geld voor kopi&#x00EB;en van dit eBoek in rekening brengt, dan is het erg makkelijk u aan deze regels te houden. U mag dit eBoek gebruiken voor bijna elke toepassing, zoals het maken van afgeleide werken, voorstellingen, en onderzoek. Ze mogen worden aangepast, gedrukt en weggegeven.&#x2014;U mag practisch ALLES doen met eBoeken in het publieke domein. Herdistributie, en in het bijzonder commerci&#x00EB;le herdistributie, is onderworpen aan de licentie op het merk. De volledige licentie volgt hieronder om juridische redenen in het Engels.</p>

		<xsl:call-template name="PGLicense"/>
	</xsl:template>

</xsl:stylesheet>
