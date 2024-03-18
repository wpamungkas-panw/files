@echo off
setlocal enabledelayedexpansion

rem Define the domain name to lookup
set "domain=labsaya.site"

rem Run nslookup with the "-type=TXT" option to query for TXT records and capture the output
for /f "delims=" %%i in ('nslookup -type=TXT %domain% 2^>nul') do (
    rem Extract strings inside double quotes
    echo %%i | findstr /r /c:"\".*\"" > nul
    if !errorlevel! equ 0 (
        echo %%i | findstr /r /c:"\".*\"" | findstr /v /c:"Non-authoritative" >> nslookup_quoted_strings.txt
    )
)

rem Display a message indicating where the output file is saved
echo Quoted strings from TXT record saved to: %cd%\nslookup_quoted_strings.txt

endlocal
