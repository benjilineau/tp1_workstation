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
volume 0 : partition liée au stockage de données basique

volume 1 : L'outils Winretools est la partition sur   laquelle le système démarre pour les outils de      réparation en cas de problèmes avec le système. 

volume 2 : Elle sert à dupliquer le contenu intégral ou certaines partitions du disque dur afin d’obtenir une copie de sauvegarde. Les fichiers copiés peuvent ensuite être enregistrés sur un autre support : clé USB, CD/DVD, disque dur externe, etc.

volume 3 : Récupère les préférences d'utilisations sur l'ordinateur.

volume 4 :  esp une partition système qui contient les informations de démarrage du système d'exploitation sur les disques GPT et ordinateur en Bios UEFI.


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

* commande utilisée : "tasklist"

```
wininit.exe                    852 Services                   0     6 764 Ko
svchost.exe                   1732 Services                   0     7 808 Ko
WmiPrvSE.exe                  7268 Services                   0    29 552 Ko
rundll32.exe                  4716 Console                    2     9 312 Ko
fontdrvhost.exe               1204 Services                   0     2 768 Ko
```
 Wininit.exe est responsable de l'exécution du processus d'initialisation Windows.

svchost.exe est un important processus Windows associé avec le service de systèmes Windows. Ce processus exécute des Bibliothèques de liens dynamiques

Le processus wmiprvse.exe (wmiprvse signifiant Microsoft Windows Management Instrumentation ) est un processus générique permettant la gestion des clients sous Windows XP.

RunDLL est un utilitaire de ligne de commande Windows. et un composant Windows essentiel.

Le fichier authentique fontdrvhost.exe est un composant logiciel de Windows font driver management de Microsoft.
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
  

# Scripting

## script 1

- Le script suivant doit afficher quelques informations générales sur le pc 

```
#Script qui retourne un résumé du systeme par Gelineau Benjamin B1-A 19/10/2020

#Présentation global
$espace = "`n"
$inforam = $espace + 'INFORMATIONS GENERAL SUR LA RAM: ' + $espace
$infogenpc = $espace + 'INFORMATIONS GENERAL SUR LE PC: ' + $espace
$infousers = $espace + 'VOICI LES UTILISATEURS DE CE PC: ' 
$infodiskdur = $espace + 'INFORMATIONS SUR LE STOCKAGE DU PC: ' + $espace
$infoping = $espace + 'VOICI LE TEST DU PING: ' + $espace
#$infospeedtest: $espace + 'speed test: ' +$espace

#OS info 
$OSInfo = Get-WmiObject Win32_OperatingSystem | Select Caption, Version, CSName

#get pour la ram
$RAMinfo = Get-CIMInstance Win32_OperatingSystem | Select FreePhysicalMemory,TotalVisibleMemory,LastBootUpTime

#IP principale 
$IPAddress = Get-WmiObject Win32_NetworkAdapterConfiguration | Where-Object {$_.Ipaddress.length -gt 1} 
$ipout = 'ip : '+$IPAddress.ipaddress[0]

#Nom de la machine
$name = 'Name : '+ $OSInfo.CSName

#OS name + version
$OSname = 'OS : '+ $OSInfo.Caption
$OSversion = 'Version : ' + $OSInfo.Version

$date = 'boot depuis: ' + $RAMinfo.LastBootUpTime

#write tout
Write-Output $infogenpc,$ipout,$name,$OSname,$OSversion,$date

#ajouroupas
$uptimemaj = '10.0.19041' #déclaration de la version à jour
$up = 'version à jour: true'
$down = 'version à jour : false'
If ($uptimemaj -eq $OSInfo.Version) #comparaison avec ma version de l'os
{
    Write-Output $up
}
Else {
    Write-Output $down
}

Write-Output $inforam

#ram usagée
$memory1 = $Mem - $memory2
$usedram = 'Used : ' + $memory1  + ' Gi'
$cs = get-wmiobject -class "Win32_ComputerSystem"
$Mem = [math]::Ceiling($cs.TotalPhysicalMemory / 1024 / 1024 / 1024)

#ram libre
$memory2 = $RAMinfo.FreePhysicalMemory * 1.0E-6
$freeram = 'Free : ' + $memory2 + ' Gi'
Write-Output $usedram,$freeram,$infousers



#listutilisateur
Get-LocalUser | select Name
Write-Output $infodiskdur


#espacedisque
$disk = Get-WmiObject Win32_LogicalDisk -ComputerName localhost -Filter "DeviceID='C:'" |
Select-Object Size,FreeSpace

