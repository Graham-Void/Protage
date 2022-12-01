userkey = "https://raw.githubusercontent.com/Graham-Void/Protage/main/White.lua"
blacklist = "https://raw.githubusercontent.com/Graham-Void/Protage/main/banned.lua"
key = game:HttpGet(userkey, true)
banned = game:HttpGet(blacklist, true)
if string.find(key,_G.Key) then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Graham-Void/Protage/main/script.lua", true))()
elseif string.find(blacklist,_G.Key) then
    game.Players.LocalPlayer:kick("What are u doing ?")
else
    game.Players.LocalPlayer:kick("What are u doing ?")
end
