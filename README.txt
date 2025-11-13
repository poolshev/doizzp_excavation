🔧 Como usar

Adicione o item “colher” no seu inventário:

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


Certifique-se de ter o ox_lib rodando antes deste script.

Coloque a pasta doizzp_excavation em resources/ e adicione no seu server.cfg:

ensure doizzp_excavation