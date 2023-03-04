ESX = exports['es_extended']:getSharedObject()

local discord_webhook = {
    url = "webhook here",
    image = "image here",
}
local server_name = "Szervered Neve"

RegisterServerEvent('vl_report:report')
AddEventHandler('vl_report:report', function(text)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local name = xPlayer.getName()
	text = text
	Citizen.Wait(50)
    print(text)
    PerformHttpRequest(discord_webhook.url,
    function(text) end,
    'POST',
    json.encode({
        username = server_name.." - Report",
        embeds = {{
            ["color"] = "9807270",
            ["author"] = {
                ["name"] = server_name.." - Report",
                ["icon_url"] = "https://media.discordapp.net/attachments/1007323975451418684/1071201859202711693/bg1.png",
            },
            ["title"] = "[Report]: "..text.."\n".."[Név]: "..name,
            -- ["description"] = "Több infó a szerveren",
            ["footer"] = {
                ["text"] = server_name.." - Report".." • "..os.date("%x %X %p"),
                ["icon_url"] = "https://media.discordapp.net/attachments/1007323975451418684/1071201859202711693/bg1.png",
            },
        }},
        avatar_url = "https://media.discordapp.net/attachments/1007323975451418684/1071201859202711693/bg1.png"
    }), {
        ['Content-Type'] = 'application/json' 
    })
end)
--elkuldtem

RegisterServerEvent('vl_report:sendAdmins')
AddEventHandler('vl_report:sendAdmins', function(text)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local name = xPlayer.getName()
    local group = xPlayer.getGroup()
    local pos = xPlayer.getCoords(true)
    if group == "admin" then
        TriggerClientEvent("chatMessage", -1, server_name.." - Report", {124,197,118}, name.." | "..text.." | "..pos)
    else
        print(false)
    end
end)
