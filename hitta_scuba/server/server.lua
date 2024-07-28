ESX = exports["es_extended"]:getSharedObject()

local v = Config.Shop

lib.callback.register('hitta_scuba:canPurchase', function(source, data)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xBank = xPlayer.getAccount('money').money
    if xBank >= v.shop.item.price then
        xPlayer.removeAccountMoney('money', v.shop.item.price)
        xPlayer.addInventoryItem(v.shop.item.name, 1)
        return true
    else
        return false
    end
end)

ESX.RegisterUsableItem(v.shop.item.name, function(source)
    TriggerClientEvent('hitta_scuba:addScuba', source)
end)
