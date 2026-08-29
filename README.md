# 🔔 ChatPing

<p align="center">
  <img src="https://img.shields.io/badge/Interface-20504-blue.svg" alt="Interface">
  <img src="https://img.shields.io/badge/Version-0.0.2-green.svg" alt="Version">
  <img src="https://img.shields.io/badge/Author-Subby-orange.svg" alt="Author">
  <img src="https://img.shields.io/github/downloads/SubbyDK/ChatPing/total" alt="Downloads">
</p>

A lightweight World of Warcraft addon for TBC Classic / Anniversary client. **ChatPing** plays a custom sound notification whenever specified keywords or character names are mentioned in chat channels.

---

## 🚀 Features

- 📢 **Custom Name Alerts:** Receive sound notifications when designated names or words are mentioned in chat.
- 🎵 **Custom Sound Support:** Uses your own custom sound file located at `Sounds/Glass.mp3`.
- 💬 **Targeted Channels:** Monitors essential channels (`SAY`, `PARTY`, `PARTY_LEADER`, `RAID`, `RAID_LEADER`, `GUILD`, `OFFICER`, and `WHISPER`).
- 🛑 **Ignore Self:** Automatically skips messages sent by your own character.
- 💾 **Persistent Storage:** Saved names are kept across sessions via `SavedVariables`.

---

## 📦 Installation

1. Download or clone this repository from GitHub.
2. Extract the archive into your World of Warcraft directory:
   `World of Warcraft\_classic_\Interface\AddOns\`
3. ⚠️ **Important:** If you downloaded the repository as a zip file from GitHub, rename the extracted folder from `ChatPing-master` to `ChatPing` (remove `-master`).
4. Ensure the folder path and files match this exact structure:
   ```text
   World of Warcraft\_classic_\Interface\AddOns\ChatPing\
   ├── ChatPing.toc
   ├── ChatPing.lua
   └── Sounds/
       └── Glass.mp3  
   ```

---

## 🛠️ Slash CommandsCommand
/ping <name> - Adds a name to your notification list (e.g., /ping Subby)  
/unping <name> - Removes a name from your notification list (e.g., /unping Subby)  
/ping list - Displays all currently saved names in your chat window.  

---

### 🔊 Custom Sound Setup
To use a custom sound file, place your .mp3 or .ogg file in the Sounds subfolder:  
Path: Interface\AddOns\ChatPing\Sounds\Glass.mp3  
If you change the file name or format, update line 38 in ChatPing.lua:  
```text
PlaySoundFile("Interface\\AddOns\\ChatPing\\Sounds\\Glass.mp3", "Master")  
```

---

### 👤 Author
**Created by Subby**  
*Tight lines and happy fishing!*

---

## 📄 License

MIT License — do what you want with it. Credits appreciated but not required.
