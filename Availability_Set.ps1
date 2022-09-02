param(
   [Parameter(Mandatory=$true)][string] $RGName,
   [Parameter(Mandatory=$true)][string] $AvailabilitySet
)
$ErrorActionPreference = "Stop"
[Console]::ResetColor()
$scriptName = $MyInvocation.MyCommand.Name
write-host "========================================================="
write-host Availability Set: $AvailabilitySet
write-host Resource Group: $RGName
Write-Host "=========================================================="

#Checking resourcegroup status. if exits or not
# $VMStatus = az vm list -d -o table --query "[?name=='$VmName']"
$AvailabilityStatus = az vm availability-set list -g $RGName
#write-Host $VmName already exists.
if($AvailabilityStatus -eq $true){

   Write-Host No Availability Sets found.
  
}
else{  
        Write-host Missing Logic..
 }
 #======================
Write-Host "End of Script ($ScriptName)"
