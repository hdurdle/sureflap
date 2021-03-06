. ./Get-SureFlapToken.ps1

$uri = $endpoint + "/api/household"

$headers = @{}
$headers.Add("Authorization","Bearer $token" ) | Out-Null

$querystring = "?with[]=household&with[]=pet&with[]=users&with[]=timezone&with[]=children"

$uri += $querystring

$res = Invoke-RestMethod -Method Get -Uri $uri -Headers $headers -ContentType "application/json"
$res.data