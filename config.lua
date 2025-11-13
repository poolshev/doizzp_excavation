Config = {}

-- Item necessário para cavar
Config.RequiredItem = 'colher'

-- Tempo da escavação (em segundos)
Config.ExcavationTime = 10

-- Raio de escavação válido
Config.Radius = 20.0

-- Chance (0 a 10) de achar algo
Config.LootChance = 5  -- quanto maior, mais fácil de encontrar algo

-- Itens possíveis (nome e quantidade)
Config.RewardItems = {
    { item = 'pedra_rara',    min = 1, max = 2 },
    { item = 'moeda_antiga',  min = 1, max = 1 },
    { item = 'anel_enferrujado', min = 1, max = 3 },
    { item = 'osso_antigo',   min = 1, max = 2 },
}

-- Coordenadas onde é possível escavar
Config.Zones = {
    vector3(123.45, 321.67, 21.44),
    vector3(234.87, 432.22, 32.10),
    vector3(-523.55, 191.21, 83.22),
    vector3(822.11, -1723.45, 28.20),
    vector3(1402.32, 1123.55, 113.50),
    vector3(-223.12, -1456.66, 31.12),
    vector3(2578.44, 4321.99, 44.10),
    vector3(-1502.22, 812.77, 180.12),
    vector3(1015.11, -2301.55, 30.12),
    vector3(-305.44, 6215.55, 31.34),
}
