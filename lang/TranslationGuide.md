# Wait, how to translate WSAUtilities?
This guide will teach you how to contribute to this project by translating WSAUtilities.
## First step
Clone this repository (or just simply download the `en.ini` file for the English version for reference and translation).

## Second step
Translate it. Remove the original text after you finished translating. I recommend you to type in your language at a new line after the translation for easier comparison - after that remove the original English line. Editing through Notepad is easier for this usage.

## Third step
Once you completed (or need to test it), copy it to the `lang` folder. BUT, before that, remember to rename the language code.  
My suggestion for language codes are 2-letter language codes (such as en, zh, es). Then, go back to the WSAUtilities directory and open `WSAUtilities.ini`.  
Edit the `Language` string under the `Localization` category. For example:
```batch
If you're translating WSAUtilities to Spanish, you have to change Language=en to Language=es (or whatever filename your INI file is).
```  
Before you submit a pull request, make sure you test your language by running WSAUtilitiesLauncher and see how's your translation. ~~Maybe that's a more complicated way to say double-checking but okay~~

## Final step
Fork my project then add your language file into the `lang` folder by uploading it. I'll check it and will approve it.