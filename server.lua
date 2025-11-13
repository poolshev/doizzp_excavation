lib.callback.register('doizzp_excavation:hasItem', function(source)
    local xPlayer = exports.ox_inventory:GetPlayer(source)
    return xPlayer and xPlayer.hasItem(Config.RequiredItem, 1)
end)

RegisterNetEvent('doizzp_excavation:finishExcavation', function()
    local src = source
    local xPlayer = exports.ox_inventory:GetPlayer(src)
    if not xPlayer then return end

    -- Confere se o jogador tem o item necessário
    if not xPlayer.hasItem(Config.RequiredItem, 1) then
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Escavação',
            description = 'Você precisa de uma colher para cavar.',
            type = 'error'
        })
        return
    end

    -- Chance de encontrar algo
    local chance = math.random(0, 10)
    if chance < Config.LootChance then
        local reward = Config.RewardItems[math.random(#Config.RewardItems)]
        local amount = math.random(reward.min, reward.max)
        xPlayer.addInventoryItem(reward.item, amount)

        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Escavação',
            description = ('Você encontrou %dx %s!'):format(amount, reward.item),
            type = 'success'
        })
    else
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Escavação',
            description = 'Nada encontrado dessa vez...',
            type = 'inform',
        })
    end
end)
