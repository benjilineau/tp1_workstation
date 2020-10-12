selffootprinting
================

Host OS
-------
-   info trouvé avec la commande systeminfo

```
Nom de l’hôte:                              DESKTOP-ON7BJGL
Nom du système d’exploitation:              Microsoft Windows 10 Professionnel
Version du système:                         10.0.19041 N/A version 19041
Fabricant du système d’exploitation:        Microsoft Corporation
Processeur(s):                              1 processeur(s) installé(s).
                                            [01] : Intel64 Family 6 Model 165 Stepping 2 GenuineIntel ~2592 MHz
[...]
Mémoire virtuelle : taille maximale:        18 558 Mo
Mémoire virtuelle : disponible:             6 463 Mo
Mémoire virtuelle : en cours d’utilisation: 12 095 Mo
```


devices
-------

* command utilisé : "Get-WmiObject -Class Win32_Processor | Select-Object -Property Name, Number*"
```
Name                                      NumberOfCores NumberOfEnabledCore NumberOfLogicalProcessors
----                                      ------------- ------------------- -------------------------
Intel(R) Core(TM) i7-10750H CPU @ 2.60GHz             6                   6                        12Name              : Intel(R) Core(TM) i7-10750H CPU @ 2.60GHz 
(i7 = la gamme ; 10 = géneration ; H = "haute performance")
SocketDesignation : CPU 1
```


*  commande utilisé :"Get-WmiObject win32_VideoController"
```
Description                  : Intel(R) UHD Graphics
DeviceID                     : VideoController1
[...]
Description                  : NVIDIA GeForce GTX 1650 Ti
DeviceID                     : VideoController2
[...]
```

*  commande utilisé :"diskpart" , "sel disk 0" puis "detail disk" 

```

marque et modele disque dur : PC611 NVMe SK hynix 1TB
[...]
* les différentes partitions

  N° volume   Ltr  Nom          Fs     Type        Taille   Statut     Info
  ----------  ---  -----------  -----  ----------  -------  ---------  --------
  Volume 0     C   OS           NTFS   Partition    936 G   Sain       Démarrag
  Volume 1         WINRETOOLS   NTFS   Partition    990 M   Sain
  Volume 2         Image        NTFS   Partition     15 G   Sain
  Volume 3         DELLSUPPORT  NTFS   Partition   1400 M   Sain
  Volume 4         ESP          FAT32  Partition    190 M   Sain       Système
  ```


# users

* commande utilisé: "net user"

```
comptes d’utilisateurs de \\DESKTOP-ON7BJGL

-------------------------------------------------------------------------------
Administrateur           Benjamin    (full admin)             DefaultAccount
Invité                   WDAGUtilityAccount
La commande s’est terminée correctement.
```

# Processus

* tasklist

```
wininit.exe // initialisation du windows

```

# Network

* commande utilisé pour trouver les infos sur mes catres réseaux : "systeminfo"
```
[...]
Carte(s) réseau:2 carte(s) réseau installée(s).

[01]: Killer(R) Wi-Fi 6 AX1650s 160MHz Wireless Network Adapter (201D2W) // carte servant à se connecter au wifi

[...]
[02]: Bluetooth Device (Personal Area Network)
Nom de la connexion : Connexion réseau Bluetooth //carte servant à connecter l'appareil en bluetooth
```
* commande utilisé pour trouver les ports tcp et udp en utilisations et les applications qui les utilisent: "nestat -a -b"

```
 Proto  Adresse locale         Adresse distante       État
  TCP    0.0.0.0:135            adclick:0              LISTENING
  RpcSs
 [svchost.exe]
  TCP    0.0.0.0:445            adclick:0              LISTENING
 Impossible d’obtenir les informations de propriétaire
  TCP    0.0.0.0:808            adclick:0              LISTENING
 [OneApp.IGCC.WinService.exe]
  TCP    0.0.0.0:5040           adclick:0              LISTENING
  CDPSvc
 [svchost.exe]
  TCP    0.0.0.0:5700           adclick:0              LISTENING
 Impossible d’obtenir les informations de propriétaire
  TCP    0.0.0.0:49664          adclick:0              LISTENING
 [lsass.exe]
  TCP    0.0.0.0:49665          adclick:0              LISTENING
 Impossible d’obtenir les informations de propriétaire
  TCP    0.0.0.0:49666          adclick:0              LISTENING
  EventLog
 [svchost.exe]
  TCP    0.0.0.0:49667          adclick:0              LISTENING
  Schedule
 [svchost.exe]
  TCP    0.0.0.0:49668          adclick:0              LISTENING
 [spoolsv.exe]
  TCP    0.0.0.0:49671          adclick:0              LISTENING
 Impossible d’obtenir les informations de propriétaire
  TCP    127.0.0.1:6463         adclick:0              LISTENING
 [Discord.exe]
  TCP    127.0.0.1:8884         adclick:0              LISTENING
 Impossible d’obtenir les informations de propriétaire
  TCP    127.0.0.1:9012         adclick:0              LISTENING
 [SupportAssistAgent.exe]
  TCP    127.0.0.1:50710        adclick:0              LISTENING
 [DSAPI.exe]
  TCP    127.0.0.1:52664        DESKTOP-ON7BJGL:65001  ESTABLISHED
 [nvcontainer.exe]
  TCP    127.0.0.1:52665        adclick:0              LISTENING
 [NVIDIA Web Helper.exe]
  TCP    127.0.0.1:52665        DESKTOP-ON7BJGL:53810  ESTABLISHED
 [NVIDIA Web Helper.exe]
  TCP    127.0.0.1:53810        DESKTOP-ON7BJGL:52665  ESTABLISHED
 [NVIDIA Share.exe]
  TCP    127.0.0.1:65001        adclick:0              LISTENING
 [nvcontainer.exe]
  TCP    127.0.0.1:65001        DESKTOP-ON7BJGL:52664  ESTABLISHED
 [nvcontainer.exe]
  TCP    192.168.0.15:139       adclick:0              LISTENING
 Impossible d’obtenir les informations de propriétaire
  TCP    192.168.0.15:49445     40.67.251.132:https    ESTABLISHED
  WpnService
 [svchost.exe]
  TCP    192.168.0.15:54571     162.159.134.234:https  ESTABLISHED
 [Discord.exe]
  TCP    192.168.0.15:54585     23.97.215.12:https     ESTABLISHED
 [Skype.exe]
  TCP    192.168.0.15:54594     40.101.138.18:https    ESTABLISHED
 [OUTLOOK.EXE]
  TCP    192.168.0.15:54598     wn-in-f188:5228        ESTABLISHED
 [chrome.exe]
  TCP    192.168.0.15:54599     40.74.219.49:https     ESTABLISHED
  ```


