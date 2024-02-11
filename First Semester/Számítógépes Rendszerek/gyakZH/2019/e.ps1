$Files = Get-ChildItem
$Files

$Files | % {
    if($_ -is [System.IO.DirectoryInfo]){
    Get-ChildItem $_
    }
}