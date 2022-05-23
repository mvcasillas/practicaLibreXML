<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- <xsl:output method="html" encoding="utf-8" indent="yes" /> -->

<xsl:template match="/">
    <!-- <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text> -->
        <html lang="es-ES">
            <!-- <head>
                <meta charset="utf-8"/>
                    <title>La biblioteca más rara que has visto en tu vida</title>
                    <link rel="stylesheet" media="screen" href="estilos.css"/>
                    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                    <meta name="author" content="María C"/>
                    <meta name="description" content="Ejercicio libre XML"/>
            </head> -->
            <body>
                <h1>Contenido de la biblioteca</h1>
                <table class="tabla">
                    <tr>
                        <th>Producto</th>
                        <th>Título</th>
                    </tr>
                    <xsl:for-each select="biblioteca/objetosEnPrestamo">
                    <tr>
                        <xsl:if test="type==libro">
                            <td>Libro</td>
                        </xsl:if>
                        <xsl:if test="type==pelicula">
                            <td>Libro</td>
                        </xsl:if>
                        <xsl:if test="type==videojuego">
                            <td>Libro</td>
                        </xsl:if>
                        <td><xsl:value-of select="titulo"/></td>
                    </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>


</xsl:stylesheet>