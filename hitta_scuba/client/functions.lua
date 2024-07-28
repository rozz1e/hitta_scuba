ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('hitta_scuba:notify', function(title, desc, style)
    lib.notify({
        title = title,
        description = desc,
        duration = 3500,
        type = style
    })
end)

createBlip = function(coords, sprite, color, text, scale)
	local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
	SetBlipSprite(blip, sprite)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, scale)
	SetBlipColour(blip, color)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(text)
	EndTextCommandSetBlipName(blip)
end

local addCommas = function(n)
	return tostring(math.floor(n)):reverse():gsub("(%d%d%d)","%1,")
	:gsub(",(%-?)$","%1"):reverse()
end

shopMenu = function(shop)
	local data = Config.Shop.shop
	local allow = true
	local items
	items = data.item
	local Options = {}
	for k,v in pairs(items) do
		Options[#Options] = {
			title = data.item.label,
			description = '',
			arrow = false,
			event = 'hitta_scuba:purchaseScuba',
		}
		Options[#Options].description = Strings.currency..addCommas(data.item.price)
	end
	lib.registerContext({
		id = 'scuba_shop',
		title = Strings.scuba_shop,
		options = Options
	})
	lib.showContext('scuba_shop')
end

AddEventHandler('hitta_scuba:changeClothes', function(data)
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        if skin.sex == 0 then
			TriggerEvent('skinchanger:loadClothes', skin, Config.Shop.clothing.male)
		elseif skin.sex == 1 then
			TriggerEvent('skinchanger:loadClothes', skin, Config.Shop.clothing.female)
		end
    end)
end)
