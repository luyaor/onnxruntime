Get-ChildItem $Env:BUILD_BINARIESDIRECTORY\nuget-artifact -Filter *.zip | 
Foreach-Object {
 $cmd = "7z.exe x $($_.FullName) -y -o$Env:BUILD_BINARIESDIRECTORY"
 Write-Output $cmd
 Invoke-Expression -Command $cmd
}

New-Item -Path $Env:BUILD_BINARIESDIRECTORY\RelWithDebInfo\RelWithDebInfo -ItemType directory
New-Item -Path $Env:BUILD_BINARIESDIRECTORY\RelWithDebInfo\external\protobuf\cmake\RelWithDebInfo -ItemType directory

Copy-Item -Path $Env:BUILD_BINARIESDIRECTORY\onnxruntime-win-x64-*\lib\* -Destination $Env:BUILD_BINARIESDIRECTORY\RelWithDebInfo\RelWithDebInfo
Copy-Item -Path $Env:BUILD_BINARIESDIRECTORY\extra-artifact\protoc.exe $Env:BUILD_BINARIESDIRECTORY\RelWithDebInfo\external\protobuf\cmake\RelWithDebInfo
