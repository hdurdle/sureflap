# PowerShell SureFlap API Examples
Consume the SureFlap REST API via PowerShell

The device in question: https://www.surepetcare.com/en-gb/pet-doors/microchip-pet-door-connect


### Getting Started
Create a `SureFlapConfig.ps1` based on the `-dist` copy in the repo, and put your SureFlap credentials in it.

The script behaviour is mostly self evident. If, like me, you just want to grab a quick snapshot of the state of the device and where your cats are, use the `Get-SureFlapStart.ps1` file - this will return an object with everything you need.

It appears to be a pretty well constructed and fully featured REST API. I even managed to accidentally create new objects by POSTing when I meant to GET, and it responds to DELETE correctly too.

### Thanks
Thanks to [alextoft](https://github.com/alextoft) and his [sureflap](https://github.com/alextoft/sureflap) project for the initial pointers. Further bits of the API were discovered by fiddling with the site itself at https://surepetcare.io.