local v = Config.Shop

CreateThread(function()

    if v.blip.enabled then 
        createBlip(v.blip.coords, v.blip.sprite, v.blip.color, v.blip.name, v.blip.scale, false)
    end

    if v.shop.enabled then
        if v.ped.enabled then
            CreateThread(function()
                local ped, pedSpawned
                local textUI
                while true do
                    local sleep = 1500
                    local playerPed = cache.ped
                    local coords = GetEntityCoords(playerPed)
                    local dist = #(coords - v.ped.coords)
                    if dist <= v.ped.distance and not pedSpawned then
                        lib.requestAnimDict('mini@strip_club@idles@bouncer@base', 100)
                        lib.requestModel(v.ped.model, 100)
                        ped = CreatePed(28, v.ped.model, v.ped.coords.x, v.ped.coords.y, v.ped.coords.z, v.ped.heading, false, false)
                        FreezeEntityPosition(ped, true)
                        SetEntityInvincible(ped, true)
                        SetBlockingOfNonTemporaryEvents(ped, true)
                        TaskPlayAnim(ped, 'mini@strip_club@idles@bouncer@base', 'base', 8.0, 0.0, -1, 1, 0, 0, 0, 0)
                        pedSpawned = true
                    elseif dist <= 2 and pedSpawned then
                        sleep = 0
                        if not textUI then
                            lib.showTextUI(v.shop.label)
                            textUI = true
                        end
                        if IsControlJustReleased(0, 38) then
                            textUI = nil
                            lib.hideTextUI()
                            shopMenu(k)
                        end
                    elseif dist >= 2.2 and textUI then
                        sleep = 0
                        lib.hideTextUI()
                        textUI = nil
                    elseif dist >= v.ped.distance and pedSpawned then
                        local model = GetEntityModel(ped)
                        SetModelAsNoLongerNeeded(model)
                        DeletePed(ped)
                        SetPedAsNoLongerNeeded(ped)
                        RemoveAnimDict('mini@strip_club@idles@bouncer@base')
                        pedSpawned = nil
                    end
                    Wait(sleep)
                end
            end)
        end
    end
end)

AddEventHandler('hitta_scuba:purchaseScuba', function(data)
    local canPurchase = lib.callback.await('hitta_scuba:canPurchase', 100, data)
    if canPurchase then
        TriggerEvent('hitta_scuba:notify', Strings.success, Strings.successful_purchase_desc, 'success')
    else
        TriggerEvent('hitta_scuba:notify', Strings.lacking_funds, Strings.lacking_funds_desc, 'error')
    end
end)
