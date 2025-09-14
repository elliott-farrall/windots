@echo off



:: ### installers
echo.

:: glaze-wm
echo "Reloading GlazeWM configuration..."
echo.

glazewm command wm-reload-config 2>nul 1>nul
echo.

:: windhawk
echo Applying Windhawk configuration...
echo.

sudo reg import {{ dotter.current_dir }}/windhawk/config.reg 2>nul 1>nul

:: flow-launcher
echo Restarting Flow Launcher...
echo.

taskkill /f /im Flow.Launcher.exe 2>nul 1>nul
start "" "%LOCALAPPDATA%/FlowLauncher/Flow.Launcher.exe"


:: files
echo Applying Files configuration...
echo.

pwsh -Command {{ dotter.current_dir }}/files/install.ps1 -FlavorParam "mocha" -FlatAppearanceParam $true 2>nul 1>nul



:: ### manual steps
echo.
echo Please complete the following manual steps:

:: nilesoft-shell
echo 1. Restart Nilesoft Shell to apply the new theme:
echo    Shift + Right-Click taskbar
echo    Select 'Exit Explorer'

:: files
echo 2. Set base theme in Files 
echo    Go to Settings ^> Appearance
echo    Select 'Light' or 'Dark' base theme

:: zen
echo 3. Enable custom styles in Zen:
echo    Go to about:config
echo    Enable toolkit.legacyUserProfileCustomizations.stylesheets

:: discord
echo 4. Please enable the Catppuccin Mocha theme in BetterDiscord settings:
echo    Go to BetterDiscord Settings ^> Themes
echo    Enable Catppuccin Mocha
