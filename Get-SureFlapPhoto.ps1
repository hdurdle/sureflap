param (
	[string]$householdID
)

. ./Get-SureFlapHousehold.ps1

$uri = $endpoint + "/api/photo"

$headers = @{}
$headers.Add("Authorization","Bearer $token" ) | Out-Null

$res = Invoke-RestMethod -Method Get -Uri $uri -Headers $headers -ContentType "application/json"
$res.data