#!/bin/bash
#Menu de opciones
echo "Menu de Instalacion CRM odoo"

 function op1 ()
{
                echo "###################################"
                echo "Actualizando lista de repositorio de paquetes"
                echo "####################################"
                clear
                sudo apt-get update
                sudo apt-get upgrade -y
                echo "------------------------------------"
                echo "Paquetes actualizados"
                echo "------------------------------------"
}
 function op2 ()
{
                echo "####################################"
                echo "Creacion de usuario en linux"
                echo "####################################"
                clear
                sudo adduser odoo
                sudo adduser odoo sudo
                echo "------------------------------------"
                echo "Usuario Creado"
                echo "------------------------------------"
                echo "#################################"
                echo "Instalando Servicio apache"
                echo "#################################"
                sudo apt-get install apache2
                echo "------------------------------------"
                echo "Servicio Apache Instalado"
                echo "------------------------------------"
                echo "#################################"
                echo "Instalando Servicio php"
                echo "#################################"
                sudo apt-get install php7.4 php7.4-curl php-cli php-mbstring php7.4-mcrypt php7.4-bcmatch php7.4-gd php7.4-pgsql php7.4-xml php7.4-zip php7.4-mysql
                echo "------------------------------------"
                echo "Servicio php Instalado"
                echo "------------------------------------"
                echo "#################################"
                echo "Instalando Servicio PostgreSQL"
                echo "#################################"
                sudo apt-get install postgresql postgresql-client -y
                echo "------------------------------------"
                echo "Instalacion finalizada"
                echo "------------------------------------"
                echo "##################################################"
                echo "Creacion de usuario y DB en PostgreSQL"
                echo "##################################################"
                clear
                sudo su - postgres -c "createuser --createdb --pwprompt odoo"
                sudo su - postgres -c "exit"
                echo "------------------------------------"
                echo "Usuario y DB creados"
                echo "------------------------------------"
                echo "##################################################"
                echo "Instalacion de dependecias"
                echo "##################################################"
                sudo apt-get install python3-pip xfonts-75dpi xfonts-base libxrender1 libjpeg-turbo8 fontconfig -y
                echo "------------------------------------"
                echo "Dependencia instalada"
                echo "------------------------------------"
                echo "##################################################"
                echo "Instalacion de libreria wkhtml2pdf"
                echo "##################################################"
                cd /tmp
                wget "https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.focal_arm64.deb"
                sudo dpkg -i wkhtmltox_0.12.6-1.focal_arm64.deb
                echo "------------------------------------"
                echo "Libreria descargada"
                echo "------------------------------------"
                echo "##################################################"
                echo "Copiando binarios"
                echo "##################################################"
                sudo cp /usr/local/bin/wkhtmltoimage /usr/bin/wkhtmltoimage
                sudo cp /usr/local/bin/wkhtmltopdf /usr/bin/wkhtmltopdf
                echo "##################################################"
                echo "Descargando repositorio odoo"
                echo "##################################################"
                wget -O - https://nightly.odoo.com/odoo.key | apt-key add -
                sudo su echo "deb http://nightly.odoo.com/15.0/nightly/deb/ ./" >> /etc/apt/sources.list.d/odoo.list
                sudo apt update
                sudo mkdir /var/lib/odoo
                sudo apt install odoo -y
                echo "------------------------------------"
                echo "Instalacion Finalizada"
                echo "------------------------------------"

}
opcion=0
while test $opcion != 3
do
            echo "************************************************************"
            echo "Opcion 1: Actualizar lista de repositorio de paquetes"
            echo "Opcion 2: Instalar Odoo CRM"
            echo "Opcion 3: Salir"
            echo "************************************************************"
            read opcion

            case $opcion in
                        1) op1;;
                        2) op2;;
                        3) exit;;
                        *) echo "la opcion no es correcta"
            esac
done
