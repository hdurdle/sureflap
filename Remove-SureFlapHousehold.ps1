param (
	[Parameter(Mandatory=$true)]
	[string]$householdID
)

. ./Get-SureFlapToken.ps1

$uri = $endpoint + "/api/household/$householdID"

$headers = @{}
$headers.Add("Authorization","Bearer $token" ) | Out-Null

$res = Invoke-RestMethod -Method Delete -Uri $endpoint -Headers $headers -ContentType "application/json"
$res