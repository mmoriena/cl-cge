##############################################################################
#
#    Copyright (C) 2021  Quilsoft
#    All Rights Reserved.
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as
#    published by the Free Software Foundation, either version 3 of the
#    License, or (at your optiogitn) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
##############################################################################

{
    'name': 'cge16',
    'version': '16.0.1.0.0',
    'category': 'Tools',
    'summary': "Proyecto CGE",
    'author': "jeo Software",
    'website': 'http://github.com/jobiols/cl-test',
    'license': 'AGPL-3',
    'depends': [
        'om_hr_payroll',
        'custom_cge',
        'sage_data_import',
        'web_responsive',
        'contacts',
        'concept_compare_report',
        'cge_multiproc',
        'import_bc',
        'payroll_embargo',
        'office_reports',
        'hr_income_tax',

        # externos
        'auto_backup',  # poner el backup en: /var/odoo/backups/
        ],
    'installable': True,

    # Aca empiezan las extensiones

    'env-ver': '2',
    'odoo-license': 'CE',
    'prod_server': 'jorge@cge_prod',
    'config': [
        'limit_memory_hard = 2684354560',
        'limit_memory_soft = 2147483648',
        'limit_time_cpu = 20000',
        'limit_time_real = 20000',
        'limit_time_real_cron = -1',
        'max_cron_threads = 2',
        'workers = 6',
    ],

    'port': '8069',

    'git-repos': [
        'git@github.com:quilsoft-org/cl-cge.git',
        'git@github.com:quilsoft-org/CGE.git',
        # 'git@github.com:quilsoft-org/third-party-modules.git',
        'git@github.com:odoomates/odooapps.git'
        'https://github.com/OCA/hr oca-hr',
        'https://github.com/OCA/web oca-web',
        'https://github.com/OCA/server-tools oca-server-tools',
        'https://github.com/ingadhoc/account-financial-tools ingadhoc-account-financial-tools',
    ],

    # list of images to use in the form 'name image-url'
    'docker-images': [
        'odoo jobiols/odoo-jeo:16.0',
        'postgres jobiols/postgres:14.2-cge',
        'nginx nginx'
    ]
}
