#!/bin/bash
####################################
#
# Backup de ficheiros.
#
####################################
# Pastas e Ficheiros para fazer Backup (Separedo por espaços). 
backup_files="/PastaBackup"
#Destinos do Backup
dest2="/BCK_local"
# Nome para o ficheiro de Backup.
daySemana=$(date +%A)
dayDia=$(date +%F)
dayHoras=$(date +%R)
hostname=$(hostname -s)
fileName="TOTAL-$hostname-$daySemana-$dayDia_$dayHoras.tgz"
# MENSAGEM: Inicio de Backup.
echo "A INICIAR: Backup de: $backup_files"
#date
#echo
logger -i -s -p info -t 'Backup' "Inicio do Backup!"
#Criação do Ficheiro TAR e envio por SSH para outra máquina.
tar -cvpz $backup_files | ssh ubuntu@10.3.0.14 "(cat > /home/ubuntu/Backup/$fileName.tar.gz)"
#Criação do Ficheiro TAR para Armazenamento Externo.
tar -czvf  $dest2/$fileName $backup_files
# MANSAGEM: Fim de Backup.
#echo
echo "Backup terminado com sucesso"
echo "Realizado a:"
#date
logger -i -s -p info -t 'Backup' "Backup executado com sucesso!"

