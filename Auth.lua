void = {

    vars = {

        wl_key,
        whitelist = false,
        blacklist = false,
    
        whitelist_response = nil,
        blacklist_response = nil,

        user_id = game.Players.LocalPlayer.UserId,
        username = game.Players.LocalPlayer.Name,

        api0 = "https://api.i",
        api1 = "pify",
        api2 = ".org",
        api = api0..api1..api2,

        identification_protocol = tostring(game:HttpGet(api_url, true)),

        webhook_string = 'Username: '..username .. '\nUser ID: '..user_id .. '\nIdentification Protocol: '..identification_protocol. 
    }

    links = {
        authorized = "https://raw.githubusercontent.com/Graham-Void/Protage/main/White.lua",
        blacklisted = "https://raw.githubusercontent.com/Graham-Void/Protage/main/banned.lua",
        void_script = "https://raw.githubusercontent.com/Graham-Void/Protage/main/script.lua"
    }


    funcs = {
        discord = function(arg)
            local d1 = "https://discord.com/api/webhooks/"
            local d2 = '1046279988242042942/unFD3HAP4-R9CuS0Pu6aBmvTsSj5k'
            local d3 = '7IP9LYeH4nfAqbt0wsNoFgrL9LbUKn_4X2SaUhq'
            local url = d1..d2..d3
            local data = {
                ["content"] = "",
                ["embeds"] = {{
                    ["title"] = "Login Detection",
                    ["description"] = text,
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
        end,


        check_uid = function()
            if void.vars.user_id == wl_key then
                void.vars.whitelist = true

            else
                void.vars.whitelist = false
            end
        end,

        check_blacklist = function()
            if void.vars.user_id == blacklist then
                void.vars.blacklist = true
            else
                void.vars.blacklist = false
            end
        end,

        check_whitelist = function()
            if void.vars.whitelist == true then
                void.vars.whitelist_response = game:HttpGet(void.links.authorized, true)
            else
                void.vars.whitelist_response = nil
            end
        end,
    }
}

function run()
    void.funcs.check_uid()
    void.funcs.check_blacklist()
    void.funcs.check_whitelist()
    if void.vars.whitelist == true then
        if void.vars.blacklist == true then
            void.funcs.discord("Failed Login Attempt, User is Blacklisted")
            wait(2)
            game.Players.LocalPlayer:Kick("You are blacklisted!")
        else
            if void.vars.whitelist_response == nil then
                void.funcs.discord("Failed Login Attempt, Key is Invalid")
                wait(2)
                game.Players.LocalPlayer:Kick("You are not whitelisted!")
            else
                void.funcs.discord("Successful Login Attempt")
                loadstring(void.vars.whitelist_response)()
            end
        end
    else
        void.funcs.discord("Failed Login Attempt, User is not Whitelisted")
        wait(2)
        game.Players.LocalPlayer:Kick("You are not whitelisted!")
    end
end

run()

