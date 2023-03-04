local display = false

RegisterNUICallback("exit", function()
  SetDisplay(false)
end)

RegisterNUICallback("main", function(data)
  print(data.text)
  SetDisplay(false)
end)

RegisterNUICallback("error", function(data)
  print(data.error)
  SetDisplay(false)
end)

function SetDisplay(bool)
  display = bool
  SetNuiFocus(bool, bool)
  SendNUIMessage({
    type = "ui",
    status = bool,
  })
end

RegisterCommand("report", function()
SetDisplay(not display)
end)

RegisterNUICallback("main", function(data)
  TriggerServerEvent('vl_report:report', data.text)
  TriggerServerEvent('vl_report:sendAdmins', data.text)
  local text = data.text
end)
