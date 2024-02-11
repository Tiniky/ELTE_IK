#eloszt két számot

param(
        [Parameter(mandatory = $true)][int]$szam1,
        [Parameter(mandatory = $true)][int]$szam2
)

trap [Exception]
{
    if($_.Exception.Message -eq "Kísérlet történt nullával való osztásra.")
    {
        return 0;
    }
    else
    {
        Write-Error $_.Exception.Message;
    }
}

$szam1/$szam2