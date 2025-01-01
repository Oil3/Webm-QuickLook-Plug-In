# Webm QuickLook Plug-In extension  
  

An extension for MacOS' "QuickLook" which allows .webm movies to be played in the Finder and Spotlight previews like any other, native, movies.

Thumbnails are dynamic and playable.

  
Choice of "autoplay(on)" and "no-autoplay(off)", distinct versions to avoid hacky-workarounds.
 
It's always possible to click to play/pause,  and when previewed the right-click context menu has play/pause options as  well. 

To install, launch "Webm Quicklook.app" once, seeing the sample video indicates success. 
You can close the app.
Keep the app somewhere: the way QuickLook extensions function today is by fetching the plug-in each time from the app, this is Apple's rule, and it is so to ensure that mac plugin also goes through Apple's app security review.  
If you move it, launch it again.  
To update to a new version, make sure to delete the previous one, or just rteplace it.


To uninstall, delete the app.


![image](https://github.com/user-attachments/assets/dbd3da6f-4ffb-4bf0-9354-8225c667fa34)




     
**Download** from Releases.


[Latest working universal binary: version 2025january - autoplay ON, background/play issue fixed
](https://github.com/Oil3/Webm-QuickLook-Plug-In/releases/tag/WebmQuicklook-2025jan-backgroundplayfixed-autoplay
)  

Notarized and gatekeeper-approved.


The "autoplay on" version is 100% Swift, the "autoplay off" version has 10 lines of js - invoked natively in Swift to trigger 'pause'. 
Neither use html or anything external: a mac needs to stay comfortable.
  
**To do**

Make a checkbox for autoplay



Any suggestion, comment, constructive or destructive critics, are welcome.



