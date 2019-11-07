<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 
<!--
    If adalah suatu perintah yang mengambil suatu kondisi
    sebagai parameter. Pada xml, if hanya bisa mengatasi satu kondisi
    lalu untuk mengatasi kondisi yang lain, maka kita harus membuat
    perulangan lagi.

    Simplify (in nutshell) for if in xml::

    perulangan {
        if (parameter) {
            Consequence...  //Hanya menampilkan data sesuai kondisi parameter;
        }
    }

    Sedangkan untuk choose, setiap kita memakai keyword choose,
    maka pasti akan menggunakan when sebagai kondisi, dan otherwise
    sebagai sesuatu di luar kondisi. Jadi, data yang masih diluar 
    kondisi masih bisa tetap ditampilkan tanpa perlu membuat
    perulangan baru.

    Simplify (in nutshell) for choose in xml::

    perulangan {
        switch(boolean parameter) {
            case (boolean1) : consequnce1
            case (boolean2) : consequence2
                        .
                        .
            case (boolean-n) : consequnce-n
            default: consequence-default mode;
        }
    }
-->

    <xsl:template match="/">
        <html>
            <body>
                <h1>LinuxDistro</h1>
                <table border="1px">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Base On</th>
                        <th>Desktop Environment</th>
                        <th>Super class</th>
                    </tr>
                    <!-- 
                        <xsl:for-each select="theLinux/distro">
                            <xsl:if test="Based='Ubuntu'"></xsl:if>
                            <tr>
                                <td><xsl:value-of select="Id"/></td>
                                <td><xsl:value-of select="Name"/></td>
                                <td><xsl:value-of select="Based"/></td>
                                <td style="
                                    color:whitesmoke;
                                    text-shadow:2px 3px 3px black;
                                    background-color:rgb(230, 149, 0);
                                "><xsl:value-of select="desktopEnvironment"/></td>
                                <td><xsl:value-of select="Class"/></td>
                            </tr>       
                        </xsl:for-each>
                    -->
                    <xsl:for-each select="theLinux/distro">
                        <tr>
                            <td><xsl:value-of select="Id"/></td>
                            <td><xsl:value-of select="Name"/></td>
                            <xsl:choose>
                                <xsl:when test="Based = 'Ubuntu' or Based = 'Knoppix' or Based = 'Debian'">
                                    <td bgcolor="orange">
                                        <xsl:value-of select="Based"/>
                                    </td>
                                </xsl:when>
                                <xsl:when test="Based = 'Arch'or Based = 'Manjaro'">
                                    <td bgcolor="skyblue">
                                        <xsl:value-of select="Based"/>
                                    </td>
                                </xsl:when>
                                <xsl:otherwise>
                                    <td bgcolor="green">
                                        <xsl:value-of select="Based"/>
                                    </td>
                                </xsl:otherwise>
                            </xsl:choose>
                            <td><xsl:value-of select="desktopEnvironment"/></td>
                            <td><xsl:value-of select="Class"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
	</xsl:template>
</xsl:stylesheet>
