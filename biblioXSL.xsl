<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
    <html>
        <head>
            <title>La biblioteca más rara que has visto en tu vida</title>
            <link rel="stylesheet" type="text/css" href="estilos.css"/>
        </head>
        <body>
            <h1>Contenido de "La biblioteca más rara que has visto en tu vida"</h1>
            <table class="tabla">
                <tr>
                    <th>Producto</th>
                    <th>Título</th>
                    <th>Año</th>
                    <th></th>
                </tr>
                <tr>
                    <td colspan="3" class="separadortabla"></td>
                    <td class="separadortabla">
                        Autor
                    </td>
                </tr>
                <xsl:for-each select="biblioteca/objetosEnPrestamo/libro">
                    <tr>
                        <td>Libro</td>
                        <td>
                            <xsl:value-of select="titulo"/>
                        </td>
                        <td>
                            <xsl:value-of select="fecha"/>
                        </td>
                        <td>
                            <xsl:value-of select="autor"/>
                        </td>
                    </tr>
                </xsl:for-each>
                    <tr>
                        <td colspan="3" class="separadortabla"></td>
                        <td class="separadortabla">
                            Director(es)
                        </td>
                    </tr>
                    <xsl:for-each select="biblioteca/objetosEnPrestamo/pelicula">
                        <tr>
                            <td>Película</td>
                            <td>
                                <xsl:value-of select="titulo"/>
                            </td>
                            <td>
                                <xsl:value-of select="fecha"/>
                            </td>
                            <td>
                                <xsl:for-each select="./director">
                                    <!--Este choose pone "," si no es el último y nada si lo es
                                    para encadenar todos los directores cuando hay más de uno-->
                                    <xsl:choose> 
                                        <xsl:when test="position()!=last()">
                                            <xsl:copy-of select="."/>,
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="."/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:for-each>
                            </td>
                        </tr>
                    </xsl:for-each>
                    <tr>
                        <td colspan="3" class="separadortabla"></td>
                        <td class="separadortabla">
                            Plataforma(s)
                        </td>
                    </tr>
                    <xsl:for-each select="biblioteca/objetosEnPrestamo/videojuego">
                        <tr>
                            <td>Videojuego</td>
                            <td>
                                <xsl:value-of select="titulo"/>
                            </td>
                            <td>
                                <xsl:value-of select="fecha"/>
                            </td>
                            <td>
                                <!--Este choose pone "," si no es el último y nada si lo es
                                para encadenar todas las plataformas una tras otra-->
                                <xsl:for-each select="./plataforma">
                                    <xsl:choose>
                                        <xsl:when test="position()!=last()">
                                            <xsl:copy-of select="."/>,
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="."/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:for-each>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                
                <!--el if test saga not preceding asegura que los títulos que comparten saga
                si están seguidos no salen repetido (salen la primera vez solo)-->
                <div id="contenedorlistas">
                <h2>Sagas populares</h2>
                <ol>
                    <xsl:for-each select="biblioteca/objetosEnPrestamo/libro">
                        <xsl:if test="saga[not(.=preceding::saga)]">
                            <li class="hoversuave">
                                <xsl:value-of select="saga"/>
                            </li>
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:for-each select="biblioteca/objetosEnPrestamo/pelicula">
                         <xsl:if test="saga[not(.=preceding::saga)]">
                            <li class="hoversuave">
                                <xsl:value-of select="saga"/>
                            </li>
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:for-each select="biblioteca/objetosEnPrestamo/videojuego">
                        <xsl:if test="saga[not(.=preceding::saga)]">
                            <li class="hoversuave">
                                <xsl:value-of select="saga"/>
                            </li>
                        </xsl:if>
                    </xsl:for-each>
                </ol>

                <h2>Libros por autor</h2>
                <ul>
                    <xsl:for-each select="biblioteca/objetosEnPrestamo/libro">
                        <xsl:if test="autor[not(.=preceding::autor)]">
                            <li class="hoversuave">
                                <xsl:value-of select="autor"/>
                            </li>
                        </xsl:if>
                    </xsl:for-each>
                </ul>

                <h2>Socios de honor</h2>
                <ul id="sinIcono">
                    <xsl:for-each select="biblioteca/socios/socio">
                        <li>
                            <xsl:value-of select="codigoSocio"/> - 
                            <xsl:value-of select="nombreCompleto"/>
                        </li>
                    </xsl:for-each>
                </ul>
                </div>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>