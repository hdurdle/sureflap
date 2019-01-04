param (
	[string]$petID,
	[string]$where = 1 #  1 = inside (default), 2 = outside
)
# usage: .\Set-SureFlapPetPosition.ps1 pet_id [where]

. ./Get-SureFlapHousehold.ps1

$uri = $endpoint + "/api/pet/$petID/position"

$headers = @{}
$headers.Add("Authorization","Bearer $token" ) | Out-Null

$postParams = @{
 "where" = $where
 "since" = (Get-Date -format "yyyy-MM-dd HH:mm:ss")
} | ConvertTo-Json

$postParams

$res = Invoke-RestMethod -Method Post -Uri $uri -Headers $headers -Body $postParams -ContentType "application/json"
$res.data
