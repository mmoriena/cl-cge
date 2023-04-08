#!/usr/bin/env bash
########################################################################################
# Script para arrancar pg activity      Jorge Obiols <jorge.obiols@gmail.com>
# rev 20220330

# base de datos
sudo docker run --rm -it \
    --link pg-cge \
    rsmnarts/pg_activity -U odoo -h pg-cge -d cge_prod
