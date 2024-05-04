# Define array of sizes
$sizes = @(6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 34, 35, 37, 46)
$cfgStrings = New-Object System.Collections.ArrayList
$location = "C:\Program Files (x86)\Steam\steamapps\common\Arma 3 Tools\FontToTGA\"
# Path to the .exe file
$exe_path = "./FontToTga.exe"

Write-Output "/// ----------------------------------------------------------------------- \\\"
Write-Output "|     THIS IS                                                                 |"
Write-Output '|         "Arma 3 FontToTga.exe helper"                                       |'
Write-Output "|         written by: Nelis75733126                                           |"
Write-Output "|         GitHub repository:                                                  |"
Write-Output "|             https://github.com/Nelis75733126/Arma3_FontToTGA_helper         |"
Write-Output "\\\ ----------------------------------------------------------------------- ///"
Write-Output ""
Write-Output "--- FIRST UP ---"
Write-Output "    This script assumes the location of FontToTga.exe is the following:"
Write-Output ("        {0}" -f $location)
Write-Output "    Please verify that it is the correct location for your system..."
Start-Sleep -Seconds 1
$isPathOK = Read-Host "        Is it correct? type y for yes, or n for no"
if ($isPathOK -eq "y")
    {
        Write-Output "    Location confirmed and set."
        Set-Location $location
    } elseif ($isPathOK -eq "n")
        {
            Write-Output "    Understood. Please provide the actual location: "
            $location = Read-Host "    "
            Write-Output "    Received. this script will asume that location exists."
            Write-Output "..."
            Start-Sleep -Seconds 1
            if ($location[-1] -eq !"\")
                {
                    $location = $location + "\"
                }
        }
Write-Output "..."
Write-Output ""
Write-Output "--- Next up ---"
Write-Output "    This script needs the exact so-called 'full name' of the font you want to convert."
Write-Output "    You can find that full name by:"
Write-Output "        - opening up the fonts app on your Windows system (On Windows 11: Settings >> Personalisation >> Fonts)"
Write-Output "        - clicking the font you want to convert."
Write-Output "        - under 'Metadata', use the drop-down box to select the variant, if any."
Write-Output "        - then read what it says to the right of 'Full name'."
Write-Output "        - enter that name below. it is case insensitive,"
Write-Output "            however, your use of capital letters will have effect on the names used in the output location."
Write-Output ""
Write-Output "..."
Write-Output ""
Read-Host "when ready, press enter to continue"
Write-Output "--- ok here we go ---"
$font = Read-Host "     Please enter the full name of the font"
Write-Output ("    Input accepted. font name given: {0}" -f $font)
$fontShort = $font -replace '\s+', ''
Write-Output "..."
Write-Output ""
Write-Output "This script is ready to call upon FontToTga.exe to generate all the textures."
$doGenerate = Read-Host ("if you wish to only generate a config for the '{0}' font, type n. otherwise, just press enter.'" -f $font)
if ($doGenerate -eq "n")
    {
        Write-Output ("    Understood. skipping to generating only the config for '{0}'" -f $font)
    } else
        {
            $doGenerate = "y"
            Write-Output "    Allright. calling FontToTga.exe now..."
            Write-Output "..."
            Start-Sleep -Seconds 2
        }
#Loop through the sizes array
foreach ($size in $sizes)
    {
        $fontPath = "Fonts\$fontShort\$fontShort$size"
        $cfgStrings.Add("$fontPath") | Out-Null
        # Construct the command string
        $command = "$exe_path -maxTexSize=2048 -size=$size `"$font`" $fontPath"
        if ($doGenerate -eq "y")
            {
                Invoke-Expression $command
            }
    }
if ($doGenerate -eq "y")
    {
        Write-Output ""
        Write-Output "FontToTga.exe seems to be done with the conversion."
        Write-Output "    The .fxy and .tga files for the '$font' font can be found in:"
        Write-Output ("        {0}Fonts{1}" -f $location, $fontShort)
        Write-Output "-----------------------------------------------"
        Write-Output "IMPORTANT: It should be noted that those .tga files need to be converted to .paa using the application 'ImageToPAA', which is also available inside Arma 3 Tools."
        Write-Output "-----------------------------------------------"
        Write-Output ""
    }
Write-Output "..."
Start-Sleep -Seconds 2
Write-Output ""
Write-Output ("--- NEXT UP: CfgFontFamilies config entry for '{0}'---" -f $font)
Start-Sleep -Seconds 1
Write-Output "    In order to write the correct config,"
Write-Output "    you must provide the exact name of the addon you are planning to include the font in."
Write-Output "    That name will be the so-called 'TAG' given to the addon via its classname in CfgPatches."
Start-Sleep -Seconds 1
$addonName = Read-Host "        please provide that name"
Write-Output "..."
Start-Sleep -Seconds 2
Write-Output "    Generating config..."
Write-Output "..."
Start-Sleep -Seconds 1

$config = New-Object System.Collections.ArrayList
$null = $config.Add("class CfgFontFamilies")
$null = $config.Add("    {")
$null = $config.Add("        class $fontShort")
$null = $config.Add("            {")
$null = $config.Add("                fonts[] =")
$null = $config.Add("                    {")

for ($i = 0; $i -lt $cfgStrings.count; $i++)
    {
        $cfgStrings[$i] = "$addonName\" + $cfgStrings[$i]
        $null = $config.Add('                        "{0}",' -f $cfgStrings[$i])
    }
# remove the comma at the end of the last string
$config[-1] = $config[-1] -replace '.$'

$null = $config.Add("                    };")
$null = $config.Add("            };")
$null = $config.Add("    };")

Write-Output "    Config for '$font' generated. here it is:"
Write-Output ""
Write-Output "// #### CONFIG START ####"
Write-Output ""
Write-Output $config
Write-Output ""
Write-Output "// #### CONFIG END ####"
Write-Output ""
Start-Sleep -Seconds 1
Write-Output "..."
Write-Output ""
Write-Output "This script is done. Have a nice day."