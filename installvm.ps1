# param(
#     [Parameter(Mandatory=$true)][string] $RGLocation,
#     [Parameter(Mandatory=$true)][string] $RGName
# )
# $ErrorActionPreference  = "stop"
# [console]::ResetColor()
# $ScriptName = $MyInvocation.MyCommand.Name

# Write-host "----------------------------------------------------"
# Write-Host resourcegroup location is $RGLocation
# Write-Host resourcegroup name is $RGName
# Write-host "----------------------------------------------------"
# #Check RG Status
# $RGStatus = az group exists -n $RGName
# # az group create -l $RGLocation -n $RGName

# if ($RGStatus -eq $true)
# {
#     az group create -l $RGLocation -n $RGName
# }
# else{
#     Write-Host resourcegroup $RGName already exists
# }
# #======================
# Write-Host "End of Script ($ScriptName)"

param(
    [parameter(mandatory=$true)][string] $RgLocation,
    [parameter(mandatory=$true)][string] $RGName
)
$errorActionpreference= "stop"
[console]::Resetcolor()
$scriptName = $Myinvocation.Mycommand.Name
write-host "====================================================="
write-host resourcegrouplocation is $RgLocation
write-host resourcegroupname is $RGName
write-host "====================================================="

#checking resourcegroup status if exits or not
$RGStatus= az group exists -n $RGName
if($RGStatus -eq $false){
    write-host "creating resourcegroup"
    az group create -1 $RgLocation -n $RGName

}
else{
    write-host resourcegroup $RGName already exists
    
}
#====================================================
write-host "----------------------------------------"
write-host "-- script finished ($scriptName)"
write-host "-----------------------------------------"