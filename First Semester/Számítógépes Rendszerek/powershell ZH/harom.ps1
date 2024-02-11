param(
        [Parameter(Position = 0, mandatory = $true)]
        $path
)

$Files = Get-ChildItem $path
$Files

$Files | % {
    if($_ -is [System.IO.DirectoryInfo]){
    Get-ChildItem $_
    }
}