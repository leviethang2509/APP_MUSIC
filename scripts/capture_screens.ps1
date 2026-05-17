Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

Add-Type @"
using System;
using System.Runtime.InteropServices;

public static class MouseOps
{
    [DllImport("user32.dll")]
    public static extern bool SetCursorPos(int X, int Y);

    [DllImport("user32.dll")]
    public static extern void mouse_event(uint dwFlags, uint dx, uint dy, uint dwData, UIntPtr dwExtraInfo);

    public const uint LEFTDOWN = 0x0002;
    public const uint LEFTUP = 0x0004;
}
"@

function Save-Shot([string]$name) {
    $bounds = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
    $bmp = New-Object System.Drawing.Bitmap $bounds.Width, $bounds.Height
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.CopyFromScreen($bounds.Location, [System.Drawing.Point]::Empty, $bounds.Size)
    $path = Join-Path (Get-Location) ("images\" + $name)
    $bmp.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
    $g.Dispose()
    $bmp.Dispose()
    Write-Output $path
}

function Click-At([int]$x, [int]$y) {
    [MouseOps]::SetCursorPos($x, $y) | Out-Null
    Start-Sleep -Milliseconds 300
    [MouseOps]::mouse_event([MouseOps]::LEFTDOWN, 0, 0, 0, [UIntPtr]::Zero)
    [MouseOps]::mouse_event([MouseOps]::LEFTUP, 0, 0, 0, [UIntPtr]::Zero)
}

function Activate-Chrome {
    $ws = New-Object -ComObject WScript.Shell
    $activated = $ws.AppActivate("Chrome")
    Start-Sleep -Seconds 2
    $ws.SendKeys("% ")
    Start-Sleep -Milliseconds 400
    $ws.SendKeys("x")
    Start-Sleep -Seconds 2
    return $activated
}

if (!(Test-Path "images")) {
    New-Item -ItemType Directory -Path "images" | Out-Null
}

$ok = Activate-Chrome
if (-not $ok) {
    Write-Error "Không kích hoạt được cửa sổ Chrome."
    exit 1
}

$w = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Width
$h = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Height

Save-Shot "01_home_screen.png" | Out-Host

Click-At ([int]($w * 0.50)) ([int]($h * 0.96))
Start-Sleep -Seconds 2
Save-Shot "02_playlist_screen.png" | Out-Host

Click-At ([int]($w * 0.83)) ([int]($h * 0.96))
Start-Sleep -Seconds 2
Save-Shot "03_settings_screen.png" | Out-Host

Click-At ([int]($w * 0.17)) ([int]($h * 0.96))
Start-Sleep -Seconds 2
Save-Shot "04_all_songs_screen.png" | Out-Host