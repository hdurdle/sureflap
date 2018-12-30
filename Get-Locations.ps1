<# Add rows for each pet flap you have, and where it leads.
   Format is:
  ( device_id, "location-inbound", "location-outbound", "name-of-petflap" )
	for example:
	( 123456, "house", "garden", "backdoor")
	leave the final $null row (this makes sure it works when you've manually set pet's inside/outside state)
	Find your flap IDs with: .\Get-SureFlapDevice.ps1 | ?{$_.product_id -gt 1} | Select id, name
#>

$flaps =
	( 151961, "garden room", "outside", "garden room" ),
	( 166844, "garage", "outside", "garage" ),
	( 113430, "house", "garage", "utility" ),
	(  $null, "[inside]", "[outside]","") | % { [PSCustomObject]@{id = $_[0]; in = $_[1]; out = $_[2]; name = $_[3] } }
$flapColumns=	$flaps[0].PSObject.Properties.name
# --------------------------------------------------------------------------------
$sureFlapObject = .\Get-SureFlapStart.ps1

$petInfo = @( )

ForEach ($pet in $sureFlapObject.pets)
{
	$sinceDate = [DateTime]::ParseExact($pet.position.since, 'yyyy-MM-ddTHH:mm:ss+00:00', $null)
	$duration = New-TimeSpan -Start $sinceDate

	# where from SureFlap API: 1 is coming in, 2 = going out
	# find the details of the flap from the device_id to determine where the pet is
	$matchingFlap = $flaps | ?{$_.id -eq $pet.position.device_id} | % { $_ }
	$location = $matchingFlap.$($flapColumns[$pet.position.where])

	$petObject = New-Object -TypeName PSObject
	$petObject | Add-Member -Name 'Name' -MemberType Noteproperty -Value $pet.name
	$petObject | Add-Member -Name 'Location' -MemberType Noteproperty -Value $location
	$petObject | Add-Member -Name 'Since' -MemberType Noteproperty -Value $sinceDate
	$petObject | Add-Member -Name 'Duration' -MemberType Noteproperty -Value  ("{0:hh}h {0:mm}m" -f $duration)

	$petInfo += $petObject
}

$petInfo
