local httpService = game:GetService("HttpService")
local HttpRequest = http_request
local Headers = {["content-type"] = "application/json"}

while task.wait(0.2) do
    game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("traitRemote"):InvokeServer("Random", getgenv().Unit)
    local result = game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("traitRemote"):InvokeServer("Random", getgenv().Unit)
        if typeof(result) == "table" and result[1] == getgenv().Trait then
        local FBody = httpService:JSONEncode({
    ["content"] = "<@"..getgenv().UserID..">".." Trait Obtained!",
    ["embeds"] = {
        {
            ["title"] = "Makoto Hub v2 accelerator",
            ["type"] = "rich",
            ["color"] = tonumber(0xffffff),
            ["thumbnail"] = {
                ["url"] = "https://media.discordapp.net/attachments/1308174481793093735/1316079547195588678/image.png?ex=6764f2d7&is=6763a157&hm=9055fa0a5bf94ed25f5cd734f2cc45dc1f3e4b6c0c8fbbb5c73d138974cdd4a6&=&format=webp&quality=lossless&width=1250&height=676" -- Sustituye esta URL por la de tu imagen
            },
            ["fields"] = {
                                {
                    ["name"] = "Unit Rerolled",
                    ["value"] = getgenv().Unit,
                    ["inline"] = true
                },
                                                {
                    ["name"] = "Trait Obtained",
                    ["value"] = getgenv().Trait,
                    ["inline"] = false
                },
                {
                    ["name"] = "Trait Rerolls Left",
                    ["value"] = result[2],
                    ["inline"] = true
                }
            }
        }
    }
})
        HttpRequest({Url = Webhook, Body = FBody, Method = "POST", Headers = Headers})
        break
    end
end