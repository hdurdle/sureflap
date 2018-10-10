param (
	[string]$petID
)

. ./Get-SureFlapHousehold.ps1

$uri = $endpoint + "/api/pet/$petID/position"

$headers = @{}
$headers.Add("Authorization","Bearer $token" ) | Out-Null

$res = Invoke-RestMethod -Method Get -Uri $uri -Headers $headers -ContentType "application/json"
if ($res.data.where -eq 1) {
	Write-Host "Inside"
} else {
	Write-Host "Outside"
}

# where 1 = inside 2 = outside since = datetime seen