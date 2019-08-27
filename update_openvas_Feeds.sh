#!/bin/bash
#### Atualizar feeds de no Openvas 
#### 
echo "Updating OpenVas Feeds"

####  sync das bases de notificação 

    /usr/sbin/greenbone-nvt-sync ;
    /usr/sbin/greenbone-certdata-sync;
    /usr/sbin/greenbone-scapdata-sync;

### Atualização de portas via IANNA 
    echo "Updating Ports"
    wget -q http://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xml -O /tmp/ports.xml
    openvas-portnames-update /tmp/ports.xml

    
####  Restart dos serviços do openvas
    /usr/sbin/openvasmd –update –verbose –progress;
    /etc/init.d/openvas-manager restart;
    /etc/init.d/openvas-scanner restart;

## Atualização NVT / SCAP / CERT
echo " .::Atualização Executada ::. "




