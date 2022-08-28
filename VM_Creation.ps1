param(
    [Parameter(Mandatory=$true)][string] $RGName,
    [Parameter(Mandatory=$true)][string] $VMImage,
    [Parameter(Mandatory=$true)][string] $RVnetName,
    [Parameter(Mandatory=$true)][string] $SubnetName,
    [Parameter(Mandatory=$true)][string] $URN,
    [Parameter(Mandatory=$true)][string] $VMUname,
    [Parameter(Mandatory=$true)][string] $VMPwd,
    [Parameter(Mandatory=$true)][string] $VMSize
)
$ErrorActionPreference  = "stop"
[console]::ResetColor()
$ScriptName = $MyInvocation.MyCommand.Name

Write-host "----------------------------------------------------"
Write-Host resourcegroup name is $RGName
Write-host "----------------------------------------------------"
#Check RG Status
#$RGStatus = az network exists -n $RVnetName
Write-Host Hello VM 
#az vm create --resource-group $RGName --name $VMImage --image $URN --vnet-name $RVnetName --subnet $SubnetName --admin-username $VMUname --admin-password $VMPwd --size $VMSize
az vm create --resource-group $RGName --name $VMImage --image $URN --vnet-name $RVnetName --subnet $SubnetName --admin-username $VMUname --admin-password $VMPwd --size $VMSize
# if ($RGStatus -eq $true)
# {
#     az vm create --resource-group $RGName --name $VMImage --image $URN --vnet-name $RVnetName --subnet $SubnetName --admin-username $VMUname --admin-password $VMPwd --size $VMSize
# }
# else{
#     Write-Host Network $RGStatus already exists
# }
#======================
# Write-Host "End of Script ($ScriptName)"
