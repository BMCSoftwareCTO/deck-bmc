#!/bin/bash

# If DECK_HOME is not set, then assumes the main deck folder is at the same level as deck-bmc
if [ -z "$DECK_HOME" ]; then
    DECK_HOME=$PWD/../deck 
fi

# Copy deck-bmc/app/scripts/modules/bmc to the main deck folder
rm -rf $DECK_HOME/app/scripts/modules/bmc
cp -r "$PWD/app/scripts/modules/bmc" $DECK_HOME/app/scripts/modules/bmc

# Tell git to ignore the newly copied bmc files so that git commit from the 
# main deck folder won't try to include those files
# Also ignore app.js which we locally modify to include bmc module (Note:- This is not working)
if [ -f "$DECK_HOME"/.git/info/exclude ]; then
    if ! grep -qe "app/scripts/modules/bmc/*" "$DECK_HOME"/.git/info/exclude; then
        echo "app/scripts/modules/bmc/*" >> "$DECK_HOME"/.git/info/exclude
    fi
    if ! grep -qe "app/scripts/app.js" "$DECK_HOME"/.git/info/exclude; then
        echo "app/scripts/app.js" >> "$DECK_HOME"/.git/info/exclude
    fi
fi

# Include the bmc module in the app
if ! grep -qe "./modules/bmc/bmc.module.js" "$DECK_HOME"/app/scripts/app.js; then
    perl -pi -e "s/require\(\'.\/modules\/netflix\/netflix.module.js\'\),/require\(\'.\/modules\/bmc\/bmc.module.js\'\),\n  require\(\'.\/modules\/netflix\/netflix.module.js\'\),/" "$DECK_HOME"/app/scripts/app.js
fi

cd "$DECK_HOME"
npm run build


