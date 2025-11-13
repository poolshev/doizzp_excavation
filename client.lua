local digging = false

RegisterNetEvent('doizzp_excavation:useShovel', function()
    if digging then return end

    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    -- Verifica se está dentro de alguma zona válida
    local inZone = false
    for _, zone in pairs(Config.Zones) do
        if #(coords - zone) <= Config.Radius then
            inZone = true
            break
        end
    end

    if not inZone then
        lib.notify({
            title = 'Escavação',
            description = 'Você não sente nada de especial por aqui...',
            type = 'error'
        })
        return
    end

    digging = true

    -- Define a posição da escavação (no chão)
    local digCoords = vec3(coords.x, coords.y, coords.z - 1.0)

    -- Carrega animação e partícula
    RequestAnimDict('amb@world_human_gardener_plant@male@idle_a')
    while not HasAnimDictLoaded('amb@world_human_gardener_plant@male@idle_a') do
        Wait(10)
    end

    RequestNamedPtfxAsset('core')
    while not HasNamedPtfxAssetLoaded('core') do
        Wait(10)
    end

    -- Inicia o som de escavação
    local soundId = GetSoundId()
    PlaySoundFromCoord(soundId, "DIGGING_DIRT", digCoords.x, digCoords.y, digCoords.z, 0, 0, 0, 0)

    -- Animação e progress bar
    lib.progressCircle({
        duration = Config.ExcavationTime * 1000,
        label = 'Cavando...',
        position = 'bottom',
        useWhileDead = false,
        canCancel = false,
        disable = { move = true, car = true, combat = true },
        anim = {
            dict = 'amb@world_human_gardener_plant@male@idle_a',
            clip = 'idle_a'
        },
        onStart = function()
            -- Efeito de poeira
            UseParticleFxAssetNextCall('core')
            local fx = StartParticleFxLoopedAtCoord('ent_dst_dirt', digCoords.x, digCoords.y, digCoords.z, 0.0, 0.0, 0.0, 1.5, false, false, false, false)
            
            -- Loop enquanto cava
            CreateThread(function()
                Wait(Config.ExcavationTime * 1000)
                StopParticleFxLooped(fx, 0)
                StopSound(soundId)
                ReleaseSoundId(soundId)
            end)
        end
    })

    -- Finaliza e envia para o servidor
    TriggerServerEvent('doizzp_excavation:finishExcavation')
    digging = false
end)
