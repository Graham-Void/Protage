if wl_key == '' then
    game.Players.LocalPlayer:Kick("You are not whitelisted!")
end
if wl_key == ' ' then
    game.Players.LocalPlayer:Kick("You are not whitelisted!")
end

if wl_key == nil then
    game.Players.LocalPlayer:Kick("You are not whitelisted!")
end

local user_id = game.Players.LocalPlayer.UserId
userkey = "https://raw.githubusercontent.com/Graham-Void/Protage/main/White.lua"
blacklist = "https://raw.githubusercontent.com/Graham-Void/Protage/main/banned.lua"
key = game:HttpGet(userkey, true)
banned = game:HttpGet(blacklist, true)

if string.find(key,wl_key) then
    if wl_key == user_id then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Graham-Void/Protage/main/script.lua", true))()
    else
        game.Players.LocalPlayer:Kick("You are not whitelisted!")
    end
elseif string.find(blacklist,wl_key) then
    game.Players.LocalPlayer:Kick("You are blacklisted!, contact graham")
else
    game.Players.LocalPlayer:Kick("You are not whitelisted!, contact graham")
end
