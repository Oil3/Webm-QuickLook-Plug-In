# Webm QuickLook Plug-In extension

**What is this:** this is is an extension for MacOS' "QuickLook" which allows .webm movies to be played in the Finder and Quicklook previews like other movies.

**How to install?** Launch the app. Notarized identified developer so no security lowering needed. 
The plug-in gets registered and moved to ~/Library/Workflows
Can be confirmed and toggled off/on within Preferences, in  "extensions", where it appears in "added" and in "quicklook".

**How to uninstall?** Delete the app, 

**Download** from Releases. Or direct link from [here](https://oil3.github.io/Quicklook.Webm.Notarized.feb2024.UniversalBinary.zip)

## Webm Quicklook plugin: play Webm movies in preview. Notarized, sandboxed, hardened MacOS app.


This is an initial version and all suggestions, comments, critics are welcome.

I aim to limit quantity/lines of code to the minimum required amount: bundle weights 360KB

Known issues: Controls work perfectly but videos autoplay in the preview panel.
Wide videos in finder's preview panel refuse to be bound horizontally, and have to resize pannel or scroll within the panel.
I suspect the usual one-line-of-code fix would solve these.



Need to implement:

optional thumbnails (make the video capture first frame is the plan)

options, such as "mute on start" and "loop".

