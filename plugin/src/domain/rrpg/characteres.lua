local function _getAllCharactersSorted(mesa, filterFunction)
  local chars = {};

  local function recursiveEnumChars(bibItem, chars)

    if bibItem == nil then
      return;
    end;

    local tipo = bibItem.tipo;

    if tipo == "personagem" then
      local filtrado = false;

      if filterFunction ~= nil then
        filtrado = filterFunction(bibItem);
      else
        filtrado = true;
      end;

      if filtrado then
        chars[#chars + 1] = bibItem;
      end;
    elseif tipo == "diretorio" or tipo == "biblioteca" then
      local filhos = bibItem.filhos;
      local i;

      for i = 1, #filhos, 1 do
        recursiveEnumChars(filhos[i], chars);
      end
    end;
  end;

  local bibRoot = mesa.biblioteca;
  recursiveEnumChars(bibRoot, chars);

  table.sort(chars, function(left, right)
    return utils.compareStringPtBr(left.nome, right.nome) < 0
  end)

  return chars;
end;

local function _createCharactersFilterFunction(myPlayer, filter)
  local myLogin = nil

  if myPlayer ~= nil then
    myLogin = myPlayer.login;
  end

  return function(c)
    -- filter function
    local loginDono = c.loginDono;
    local isPC = type(loginDono) == "string" and loginDono ~= "";

    if filter == "pc" then
      return isPC;
    elseif filter == "pcOnline" then
      return isPC and c.dono ~= nil;
    elseif filter == "npc" then
      return not isPC;
    elseif filter == "all" then
      return true;
    elseif filter == "mine" then
      return isPC and (utils.compareStringPtBr(loginDono, myLogin) == 0)
    elseif filter == nil then
      return true;
    else
      error(lang("macros.error.invalidCharacterFilter") .. ": " .. tostring(filter));
    end
  end
end

Character = {
  find = function(mesa, filter)
    local player = mesa.meuJogador
    local chars = _getAllCharactersSorted(mesa, _createCharactersFilterFunction(player, filter))

    return chars
  end
}
