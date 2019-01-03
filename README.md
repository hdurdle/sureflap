# PowerShell SureFlap API Examples
Consume the SureFlap REST API via PowerShell

The device in question: https://www.surepetcare.com/en-gb/pet-doors/microchip-pet-door-connect


### Getting Started
Create a `SureFlapConfig.ps1` based on the `-dist` copy in the repo, and put your SureFlap credentials in it.

The script behaviour is mostly self evident. If, like me, you just want to grab a quick snapshot of the state of the device and where your cats are, use the `Get-SureFlapStart.ps1` file - this will return an object with everything you need.

It appears to be a pretty well constructed and fully featured REST API. I even managed to accidentally create new objects by POSTing when I meant to GET, and it responds to DELETE correctly too.

### Notes

Currently the scripts don't do any checking to see if the parameters are missing so die if they're not provided.

For example, you need to pass the ID of a pet to this:

`.\Get-SureFlapPetLocation.ps1 <ID_of_Pet>`

and either the household ID, or the ID of a user to:

`.\Get-SureFlapUser.ps1 -householdID <householdID>`
or
`.\Get-SureFlapUser.ps1 -userID <userID>`

#### Get-Locations.ps1

If you have multiple cat flaps, you can define the flaps, and where they lead (which rooms/zones they connect).

Edit Get-Locations.ps1 and add rows at the top for each pet flap you have.

Format is:

`( device_id, "location-inbound", "location-outbound", "name-of-petflap" )`

for example:
`( 123456, "house", "garden", "backdoor")`

leave the final `$null` row (this makes sure it works when you've manually set pet's inside/outside state)

You can list your flap IDs with: `.\Get-SureFlapDevice.ps1 | ?{$_.product_id -gt 1} | Select id, name`


### Thanks
Thanks to [alextoft](https://github.com/alextoft) and his [sureflap](https://github.com/alextoft/sureflap) project for the initial pointers. Further bits of the API were discovered by fiddling with the site itself at https://surepetcare.io.
