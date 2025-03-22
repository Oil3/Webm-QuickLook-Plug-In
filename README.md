  <p align="center">
  <img src="https://raw.githubusercontent.com/Oil3/Webm-QuickLook-Plug-In/refs/heads/main/Webm%20Quicklook/Assets.xcassets/AppIcon.appiconset/icin512%203.png" height="128">
  <h1 align="center">WebM Quick Look Preview extension   </h1>
</p>

The original free MacOS plugin to play .webm movies in Quick Look Preview.


 


![image](https://github.com/user-attachments/assets/dbd3da6f-4ffb-4bf0-9354-8225c667fa34)

     
**Download** from [Releases](https://github.com/Oil3/Webm-QuickLook-Plug-In/releases/tag/1.62UniversalBinary). 1.62 - properly fixed [Finder panel autoplaying](#finder-panel).   

If you need other video/audio formats, **try the beta 2.0** that quicklook-plays virtually _all non-natively-supported formats_ such as .mkv .wmv .flv .webm .rm, ... even .nuv.   
Instant playback even from network volumes, [Direct download Silicon beta](https://github.com/Oil3/Mkv-Quicklook/releases/download/1.32-MKV-cache-flush/QL-every-other-formats-BETA.zip)  [^1] . WebM experience is still much better on the normal WebM Quicklook 1.6.


###



## Install  
>Launch the app once. This registers the extension as the extension itself stays within the app bundle.  

## Uninstall  
>Delete the app.  

## Update  
>Replace the older app with the newer app.  MacOS looks for the extension in the app: if app is moved, a relaunch might be needed. 


Works on all macOSX versions (Monterey to latest Sequoia) and all Silicon or Intel mac architectures.  

[Direct download (1.62 Universal Binary)
](https://github.com/Oil3/Webm-QuickLook-Plug-In/raw/refs/heads/main/Webm%20Quicklook%201.62%20universal%20binary.zip)   

## Tip
> `opt + space` quicklooks in full-screen

## Finder Panel  
Still unbeknownst why, on some machines, the finder panel refuses not to autoplay:  
if that is the case, a previous version with a different, simpler logic, prevents correctly this autoplay, at the tradeoff of not autoplaying the preceding video if you go back to it.   
It does keep the position of the preceding video and you can click once on the video, or click the play button, or right-click 'play' to resume playing.   
[Direct Download](https://github.com/Oil3/Webm-QuickLook-Plug-In/releases/download/2025/Webm.Quicklook.2025Feb.zip) 
 
##  

Once the app is launched, the WebM Quicklook extension appears in  `Extensions` from `General` in macOS' `System Settings`, and disapears if app is deleted.  
  
Notarized and gatekeeper-approved.  

##  
Light and fast.    

[Screen Recording 2025-03-19 at 11.54.34 PM.webm](https://github.com/user-attachments/assets/6a33eb1d-4017-4d25-b64e-25c2e0d37ec7)


## 
[^1]: The Silicon beta 2.0 uses code from [FFmpeg](http://ffmpeg.org) licensed under [LGPLv2.1](http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html).   




  ## 
#### also check out my new [`MKV quicklook extension`](https://github.com/Oil3/Mkv-Quicklook) -just released!
##  
Made in Swift.  
_a mac is a mac and it needs to stay comfortable, but it's still your mac._