$utilisédisk = $disk.size - $disk.FreeSpace #calcul de l'espace utilisé sur le disque dur physique principale
$convutilisédisk = 'disk used: ' + [math]::Ceiling($utilisédisk / 1024 / 1024 / 1024) + ' G' #conversion en go

$convrestant = 'memory free: ' + [math]::Ceiling($disk.FreeSpace / 1024 / 1024 / 1024) + ' G' 

Write-Output $convutilisédisk, $convrestant,$infoping


#ping
$rep_time = (Test-Connection -ComputerName "8.8.8.8" -Count 1  | measure-Object -Property ResponseTime -Average).average
$ping = 'test du ping :' +  $rep_time + 'ms'
Write-Output $ping

#speedtest
#$a=Get-Date; Invoke-WebRequest http://client.akamai.com/install/test-objects/10MB.bin|Out-Null; "$((10/((Get-Date)-$a).TotalSeconds)*8) Mbps"

```

- Et sont Output : 

```
INFORMATIONS GENERALES SUR LE PC: 

ip : 192.168.0.15
Name : DESKTOP-ON7BJGL
OS : Microsoft Windows 10 Professionnel
Version : 10.0.19041
boot depuis: 10/16/2020 01:15:00
version à jour: true

INFORMATIONS GENERAL SUR LA RAM: 

Used : 7.192708 Gi
Free : 8.809424 Gi

VOICI LES UTILISATEURS DE CE PC: 

Name              
----              
Administrateur    
Benjamin          
DefaultAccount    
Invité            
WDAGUtilityAccount

INFORMATIONS SUR LE STOCKAGE DU PC: 

disk used: 151 G
memory free: 786 G

VOICI LE TEST DU PING: 

test du ping :17ms
```

## Scripting 2

- Voir dans les fichers du git.

# Gestion de soft

- L'interet d'un gestionnaire de paquets est qu'il automatise le processus d'installation mais aussi de désinstallation. De plus il permet de mettre à jour toutes les applications avec une simple commande ou d'installé une version antérieur d'un logiciel ce qui n'est pas toujours disponible sur internet. Le téléchargement est aussi 

- Un gestionnaire de paquets est aussi intéressant au niveau sécurité car sur internet nous pouvons télécharger des logiciels de pleins de sources différentes et donc potentiellement contenant des malwares. Ceci est moins possible avec un gestionnaire de paquets car il n'y a qu'une source généralement pour un logiciel.

- Pour finir l'identité de la personne téléchargant est protégé car la demande de téléchargement passe par un serveur tiers contrairement sur internet ou notre ip est accessible par le site web.

## Nombre de paquets

- commande utilisé pour obtenir la liste des paquets installés : "choco list -l"

```
Chocolatey v0.10.15
chocolatey 0.10.15
1 packages installed.
```
- La commande utilisé pour trouver la provenance d'un packet est : "choco info + nom du paquet"

## Connection à la machine virtuelle

- Commande utilisée sur powershell : " ssh root@192.168.120.50"

```
PS C:\Users\Benjamin> ssh root@192.168.120.50
root@192.168.120.50's password:
Last login: Thu Nov 12 14:50:57 2020
[root@tpworstation ~]#
```

- Pour le partage de fichier entre ma vm et mon pc, j'ai tout d’abord activé le « support de partage smb CIFS » dans le « panneau de configuration », « désinstaller un programme », « Activer ou désactiver des fonctionnalités Windows. ».

![](https://i.imgur.com/Dj3Fuxq.png)

- Puis j’ai créé un fichier share sur mon bureau, j’ai fait un clic droit « propriété », « partager », « partage avancé », valider la case « partager se ficher » puis « autorisation » et cocher contrôle totale pour tous les utilisateurs.

![](https://i.imgur.com/1kyDZ0f.png)

- Je suis ensuite aller dans virtualbox, j’ai tapé la commande : ```yum install -y cifs-utils```
![](https://i.imgur.com/67bMiCU.png)
- Puis j’ai créé le dossier ou on accèdera au partage : ```mkdir /opt/partage```
 ![](https://i.imgur.com/XbmnQ0j.png)
- Je suis retourné sur mon powershell connecté à ma vm puis je lance la commande :``` mount -t cifs -o username=Benjamin,password=mdpcaché //192.168.120.1/share /opt/partage```
![](https://i.imgur.com/dsBpVo8.png)
- Et pour vérifier si le dossier test.txt que j'ai crée dans le dossier share un fichier test.txt puis j'ai lancé la commande ls.
![](https://i.imgur.com/xbsRnNl.png)

