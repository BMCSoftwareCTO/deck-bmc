## Summary

The Spinnaker deck-UI allows customization to some extent. It allows you to add custom modules. They are under deck/app/scripts/modules/ 
Netflix uses this approach to add netflix only module. We will use the same mechanism to add bmc only features. So all the bmc specific 
features will be under deck/app/scripts/modules/bmc

The deck customization allows you do the following
- add new features 
- override  existing screens 

Our enterprise code will be kept in deck-bmc repository. The build script in this repository does the following:

- Copies deck-bmc code to the main deck folder 
- Adds our module in the main deck's app.js using script (one line change) 
- Uses the same build script as the original 
 
## How to Build

Use the build.sh script in the deck-bmc repository to build the combined project. By default, it assumes both deck and deck-bmc repositories are checked out to the same directory level.
For e.g., 

> ~/GitHub/BMCSoftwareCTO/deck-bmc
> ~/GitHub/BMCSoftwareCTO/deck

If they are not at the same level, then set the DECK_HOME environment variable to point to the public deck folder.

Run the build.sh script from the deck-bmc

### What does build.sh script do?

The build.sh script in the deck-bmc does the follwoing
1. If DECK_HOME is not set, then sets DECK_HOME
2. Copies the app/scripts/modules/bmc to $DECK_HOME/app/scripts/modules/bmc
2. Updates deck's git to ignore the newly copied bmc files so that git commit from the main deck folder won't try to include those files.
3. Includes the bmc module in the main deck's app
4. Calls npm run build from $DECK_HOME



