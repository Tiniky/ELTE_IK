#replace használata

Get-Content .\bemenet.txt | % {
    $_.replace("kukac", "@").replace("pont",".").replace(" ","") | Tee-Object -Append ki.txt
}