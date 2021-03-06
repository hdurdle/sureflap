. ./SureFlapConfig.ps1

$uri = $endpoint + "/api/auth/login"

$postParams = @{ 
 "email_address" = "$email"
 "password" = "$password"
 "device_id" = "$device_id"
} | ConvertTo-Json

if (Test-Path .\sureflap.token) {
    $token = Get-Content .\sureflap.token
} else {
    $res = Invoke-RestMethod -Method Post -Uri $uri -Body $postParams -ContentType "application/json"
    $token = $res.data.token
    $token | Out-File "sureflap.token"
}