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
$AvailabilityStatus = Get-AzAvailabilitySet -ResourceGroupName $RGName -Name $AvailabilitySet
#write-Host $VmName already exists.
if( ! $AvailabilityStatus ){

   Write-Host No Availability Sets found.
  
}
else{  
        Write-host Need to create an Availability Set.
 }
 #======================
Write-Host "End of Script ($ScriptName)"
