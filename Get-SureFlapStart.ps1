. ./Get-SureFlapToken.ps1

$uri = $endpoint + "/api/me/start"

$headers = @{}
$headers.Add("Authorization","Bearer $token" ) | Out-Null

$Parameters = [System.Web.HttpUtility]::ParseQueryString([String]::Empty)
$Parameters['with'] = 'language'
$uri += "?" + $Parameters.ToString()

$res = Invoke-RestMethod -Method Get -Uri $uri -Headers $headers -ContentType "application/json"
$res.data