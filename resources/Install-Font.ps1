Set-ExecutionPolicy Unrestricted -Scope Process

Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class FontInstaller
{
    [DllImport("gdi32.dll")]
    private static extern int AddFontResource(string lpszFilename);

    [DllImport("gdi32.dll")]
    private static extern int CreateScalableFontResource(uint fdwHidden, string lpszFontRes, string lpszFontFile, string lpszCurrentPath);

    public static void Install(string fontFilePath)
    {
        AddFontResource(fontFilePath);
        uint hidden = 0;
        string fontRes = System.IO.Path.GetTempFileName();
        CreateScalableFontResource(hidden, fontRes, fontFilePath, null);
        System.IO.File.Delete(fontRes);
    }
}
"@ -Language CSharp

# Liste der Verzeichnisse
$directories = @(
    "C:\Users\varzrelian\Desktop\font\jetbrains-mono\ttf",
    "C:\Users\varzrelian\Desktop\font\jetbrains-mono\variable",
    "C:\Users\varzrelian\Desktop\font\jetbrains-mono\webfonts",
    "C:\Users\varzrelian\Desktop\font\noto-sans"
)

foreach ($directory in $directories) {
    Get-ChildItem -Path $directory -Filter *.ttf | ForEach-Object {
        # Überprüfen, ob die Schriftart bereits im Windows Fonts-Ordner existiert
        $fontExists = Test-Path "C:\Windows\Fonts\$($_.Name)"
        if (-not $fontExists) {
            [FontInstaller]::Install($_.FullName)
        } else {
            Write-Output "Die Schriftart $($_.Name) ist bereits installiert und wird übersprungen."
        }
    }
}
