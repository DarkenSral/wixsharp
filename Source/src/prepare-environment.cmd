@echo off
setlocal

set snk_name=WixSharpStrongName.snk
set is_new_snk=no

:: Check if the 'snk-folder' environment variable exists
if "%snk-folder%"=="" (
    echo Environment variable 'snk-folder' not found. Generating new SNK file...
    set snk-folder=.\
    set is_new_snk=yes
    :: Generate a new SNK file in the project root
    sn -k %snk_name%
) else (
    echo 'snk-folder' found: %snk-folder%
    
    :: Check if the SNK file exists in the specified folder
    if exist "%snk-folder%\%snk_name%" (
        echo Copying SNK file from '%snk-folder%' to project root...
    ) else (
        echo SNK file not found in '%snk-folder%'. Generating new one...
        sn -k %snk_name%
    )
)

echo SNK setup complete.
echo %snk-folder%%snk_name% 

copy %snk-folder%%snk_name% .\WixSharp.Msi\WixSharp.Msi\%snk_name% 
copy %snk-folder%%snk_name% .\WixSharp\%snk_name% 
copy %snk-folder%%snk_name% .\WixSharp.UI.WPF\%snk_name% 
copy %snk-folder%%snk_name% .\WixSharp.Test\%snk_name% 
copy %snk-folder%%snk_name% .\WixSharp.UI\%snk_name% 

if "%is_new_snk%"=="yes" (
    echo deleting temporary snk file...
    del %snk-folder%%snk_name%
)
endlocal


