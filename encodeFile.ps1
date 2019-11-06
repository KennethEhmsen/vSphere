$path = 'image.png'

$image = [convert]::ToBase64String((get-content $path -encoding byte))

$html = Write-Output "<img width=300 alt=Embedded Image src=data:image/png;base64,$image />"

$html | Out-File test.html 


