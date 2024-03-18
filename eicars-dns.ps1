# Define the domain name to lookup
$domain = "labsaya.site"

# Run nslookup with the "-type=TXT" option to query for TXT records and capture the output
$nslookupOutput = nslookup -type=TXT $domain

# Extract strings inside double quotes
$quotedStrings = $nslookupOutput | Where-Object { $_ -match '"(.*?)"' } | ForEach-Object { $matches[1] }

# Define the path to save the output file
$outputFilePath = "nslookup_quoted_strings.txt"

# Save the extracted quoted strings to a text file
$quotedStrings | Out-File -FilePath $outputFilePath

# Display a message indicating where the output file is saved
Write-Host "Quoted strings from TXT record saved to: $outputFilePath"
