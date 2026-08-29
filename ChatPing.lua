-- Saved variables initialization
ChatPingDB = ChatPingDB or {}

-- Create frame to capture chat events
local frame = CreateFrame("Frame")

-- List of chat events to monitor
local chatEvents = {
    "CHAT_MSG_SAY",
    "CHAT_MSG_PARTY",
    "CHAT_MSG_PARTY_LEADER",
    "CHAT_MSG_RAID",
    "CHAT_MSG_RAID_LEADER",
    "CHAT_MSG_GUILD",
    "CHAT_MSG_OFFICER",
    "CHAT_MSG_WHISPER",
}

-- Register all chat events
for _, event in ipairs(chatEvents) do
    frame:RegisterEvent(event)
end

-- Function to check text for registered names and play sound
local function OnChatMessage(self, event, message, sender)
    if not message or message == "" then return end

    -- Remove server name from sender if present (e.g., "Player-Realm" -> "Player")
    local senderName = string.match(sender, "([^%-]+)")
    local playerName = UnitName("player")

    -- Ignore messages sent by the player
    if senderName == playerName then return end

    -- Check if any saved name appears in the message (case-insensitive)
    local lowerMessage = string.lower(message)
    for name in pairs(ChatPingDB) do
        if string.find(lowerMessage, string.lower(name), 1, true) then
            PlaySoundFile("Interface\\AddOns\\ChatPing\\Sounds\\Glass.mp3", "Master")
            break
        end
    end
end

frame:SetScript("OnEvent", OnChatMessage)

-- Slash commands handler for /ping
SLASH_CHATPING1 = "/ping"
SlashCmdList["CHATPING"] = function(msg)
    local command, name = string.match(msg, "^(%S+)%s*(%S*)$")
    
    -- If no subcommand is provided, show usage info
    if not command or command == "" then
        print("|cff00ff00[ChatPing]|r Usage: /ping <name> or /unping <name>. Type /ping list to view saved names.")
        return
    end

    -- If command is used directly as "/ping Name"
    if command ~= "list" and name == "" then
        name = command
        command = "add"
    end

    if command == "add" and name ~= "" then
        ChatPingDB[name] = true
        print("|cff00ff00[ChatPing]|r Added |cffffffff" .. name .. "|r to the ping list.")
    elseif command == "list" then
        print("|cff00ff00[ChatPing]|r Saved names:")
        local count = 0
        for k in pairs(ChatPingDB) do
            print("- " .. k)
            count = count + 1
        end
        if count == 0 then
            print("(No names in list)")
        end
    end
end

-- Slash commands handler for /unping
SLASH_CHATUNPING1 = "/unping"
SlashCmdList["CHATUNPING"] = function(msg)
    local name = string.trim and string.trim(msg) or string.match(msg, "^%s*(.-)%s*$")
    
    if name and name ~= "" then
        if ChatPingDB[name] then
            ChatPingDB[name] = nil
            print("|cff00ff00[ChatPing]|r Removed |cffffffff" .. name .. "|r from the ping list.")
        else
            print("|cff00ff00[ChatPing]|r Name |cffffffff" .. name .. "|r was not found in the list.")
        end
    else
        print("|cff00ff00[ChatPing]|r Usage: /unping <name>")
    end
end