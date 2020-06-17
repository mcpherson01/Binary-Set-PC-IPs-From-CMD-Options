---> Continue with defined Variable ($I or others, can be a unique change in script which can be cloned for options)
$I= Read-Host -Prompt "Text Whatever"

$IP = "IP"
$SM = "SUBNET"
$DG = "IP.IP.$I.IP"


$static = $IP,$SM,$DG
netsh interface ip set address "Local Area Connection" static $static

 
