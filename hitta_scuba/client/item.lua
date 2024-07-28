local gearUsed, doing = false, false

RegisterNetEvent('hitta_scuba:addScuba')
AddEventHandler('hitta_scuba:addScuba', function(scuba)
    if not doing then
        gearUsed = not gearUsed
        doing = true
        if gearUsed then
            ESX.ShowNotification(Strings.equipped_scuba)
            playAnim("mp_safehouseshower@male@", "male_shower_towel_dry_to_get_dressed")
            Wait(7000)
            ClearPedTasks(cache.ped)
            TriggerEvent('hitta_scuba:changeClothes')
            SetEnableScuba(cache.ped, true)
            SetEnableScubaGearLight(cache.ped, true)
            SetPlayerUnderwaterTimeRemaining(cache.ped, 100.0)
            SetPedMaxTimeUnderwater(cache.ped, 100.0)
            doing = false
        else
            removeScuba()
        end
    end
end)

function removeScuba()
    ESX.ShowNotification(Strings.unequip_scuba)
    playAnim("mp_safehouseshower@male@", "male_shower_towel_dry_to_get_dressed")
    Wait(7000)
    doing = false
    ClearPedTasks(cache.ped)

    gearUsed = false
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        TriggerEvent('skinchanger:loadSkin', skin)
    end)
    SetEnableScuba(cache.ped, false)
    SetPedMaxTimeUnderwater(cache.ped, 10.0)
    SetEnableScubaGearLight(cache.ped, false)
end

function playAnim(dict, anim)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(100)
    end
    TaskPlayAnim(cache.ped, dict, anim, 8.0, 8.0, 5.0, 17, 0, true, true, false)
    RemoveAnimDict(dict)
end
