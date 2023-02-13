#Modify Path to the picture accordingly to reflect your infrastructure
$imgPath = "$env:userprofile\Pictures\wallpaper.jpg"
$code = @' 
using System.Runtime.InteropServices; 
namespace Win32{ 
    
     public class Wallpaper{ 
        [DllImport("user32.dll", CharSet=CharSet.Auto)] 
         static extern int SystemParametersInfo (int uAction , int uParam , string lpvParam , int fuWinIni) ; 
         
         public static void SetWallpaper(string thePath){ 
            SystemParametersInfo(20, 2, thePath, 3); 
         }
    }
 } 
'@

add-type $code 

# Continuously download a new wallpaper and set it as the desktop background every hour
while ($true) {
    Invoke-WebRequest -Uri "https://wallpapertag.com/wallpaper/full/d/0/c/716730-popular-funny-monkey-wallpaper-2560x1600.jpg" -OutFile $imgPath
    [Win32.Wallpaper]::SetWallpaper($imgPath)
    Start-Sleep -Seconds 300
} 