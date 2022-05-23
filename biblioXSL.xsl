<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- <xsl:output method="html" encoding="utf-8" indent="yes" /> -->

<xsl:template match="/">
    <!-- <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text> -->
        <html>
            <head>
                <title>La biblioteca más rara que has visto en tu vida</title>
                <link rel="stylesheet" type="text/css" href="estilos.css"/>
            </head>
            <body>
                <h1>Contenido de la biblioteca</h1>
                <table class="tabla">
                    <tr>
                        <th>Producto</th>
                        <th>Título</th>
                        <th>Año</th>
                        <th></th>
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
                                    <xsl:for-each select="biblioteca/objetosEnPrestamo/pelicula/director">
                                        
                                        aaaa
                                    </xsl:for-each>
                                </td>
                            </tr>
                    </xsl:for-each>
                    <xsl:for-each select="biblioteca/objetosEnPrestamo/videojuego">
                            <tr>
                                <td>Videojuego</td>
                                <td>
                                    <xsl:value-of select="titulo"/>
                                </td>
                                <td>
                                    <xsl:value-of select="fecha"/>
                                </td>
                            </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>


</xsl:stylesheet>