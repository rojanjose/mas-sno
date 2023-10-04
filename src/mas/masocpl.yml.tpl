- hosts: localhost
  any_errors_fatal: true
  vars:
    mongodb_storage_class: ${MAS_STORAGE_CLASS}
    mongodb_storage_capacity_data: 5Gi
    mongodb_storage_capacity_logs: 2Gi
    mongodb_replicas: 1
    mas_channel: 8.10.x
    mas_workspace_name: "MAS Local"
    mas_instance_id: masdemo
    mas_workspace_id: maslocal
    mas_config_dir: /opt/app-root/src/masloc/masconfig
    ibm_entitlement_key: ${IBM_ENTITLEMENT_KEY} 
    sls_mongodb_cfg_file: /opt/app-root/src/masloc/masconfig/mongo-mongoce.yml
    bootstrap:
      license_id: ${LICENSE_ID}
      license_file: "/opt/app-root/src/masloc/license.dat"
    uds_storage_class: ${MAS_STORAGE_CLASS}
    uds_contact:
      email: 'nobody@nowhere.com'
      first_name: 'nobody'
      last_name: 'none'
      
    db2_instance_name: 'db2mas'
# Cannot set dbname due to a bug in create_ldap_user.yml
#    db2_dbname: 'maxdb'
    
    db2_data_storage_class: ${MAS_STORAGE_CLASS}
    db2_meta_storage_class: ${MAS_STORAGE_CLASS}
    db2_backup_storage_class: ${MAS_STORAGE_CLASS}
    db2_logs_storage_class: ${MAS_STORAGE_CLASS}
    db2_temp_storage_class: ${MAS_STORAGE_CLASS}
    
    db2_data_storage_accessmode: ReadWriteOnce
    db2_meta_storage_accessmode: ReadWriteOnce
    db2_backup_storage_accessmode: ReadWriteOnce
    db2_logs_storage_accessmode: ReadWriteOnce
    db2_temp_storage_accessmode: ReadWriteOnce

    db2_data_storage_size: 20Gi
    db2_meta_storage_size: 10Gi  
    db2_backup_storage_size: 10Gi  
    db2_logs_storage_size: 10Gi 
    db2_temp_storage_size: 10Gi
    
    db2_cpu_requests: 500m
    db2_memory_requests: 3Gi
    db2_ldap_username: 'maximo'
    db2_ldap_password: 'maximo'
    db2_username: 'maximo'
    
    mas_app_id: 'manage'
    mas_app_channel: 8.6.x
    mas_app_upgrade_strategy: 'Manual'
# This does not work at the moment and there is a workaround for it in the bat file
#   a defect has been open and this file will be updated when it will be fixed
#    mas_app_settings_demodata: 'true'
    mas_app_settings_aio_flag: 'false'

  roles:
    - ibm.mas_devops.ibm_catalogs
    - ibm.mas_devops.common_services
    - ibm.mas_devops.cert_manager
    - ibm.mas_devops.mongodb
    - ibm.mas_devops.sls
    - ibm.mas_devops.uds
    - ibm.mas_devops.db2
    - ibm.mas_devops.suite_db2_setup_for_manage
    - ibm.mas_devops.gencfg_workspace
    - ibm.mas_devops.suite_install
    - ibm.mas_devops.suite_config
    - ibm.mas_devops.suite_verify
    - ibm.mas_devops.suite_app_install
    - ibm.mas_devops.suite_app_config