$file = "data.json"
$configfile = $file
$Configs = Get-Content -Raw -Path $ConfigFile -ErrorAction Continue | ConvertFrom-Json -ErrorAction Continue

foreach ($item in $Configs[0].PSObject.Properties) {
    Set-Variable -Name ('__{0}' -f $item.Name) -Value ($Configs | Select-Object -ExpandProperty $($item.Name))
}

$values = Get-Variable -Name '__*'

foreach ($value in $values.value) {
    $value.displayname
}