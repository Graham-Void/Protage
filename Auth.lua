local link1 = 'https://raw.githubusercontent.com'
local link2 = 'Graham-Void/Protage/'
local link3 = 'main/White.lua'

local final_wl = link1 .. '/' .. link2 .. link3

local link4 = 'https://raw.githubusercontent.com'
local link5 = 'Graham-Void/Protage/'
local link6 = 'main/banned.lua'

local final_bl = link4 .. '/' .. link5 .. link6


local userkey = final_wl
local blacklist = final_bl
key = game:HttpGet(userkey, true)
banned = game:HttpGet(blacklist, true)
if string.find(key,_G.Key) then

    https://raw.githubusercontent.com/Graham-Void/Protage/main/script.lua
    local l1 = 'https://raw.githubusercontent.com'
    local l2 = 'Graham-Void/Protage/'
    local l3 = 'main/script.lua'

    local final = l1 .. '/' .. l2 .. l3
    loadstring(game:HttpGet((final),true))()
elseif string.find(blacklist,_G.Key) then
game.Players.LocalPlayer:kick("What are u doing ?")
else
game.Players.LocalPlayer:kick("What are u doing ?")
end
