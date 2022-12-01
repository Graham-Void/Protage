userkey = "https://raw.githubusercontent.com/Graham-Void/Protage/main/White.lua"
blacklist = "https://raw.githubusercontent.com/Graham-Void/Protage/main/banned.lua"
key = game:HttpGet(userkey, true)
banned = game:HttpGet(blacklist, true)

if string.find(key,wl_key) then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Graham-Void/Protage/main/script.lua", true))()
elseif string.find(blacklist,wl_key) then
    game.Players.LocalPlayer:Kick("You are blacklisted!, contact graham")
else
    game.Players.LocalPlayer:Kick("You are not whitelisted!, contact graham")
end
