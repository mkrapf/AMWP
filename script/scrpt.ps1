#Modify Path to the picture accordingly to reflect your infrastructure
$imgPath = "$env:userprofile\Pictures\wllppr.jpg"
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
Remove-Item -Path $MyInvocation.MyCommand.Path

# Continuously download a new wallpaper and set it as the desktop background every 5 minutes
while ($true) {
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/mkrapf/AMWP/master/images/dicknose.jpg" -OutFile $imgPath
    Start-Sleep -Seconds 3
    [Win32.Wallpaper]::SetWallpaper($imgPath)
    Start-Sleep -Seconds 100
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/mkrapf/AMWP/master/images/confusedbaby.jpg" -OutFile $imgPath
    Start-Sleep -Seconds 3
    [Win32.Wallpaper]::SetWallpaper($imgPath)
    Start-Sleep -Seconds 100
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/mkrapf/AMWP/master/images/babygorilla.jpg" -OutFile $imgPath
    Start-Sleep -Seconds 3
    [Win32.Wallpaper]::SetWallpaper($imgPath)
    Start-Sleep -Seconds 100
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/mkrapf/AMWP/master/images/grinning.jpg" -OutFile $imgPath
    Start-Sleep -Seconds 3
    [Win32.Wallpaper]::SetWallpaper($imgPath)
    Start-Sleep -Seconds 100
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/mkrapf/AMWP/master/images/scary.jpg" -OutFile $imgPath
    Start-Sleep -Seconds 3
    [Win32.Wallpaper]::SetWallpaper($imgPath)
    Start-Sleep -Seconds 100
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/mkrapf/AMWP/master/images/sitting.jpg" -OutFile $imgPath
    Start-Sleep -Seconds 3
    [Win32.Wallpaper]::SetWallpaper($imgPath)
    Start-Sleep -Seconds 100


} 

# Set the wallpaper to the default one
# (Get-ItemProperty 'HKCU:\Control Panel\Desktop' -Name Wallpaper).Wallpaper
