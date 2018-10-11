param (
	[string]$householdID,
	[string]$userID
)

. ./Get-SureFlapToken.ps1

if ($householdID) {
	# list of users in household
	$uri = $endpoint + "/api/household/$householdID/user"
} else {
	# details of specific user
	$uri = $endpoint + "/api/user/$userID"
}

$headers = @{}
$headers.Add("Authorization","Bearer $token" ) | Out-Null

$res = Invoke-RestMethod -Method Get -Uri $uri -Headers $headers -ContentType "application/json"
$res.data