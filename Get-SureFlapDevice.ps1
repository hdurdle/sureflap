param (
	[string]$tagID
)

. ./Get-SureFlapToken.ps1

$uri = $endpoint + "/api/device"

$headers = @{}
$headers.Add("Authorization","Bearer $token" ) | Out-Null

$querystring = "?with[]=children&with[]=tags&with[]=status&with[]=control"

$uri += $querystring

$res = Invoke-RestMethod -Method Get -Uri $uri -Headers $headers -ContentType "application/json"
$res.data

#$DecodedText = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($EncodedText))