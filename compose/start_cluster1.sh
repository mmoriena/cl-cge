#!/usr/bin/env bash
########################################################################################
# Script para arrancar el cluster CGE      Jorge Obiols <jorge.obiols@gmail.com>
# rev 20220222

sd rmall

# base de datos
sudo docker run -d \
    -p 5432:5432 \
    -e POSTGRES_USER=odoo \
    -e POSTGRES_PASSWORD=odoo \
    -v /odoo_ar/odoo-13.0/cge/postgresql/:/var/lib/postgresql/data \
    -v /odoo_ar/odoo-13.0/cge/config/:/etc/postgresql/config \
    -c config_file=/etc/postgresql/config/postgresql.conf \
    --restart=always \
    --name postgres \
    postgres:11.15-alpine



# pgadmin4
 sudo docker run -d \
     -p 80:80 \
     --link postgres:db \
     --restart=always \
     --name pgadmin4 \
     -e PGADMIN_DEFAULT_EMAIL=odoo@odoo.com \
     -e PGADMIN_DEFAULT_PASSWORD=odoo \
     dpage/pgadmin4

# Odoo Master
# sudo docker run -d \
#     -p 8069:8069 \
#     -p 8072:8072 \
#     -v /odoo_ar/odoo-13.0/cge/config:/opt/odoo/etc/ \
#     -v /odoo_ar/odoo-13.0/cge/data_dir:/opt/odoo/data \
#     -v /odoo_ar/odoo-13.0/cge/log:/var/log/odoo \
#     -v /odoo_ar/odoo-13.0/cge/sources:/opt/odoo/custom-addons \
#     -v /odoo_ar/odoo-13.0/cge/backup_dir:/var/odoo/backups/ \
#     --link postgres:db \
#     --restart=always \
#     --name odoo-MT \
#     jobiols/odoo-jeo:13.0 --logfile=/var/log/odoo/odoo.log

# Odoos Esclavos
# for QTY in 01
# do
#     sudo docker run -d \
#         --name odoo-$QTY \
#         -p 80$QTY:80$QTY \
#         -v /odoo_ar/odoo-13.0/cge/log_$QTY:/var/log/odoo \
#         -v /odoo_ar/odoo-13.0/cge/config:/opt/odoo/etc/ \
#         -v /odoo_ar/odoo-13.0/cge/data_dir:/opt/odoo/data \
#         -v /odoo_ar/odoo-13.0/cge/sources:/opt/odoo/custom-addons \
#         --link postgres:db \
#         --restart=always \
#         jobiols/odoo-jeo:13.0.slave --logfile=/var/log/odoo/odoo.log -p 80$QTY -c /opt/odoo/etc/odoo_slave.conf
# done

# Esperamos para que se estabilice el cluster
# sleep 5

# # activamos esclavos sobre la bd cge_prod
# for QTY in 01
# do
#     echo
#     echo "-----------------------------------Starting "$QTY
#     curl localhost:80$QTY/web?db=cge_prod
# done
