
local link1 = 'https://raw.githubusercontent.com'
local link2 = 'Graham-Void/Protage/'
local link3 = 'main/mhm.lua'

local userkey = link1 .. '/' .. link2 .. link3
blacklist = "https://raw.githubusercontent.com/Graham-Void/Protage/main/banned.lua"
key = game:HttpGet(userkey, true)
banned = game:HttpGet(blacklist, true)
if string.find(key,_G.Key) then
-- script here
print("WL Successfully")
elseif string.find(blacklist,_G.Key) then
game.Players.LocalPlayer:kick("What are u doing ?")
else
game.Players.LocalPlayer:kick("What are u doing ?")
end
