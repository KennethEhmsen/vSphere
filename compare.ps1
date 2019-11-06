$file = "report.csv"
$report = Import-Csv $file

$success = $report | Where-Object { $_.status -eq "0" } | Sort-Object -Unique "server"
$fail = $report | Where-Object { $_.status -gt "0" } | Sort-Object -Unique "server"

$compare = Compare-Object -ReferenceObject $fail.server -DifferenceObject $success.server

foreach ($s in $success) {
    if ($fail | Where-Object { $_.server -match $s.server }) {
        [PSCustomObject]@{
            Server = $s.server
            Status = "fail"
        }
    }
    else {
        [PSCustomObject]@{
            Server = $s.server
            Status = "success"
        }
    }
}

foreach ($c in $compare) {
    if ($c.sideIndicator -eq '<=') {
        [PSCustomObject]@{
            Server = $c.InputObject
            Status = "fail"
        }
    }
}