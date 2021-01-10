set PATH=%CD%;%PATH%
SETLOCAL EnableDelayedExpansion 
FOR /R %%i IN (*.nupkg) do (
   set filename=%%~ni
   IF NOT "!filename:~25,7!"=="Managed" (
	   mkdir runtimes\win-x86\native
	   mkdir runtimes\win-arm\native
	   mkdir runtimes\win-arm64\native
	   mkdir runtimes\linux-x64\native
	   mkdir runtimes\osx-x64\native
	   move onnxruntime-win-x86\lib\onnxruntime.dll runtimes\win-x86\native\onnxruntime.dll
	   move onnxruntime-win-x86\lib\onnxruntime.lib runtimes\win-x86\native\onnxruntime.lib
	   move onnxruntime-win-x86\lib\onnxruntime.pdb runtimes\win-x86\native\onnxruntime.pdb
       move onnxruntime-win-arm64\lib\onnxruntime.dll runtimes\win-arm64\native\onnxruntime.dll
       move onnxruntime-win-arm64\lib\onnxruntime.lib runtimes\win-arm64\native\onnxruntime.lib
       move onnxruntime-win-arm64\lib\onnxruntime.pdb runtimes\win-arm64\native\onnxruntime.pdb
	   move onnxruntime-win-arm\lib\onnxruntime.dll runtimes\win-arm\native\onnxruntime.dll
       move onnxruntime-win-arm\lib\onnxruntime.lib runtimes\win-arm\native\onnxruntime.lib
       move onnxruntime-win-arm\lib\onnxruntime.pdb runtimes\win-arm\native\onnxruntime.pdb
	   move onnxruntime-linux-x64\lib\libonnxruntime.so.1* runtimes\linux-x64\native\libonnxruntime.so
	   move onnxruntime-osx-x64\lib\libonnxruntime.*.dylib  runtimes\osx-x64\native\libonnxruntime.dylib
	   7z a  %%~ni.nupkg runtimes
   )
)