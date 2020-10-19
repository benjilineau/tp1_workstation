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



