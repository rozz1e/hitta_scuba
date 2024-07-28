Config = {}

Config.Shop = {
    blip = { -- docs.fivem.net/docs/game-references/blips/
        enabled = true, -- enable/disable blip
        coords = vec3(-1094.35, -1348.48, 5.04), -- location of the blip
        sprite = 597, -- docs.fivem.net/docs/game-references/blips/
        color = 26, -- color of the blip
        name = "SCUBA Store", -- blip name
        scale = 0.8, -- how big will the blip be.
    },

    ped = {
        enabled = true, -- enable/disable ped (if false there will be no ped only the textUI).
        model = 's_m_m_cntrybar_01', -- docs.fivem.net/docs/game-references/ped-models/
        coords = vec3(-1094.41, -1348.17, 4.04), -- coords of ped loc.
        heading = 207.29, -- where the ped will be heading.
        distance = 30.0, -- the distance you want peds to spawn at
    },

    shop = {
        enabled = true, -- enable/disable the shop (if false you wont be able to use the shop).
        label = '[E] - Open Shop', -- string of text ui
        item = {label = 'Scuba Gear', name = 'scuba_gear', price = 1500} -- item label / name of database / price
    },

    clothing = {
        male = { -- Male variation
            ['tshirt_1'] = 151,  ['tshirt_2'] = 0,
            ['torso_1'] = 243,   ['torso_2'] = 25,
            ['arms'] = 179,
            ['pants_1'] = 94,   ['pants_2'] = 25,
            ['shoes_1'] = 67,   ['shoes_2'] = 25,
        },
        female = { -- Female variation
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 4,   ['torso_2'] = 14,
            ['arms'] = 4,
            ['pants_1'] = 25,   ['pants_2'] = 1,
            ['shoes_1'] = 16,   ['shoes_2'] = 4,
        }
    }
}

-- Translation
Strings = {
    currency = '$',
    success = 'Success',
    scuba_shop = 'Buy Scuba',
    quantity_dialog = 'Quantity To Order',
    quantity = 'Quantity',
    invalid_amount = 'Invalid Amount',
    invalid_amount_desc = 'Please enter a valid amount',
    successful_purchase_desc = 'You have successfully bought your scuba gear',
    lacking_funds = 'Lacking Funds',
    lacking_funds_desc = 'You are lacking funds in the bank for this purchase',
    equipped_scuba = 'You have just equipped your scuba gear',
    unequip_scuba = 'You have just removed your scuba gear'
}
