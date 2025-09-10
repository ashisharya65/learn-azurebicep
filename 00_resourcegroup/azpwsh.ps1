$resourceGroupName = Read-Host "Enter the resource group name"
$location = Read-Host "Enter the location"
$deploymentName = Read-Host "Enter the deployment name"


Try {  
    $paramsplat = @{
        name = $deploymentName
        Location = $location
        resourceGroupName = $resourceGroupName
        TemplateFile = "$($PSScriptRoot)/main.bicep"
        ErrorAction = 'Stop'

    }

    Write-Output "`n The deployment is in progress..."
    New-AzSubscriptionDeployment @paramsplat 

}
Catch {
    $errmsg = $_.Exception.Message
    Write-Output $errmsg
}