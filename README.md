## ⛏️ doizzp\_excavation - Sistema de Escavação Standalone

Este é um script de sistema de escavação simples e **standalone** desenvolvido para servidores FiveM, utilizando o `ox_lib` para notificações e barra de progresso, e o `ox_inventory` para gerenciamento de itens. O jogador pode usar um item específico (configurável, por padrão uma "colher") em zonas pré-definidas para tentar encontrar tesouros.

-----

### 🌟 Funcionalidades

  * **Item Requerido:** O jogador precisa de um item específico (`Config.RequiredItem`, padrão `'colher'`) no inventário para iniciar a escavação.
  * **Zonas de Escavação:** A escavação só pode ser realizada dentro de um raio definido (`Config.Radius`) de coordenadas específicas (`Config.Zones`) no mapa.
  * **Barra de Progresso:** Utiliza `ox_lib` para exibir uma barra de progresso com animação de jardinagem (`amb@world_human_gardener_plant@male@idle_a`) enquanto o jogador está cavando.
  * **Sistema de Recompensa:** Possui uma chance configurável (`Config.LootChance`, de 0 a 10) de o jogador encontrar um item de recompensa aleatório (`Config.RewardItems`) com quantidade variável.
  * **Efeitos Visuais e Sonoros:** Inclui animação, efeito de partícula de poeira (`ent_dst_dirt`) e som de escavação (`"DIGGING_DIRT"`) enquanto o processo está ativo.

-----

### ⚙️ Requisitos

Certifique-se de que os seguintes recursos estejam em seu servidor e sejam carregados **antes** deste script, conforme indicado no `fxmanifest.lua`:

  * **[`ox_lib`](https://www.google.com/search?q=%5Bhttps://github.com/overextended/ox_lib%5D\(https://github.com/overextended/ox_lib\))** (Framework de utilidades)
  * **[`ox_inventory`](https://www.google.com/search?q=%5Bhttps://github.com/overextended/ox_inventory%5D\(https://github.com/overextended/ox_inventory\))** (Necessário para gerenciamento de itens, como verificado em `server.lua`)

-----

### 🛠️ Instalação

1.  **Download:** Baixe o arquivo `doizzp_excavation`.

2.  **Mover a Pasta:** Coloque a pasta `doizzp_excavation` dentro do diretório `resources/` do seu servidor.

3.  **Adicionar ao `server.cfg`:** Adicione a seguinte linha de comando no seu arquivo `server.cfg` para garantir o carregamento do recurso:

    ```cfg
    ensure doizzp_excavation
    ```

4.  **Adicionar Item (Inventário):** Você deve adicionar o item necessário para a escavação no seu arquivo de configuração de itens do seu inventário (o script usa `ox_inventory`).

      * O nome do item padrão é `'colher'`.
      * O evento cliente que o item deve disparar é `'doizzp_excavation:useShovel'`.

    **Exemplo de item para `ox_inventory` (baseado no `README.txt`)**:

    ```lua
    ['colher'] = {
        label = 'Colher de Escavação',
        weight = 100,
        stack = true,
        close = true,
        description = 'Usada para escavar e procurar tesouros escondidos.',
        client = {
            event = 'doizzp_excavation:useShovel'
        }
    },
    ```

-----

### 📝 Configuração (`config.lua`)

O arquivo `config.lua` permite personalizar os principais parâmetros do sistema:

| Parâmetro | Tipo | Descrição | Valor Padrão |
| :--- | :--- | :--- | :--- |
| `Config.RequiredItem` | `string` | O nome exato do item necessário para cavar. | `'colher'` |
| `Config.ExcavationTime` | `number` | Tempo que o jogador leva para completar a escavação, em **segundos**. | `10` |
| `Config.Radius` | `number` | Raio em que o jogador deve estar próximo de uma coordenada em `Config.Zones` para poder escavar. | `20.0` |
| `Config.LootChance` | `number` | Chance de sucesso na escavação (valor de **0 a 10**). Valores maiores aumentam a chance de encontrar algo. | `5` |
| `Config.RewardItems` | `table` | Lista de itens que o jogador pode encontrar, especificando nome do item (`item`), quantidade mínima (`min`) e máxima (`max`). | `table` |
| `Config.Zones` | `table` | Lista de coordenadas (`vector3`) onde é permitido escavar. | `table` |

**Exemplo de Configuração de Recompensa (`Config.RewardItems`):**

```lua
Config.RewardItems = {
    { item = 'pedra_rara',    min = 1, max = 2 },
    { item = 'moeda_antiga',  min = 1, max = 1 },
    { item = 'anel_enferrujado', min = 1, max = 3 },
    { item = 'osso_antigo',   min = 1, max = 2 },
}
```

**Exemplo de Configuração de Zonas (`Config.Zones`):**

```lua
Config.Zones = {
    vector3(123.45, 321.67, 21.44),
    vector3(234.87, 432.22, 32.10),
    -- ... outras zonas
}
```

-----

### 🤝 Contribuições

Sinta-se à vontade para contribuir, sugerir melhorias ou reportar problemas\!
