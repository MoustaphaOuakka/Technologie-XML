<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    => le name space "http://www.w3.org/1999/XSL/Transform" equivatent de package en java
    => xmlns : (XML Name Space) pour declarer un name space
    => xsl : un prefixe
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- 
        => utilisation d'un element declerer dans le bibliotheque xsl
        => le feulle de style toujeurs comence par l'element template
    -->
    <xsl:template match="/"> <!-- / : sagnefie la racine -->
        <html>
            <head>
                <title>Bibliothique</title>
            </head>
            <body>
                <xsl:for-each select="/biblio/etudient">
                    <ul>
                        <li>Code : <xsl:value-of select="@code"/></li>
                        <li>Nom : <xsl:value-of select="@nom"/></li>
                        <li>Prenom : <xsl:value-of select="@prenom"/></li>
                        <li>Age : <xsl:value-of select="@age"/></li>
                    </ul>
                    <table>
                        <tr>
                            <th>ID</th>
                            <th>Titre</th>
                            <th>Date Emprunt</th>
                            <th>Rendu</th>
                        </tr>
                        <xsl:for-each select="livre[@rendu = 'Oui']"> <!-- [...] pour les condition (equivalente de WHERE en SQL) -->
                            <tr>
                                <td><xsl:value-of select="@id"/></td>
                                <td><xsl:value-of select="@titre"/></td>
                                <td><xsl:value-of select="@dateEmprunt"/></td>
                                <td><xsl:value-of select="@rendu"/></td>
                            </tr>
                        </xsl:for-each>
                        <tr>
                            <td>Nombre des livres : </td>
                            <td><xsl:value-of select="count(livre[@rendu = 'Oui'])"/></td>
                        </tr>
                    </table>
                </xsl:for-each>
            </body>
        </html>
        
    </xsl:template>
</xsl:stylesheet>