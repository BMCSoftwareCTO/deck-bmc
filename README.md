# deck-bmc

The Spinnaker deck-UI allows customization to some extent. It allows you to add custom modules. They are under deck/app/scripts/modules/ 
Netflix uses this approach to add netflix only module. We will use the same mechanism to add bmc only features. So all the bmc specific 
features will be under deck/app/scripts/modules/bmc

The deck customization allows you do the following
- add new features 
- override  existing screens 

Our enterprise code will be kept in deck-bmc repository. The build script in this repository does the following:

- Merges main deck and deck-bmc using symbolic links 
- Adds our module in the main deck's app.js using script (one line change) 
- Uses the same build script as the original 
