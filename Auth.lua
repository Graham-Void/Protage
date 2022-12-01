
local wl_key;

local key = game:HttpGet("https://raw.githubusercontent.com/Graham-Void/Protage/main/White.lua", true)
local banned = game:HttpGet("https://raw.githubusercontent.com/Graham-Void/Protage/main/banned.lua", true)
local user_id = game.Players.LocalPlayer.UserId

if string.find(key,wl_key) then
    if wl_key == user_id then
        discord_embed('Successful Login')
        wait(2)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Graham-Void/Protage/main/script.lua", true))()
    else
        discord_embed('Failed Login Attempt, Key is Valid, but User ID is Invalid')
        wait(2)
        game.Players.LocalPlayer:Kick("You are not whitelisted!")
    end
elseif string.find(banned,wl_key) then
    discord_embed('Failed Login Attempt, Key is Blacklisted')
    wait(2)
    game.Players.LocalPlayer:Kick("You are blacklisted!, contact graham")
else
    discord_embed('Failed Login Attempt, Key is Invalid')
    wait(2)
    game.Players.LocalPlayer:Kick("You are not whitelisted!, contact graham")
end
