#Modify Path to the picture accordingly to reflect your infrastructure
Invoke-WebRequest -Uri "https://wallpapertag.com/wallpaper/full/d/0/c/716730-popular-funny-monkey-wallpaper-2560x1600.jpg" -OutFile "$env:userprofile\Desktop\wallpaper.jpg"
$imgPath="%userprofile%\Desktop\wallpaper.jpg"
$code = @' 
using System.Runtime.InteropServices; 
namespace Win32{ 
    
     public class Wallpaper{ 
        [DllImport("user32.dll", CharSet=CharSet.Auto)] 
         static extern int SystemParametersInfo (int uAction , int uParam , string lpvParam , int fuWinIni) ; 
         
         public static void SetWallpaper(string thePath){ 
            SystemParametersInfo(20,0,thePath,3); 
         }
    }
 } 
'@

add-type $code 

#Apply the Change on the system 
[Win32.Wallpaper]::SetWallpaper($imgPath)
pause