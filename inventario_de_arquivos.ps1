$campos = "FullName,Name,Extension,Length,CreationTime,LastAccessTime,LastWriteTime,Owner,Hash"
$csv = "./csv/geoinfo_nas_folder_pwshell.csv"
$campos > $csv
. ./env.ps1

$files = Get-ChildItem -Path $target -Recurse -Depth 10000

ForEach ($file in $files) {
    [array]$f = $file.FullName,
         $file.Name,
         $file.Extension,
         $file.Length,
         $file.CreationTime.ToString('yyyy-MM-ddTHH:mm:ss'),
         $file.LastAccessTime.ToString('yyyy-MM-ddTHH:mm:ss'),
         $file.LastWriteTime.ToString('yyyy-MM-ddTHH:mm:ss'),
         (Get-Acl $file.FullName).Owner,
         (Get-FileHash $file.FullName -Algorithm MD5).Hash
         [string]$linha = $f -join ","
         Add-Content -Path $csv -Value $linha
         echo $file.FullName
}