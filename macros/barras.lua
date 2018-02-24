local jogador = choosePlayer('Selecione um jogador')
local personagem = chooseCharacterOfPlayer('Selecione um personagem', jogador);
local ficha = getCharacterSheet(personagem)

jogador:requestSetBarValue(1, nil, ficha.atributos.vigor.total * 3 + 10)
jogador:requestSetBarValue(2, nil, ficha.atributos.energia.total * 3 + 10)
jogador:requestSetBarValue(3, nil, ficha.atributos.vontade.total * 3 + 10)
