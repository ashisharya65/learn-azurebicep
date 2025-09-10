$resourceGroupName = Read-Host "Enter the resource group name"
$deploymentName = Read-Host "Enter the deployment name"
$environmentType = Read-Host "Enter the environment type - (prod/nonprod)"

$paramobject = @{
    environmentType = $environmentType
}

Try {  
    $paramsplat = @{
        Name = $deploymentName
        ResourceGroupName = $resourceGroupName
        TemplateFile = "$($PSScriptRoot)/main.bicep"
        TemplateParameterObject = $paramobject
        ErrorAction = 'Stop'

    }

    Write-Output "`n The deployment is in progress..."
    New-AzResourceGroupDeployment @paramsplat

}
Catch {
    $errmsg = $_.Exception.Message
    Write-Output $errmsg
}