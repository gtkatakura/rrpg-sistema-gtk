local races = {
  { name = "Goblin", level = 1 },
  { name = "Sátiro", level = 1 },
  { name = "Humano", level = 2 },
  { name = "Halfling", level = 2 },
  { name = "Duende", level = 3 },
  { name = "Gnomo", level = 3 },
  { name = "Anão", level = 4 },
  { name = "Elfo", level = 4 },
  { name = "Hobgoblin", level = 4 },
  { name = "Orc", level = 4 },
  { name = "Gnoll", level = 4 },
  { name = "Bugbear", level = 5 },
  { name = "Centauro", level = 5 },
  { name = "Doppelganger", level = 5 },
  { name = "Golias", level = 5 },
  { name = "Minotauro", level = 5 },
  { name = "Ninfa", level = 5 },
  { name = "Bruxo", level = 6 },
  { name = "Fada", level = 6 },
  { name = "Hanyou", level = 6 },
  { name = "Kemono", level = 6 },
  { name = "Lâmia", level = 6 },
  { name = "Morto-Vivo", level = 6 },
  { name = "Sereia", level = 6 },
  { name = "Ogro", level = 7 },
  { name = "Troll", level = 7 },
  { name = "Anjo", level = 8 },
  { name = "Demônio", level = 8 },
  { name = "Hollow", level = 8 },
  { name = "Vampiro", level = 8 },
  { name = "Draconato", level = 9 },
  { name = "Licantropo", level = 9 },
  { name = "Noblesse", level = 9 },
  { name = "Kitsune", level = 9 },
  { name = "Arcanjo", level = 10 },
  { name = "Arquidemônio", level = 10 },
  { name = "Dai-Youkai", level = 10 },
  { name = "Dragonniano", level = 10 },
  { name = "Semi-Deus", level = 10 }
}

local result = rolar("1d100", "Escolha da Raça")

for position, race in pairs(races) do
  if (race.level - 1) * 15 <= result then
    escrever("Opção " .. position .. ": " .. race.name)
  end
end

local choice = tonumber(inputQuery("Escolha da Raça"))

enviar("Raça escolhida: " .. races[choice].name)
