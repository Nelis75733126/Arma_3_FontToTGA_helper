<div style="text-align:center;">
    <img style="width:256px;margin:97.7875px" src="./images/Arma_3_FontToTGA_helper.png
" alt="Arma 3 FontToTGA_Helper [unofficial]">
</div>

### What is this?
> A user-friendly Powershell script that can call upon FontToTGA.exe and/or generate a config for use in `CfgFontFamilies`

### ***Requirements***

- any installation of Windows that has Powershell installed.
- Arma 3 Tools (https://store.steampowered.com/app/233800/Arma_3_Tools/)
- Arma 3 (if you want to actually use the result of this script, that is)

### ***Why use this?***
- this can generate ANY font size you like
- this will provide you with a ready-to-use config for `CfgFontFamilies`
- it is open source. duh! ;)

### ***How to use this?***

- download the script.
- put it anywhere you like.
- then go to File Explorer (or any other file manager you know), navigate to where you put the script.
- hold the shift key, and Right-click on an empty space inside the window.
- click on "Open Powershell window here".
- in that Powershell window, type this:

  ```
  ./Arma_3_FontToTGA_helper.ps1
  ```
- press the enter key. That will start the script.<br>
<br>

The script will guide you through the process and ask all the required information. All you have to do is provide that information accurately and it should result in a successfull conversion from a font into the .TGA file format.

>***NOTE:* this script will assume that you provided correct paths and names. If there was any mistake made in providing the required data, the script will fail.**

### **Some context**
`FontToTGA.exe` is a tool included with Arma 3 Tools (available on Steam if you own a copy of Arma 3). The purpose of it is to convert a font file installed on your system into TGA images, which are then supposed to be converted into PAA images using another tool included with Arma 3 Tools called `ImageToPAA.exe`.<br>
<br>
Yes, Arma 3 uses PAA images to display text. Which is part of the reason why text becomes really ugly at larger sizes IF the generated .TGA source files were too small for that particular size of in-game text. In order to keep the appearance of the fonts as crisp as possible, the correct sizes need to be generated by FontToTGA.exe and put into the game. Besides those PAA images, there are `.fxy` files which are generated by `FontToTGA.exe`. The contents of those files will tell Arma 3's engine where specific characters are on the PAA images.<br>
<br>
And last but far from least: there is `CfgFontFamilies`. it is a `class` that belongs in the `config.cpp` of the addon you want to put the custom font into. Yes, you need to create a new addon or add the fonts to an existing addon you have already created. Makes no difference. There is a very specific thing you need to add into `class CfgFontFamilies` to allow Arma 3 to use the font. That specific thing will be generated for you by the Powershell script in this repository.<br>
<br>
You are welcome. Feel free to send me a private message to thank me for making your life easier.
<br>
<br>

---

This work      is licensed under [ Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International

(https://creativecommons.org/licenses/by-nc-sa/4.0/?ref=chooser-v1)
