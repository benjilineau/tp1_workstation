#Script permettant à un utilisateur de vérouiller ou d'éteindre son pc après un temps transmis par Gelineau Benjamin 

$param = $args[0] #récupération de l'argument 0 pour déterminer la commande (lock ou shutdown)
$time = $args[1] #récupération de l'argument 1 pour déterminer le nombre de seconde(s) rentrée(s)

if ($param -eq 'shutdown') { 
    if ($time){
        if ($time -is [int]) {
            Write-Host 'Vérouillage dans '$time ' secondes'
            Start-Sleep -Seconds $time #commande qui éteint le pc en foction du temps donné
            Stop-Computer #commande qui éteint le pc en foction du temps donné
        }
        else {
            Write-Host "un temps est nécessaire" 
        }
    }
    else {
        Write-Host 'you need to put a number : '
        Write-Host 'shutdown <time>'
    }
}
elseif ($param -eq 'lock') {
    if ($time) {
        if ($time -is [int]) {
            Write-Host ' Votre pc va être vérouillé dans '$time' secondes'
            Start-Sleep -Seconds $time
            rundll32.exe user32.dll,lockWorkStation #commande qui vérouille le pc en foction du temps donné
        }
        else {
            Write-Host 'non valide' 
        }
    }
    else {
        Write-Host 'Rentrer un chiffre'
        Write-Host 'lock <time>'
    }
}
else{
    Write-Host 'Rentrer un chiffre'
    Write-Host 'shutdown <time>''lock <time>'
}