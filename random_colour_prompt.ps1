function prompt {
    $time = ((Get-History)[-1].EndExecutionTime - (Get-History)[-1].StartExecutionTime).Totalmilliseconds
    $color = Get-Random -Min 1 -Max 16
    Write-Host ("$time ms | " + $(Get-Location) +">") -NoNewLine `
     -ForegroundColor $Color
    return " "
}

