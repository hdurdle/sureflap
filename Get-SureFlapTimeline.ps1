param (
	[string]$householdID
)

. ./Get-SureFlapToken.ps1

if (!$householdID) {
	$householdID = (./Get-SureFlapHousehold.ps1).id
}

$uri = $endpoint + "/api/timeline/household/$householdID"

$headers = @{}
$headers.Add("Authorization","Bearer $token" ) | Out-Null

$Parameters = [System.Web.HttpUtility]::ParseQueryString([String]::Empty)
$Parameters['page'] = '1'
$Parameters.Add('with', 'pet')
$uri += "?" + $Parameters.ToString()

$res = Invoke-RestMethod -Method Get -Uri $uri -Headers $headers -ContentType "application/json"
$res.data