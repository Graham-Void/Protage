userkey = "https://raw.githubusercontent.com/Graham-Void/Protage/main/White.lua"
blacklist = "https://raw.githubusercontent.com/Graham-Void/Protage/main/banned.lua"
key = game:HttpGet(userkey, true)
banned = game:HttpGet(blacklist, true)

if _G.key == '' then
    game.Players.LocalPlayer:Kick("You are not whitelisted!")
end
if _G.key == ' ' then
    game.Players.LocalPlayer:Kick("You are not whitelisted!")
end

if string.find(key,_G.Key) then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Graham-Void/Protage/main/script.lua", true))()
elseif string.find(blacklist,_G.Key) then
    game.Players.LocalPlayer:Kick("You are banned!")
else
    game.Players.LocalPlayer:Kick("You are not whitelisted!")
end
