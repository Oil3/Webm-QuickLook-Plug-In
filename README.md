## Webm QuickLook Preview extension  
  

An extension for MacOS' "QuickLook" which allows .webm movies to be played in the Finder and Quicklook previews like any other, native, movie.

Thumbnails are dynamic and playable.  

  
2025.feb, fixed all issues of a previous video not stopping when browsing back and forth multiple times.
 
It's always possible to click to play/pause,  and when previewed the right-click context menu has play/pause options as  well. 



![image](https://github.com/user-attachments/assets/dbd3da6f-4ffb-4bf0-9354-8225c667fa34)

     
**Download** from [Releases](https://github.com/Oil3/Webm-QuickLook-Plug-In/releases/tag/webM-feb2025).


[Direct download latest working universal binary: version 2025february
](https://github.com/Oil3/Webm-QuickLook-Plug-In/releases/download/webM-feb2025/Webm.Quicklook.feb2025.universal.binary.zip
) 

Notarized and gatekeeper-approved.
To install, launch "Webm Quicklook.app" once, seeing the sample video (a blueish sphere) indicates success. 
You can close the app.   
Keep the app: the way QuickLook extensions function today is by fetching the plug-in each time from inside the app, this is Apple's rule, and it is so to ensure that mac plugin also goes through Apple's app security review.     
If you move it, launch it again.      
It's toggable in system Settings, under 'Quicklook', inside 'Extensions'.  
To update to a new version, make sure to delete the previous version, or just replace it by the new one.  


To uninstall, delete the app.  

   
Written 100% in Swift, with no HTML and rather 10 lines of JS getElementByTagName but invoked in Swift, sandboxed and never external, it's light and fast: 
_a mac is a mac, and it needs to stay comfortable._

      
**To do**

Make a checkbox for autoplay?  
Implement 90degrees rotations?  
Add .mkv?  
Add video dimensions + duration?  
A nicer 'sample video'?  


Any suggestion, comment, constructive or destructive critics, are welcome.



