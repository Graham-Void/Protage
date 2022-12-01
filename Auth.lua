local userkey = "https://raw.githubusercontent.com/Graham-Void/Protage/main/White.lua"
local blacklist = "https://raw.githubusercontent.com/Graham-Void/Protage/main/banned.lua"


local key = game:HttpGet(userkey, true)
local banned = game:HttpGet(blacklist, true)



if string.find(key,_G.Key) then
-- script here
print("WL Successfully")
elseif string.find(banned,_G.Key) then
    game.Players.LocalPlayer:kick("Key is blacklisted")
else
    game.Players.LocalPlayer:kick("Invalid Key")
end
