require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmAtalhosParaFicha()
    __o_rrpgObjs.beginObjectsLoading();

    local obj = gui.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", rawget(obj, "setNodeObject"));

    function obj:setNodeObject(nodeObject)
        sheet = nodeObject;
        self.sheet = nodeObject;
        self:_oldSetNodeObjectFunction(nodeObject);
    end;

    function obj:setNodeDatabase(nodeObject)
        self:setNodeObject(nodeObject);
    end;

    _gui_assignInitialParentForForm(obj.handle);
    obj:beginUpdate();
    obj:setFormType("tablesDock");
    obj:setDataType("gtk.atalhosDaFicha");
    obj:setTitle("Atalhos para Ficha - GTK (v0.5.5)");
    obj:setName("frmAtalhosParaFicha");


    local function loadPlayers()
      local mesa = rrpg.getMesaDe(self)
      local characteres = Character.find(mesa, 'mine')

      local items = _.pluck(characteres, {'nome'})
      local values = _.pluck(characteres, {'codigoInterno'})

      self.cmbPlayer.items = items
      self.cmbPlayer.values = values
      self.cmbPlayer.value = sheet.playerId
    end

    local function changePlayer()
      if self.cmbPlayer.value ~= "" then
        sheet.playerId = self.cmbPlayer.value

        local mesa = rrpg.getMesaDe(self)
        local personagemItem = mesa:findBibliotecaItem(sheet.playerId)
        local personagem = rrpg.getPersonagemDe(personagemItem)

        personagem:loadSheetNDB(function(player)
          if player ~= nil then
            sheet.player = player

            self.layoutAtributos.visible = true
            self.layoutSentidos.visible = true
          end
        end)
      else
        self.layoutAtributos.visible = false
        self.layoutSentidos.visible = false
      end
    end
  


    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setLeft(5);
    obj.layout1:setTop(5);
    obj.layout1:setHeight(20);
    obj.layout1:setWidth(135);
    obj.layout1:setName("layout1");

    obj.cmbPlayer = gui.fromHandle(_obj_newObject("comboBox"));
    obj.cmbPlayer:setParent(obj.layout1);
    obj.cmbPlayer:setAlign("left");
    obj.cmbPlayer:setName("cmbPlayer");
    obj.cmbPlayer:setWidth(110);
    obj.cmbPlayer:setMargins({right=2});

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setAlign("left");
    obj.button1:setWidth(20);
    obj.button1:setText("R");
    obj.button1:setHint("Recarregar dados");
    obj.button1:setName("button1");

    obj.tabControl1 = gui.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setMargins({top=30});
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("ATR");
    obj.tab1:setHint("Atributos");
    obj.tab1:setName("tab1");

    obj.layoutAtributos = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.layoutAtributos:setParent(obj.tab1);
    obj.layoutAtributos:setName("layoutAtributos");
    obj.layoutAtributos:setLeft(5);
    obj.layoutAtributos:setTop(5);
    obj.layoutAtributos:setHeight(110);
    obj.layoutAtributos:setWidth(150);
    obj.layoutAtributos:setVisible(false);

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layoutAtributos);
    obj.button2:setAlign("left");
    obj.button2:setWidth(40);
    obj.button2:setText("INT");
    obj.button2:setMargins({left=2,right=2,top=2,bottom=2});
    obj.button2:setName("button2");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layoutAtributos);
    obj.button3:setAlign("left");
    obj.button3:setWidth(40);
    obj.button3:setText("SAB");
    obj.button3:setMargins({left=2,right=2,top=2,bottom=2});
    obj.button3:setName("button3");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layoutAtributos);
    obj.button4:setAlign("left");
    obj.button4:setWidth(40);
    obj.button4:setText("VON");
    obj.button4:setMargins({left=2,right=2,top=2,bottom=2});
    obj.button4:setName("button4");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layoutAtributos);
    obj.button5:setAlign("left");
    obj.button5:setWidth(40);
    obj.button5:setText("CAR");
    obj.button5:setMargins({left=2,right=2,top=2,bottom=2});
    obj.button5:setName("button5");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layoutAtributos);
    obj.button6:setAlign("left");
    obj.button6:setWidth(40);
    obj.button6:setText("ENE");
    obj.button6:setMargins({left=2,right=2,top=2,bottom=2});
    obj.button6:setName("button6");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layoutAtributos);
    obj.button7:setAlign("left");
    obj.button7:setWidth(40);
    obj.button7:setText("COR");
    obj.button7:setMargins({left=2,right=2,top=2,bottom=2});
    obj.button7:setName("button7");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layoutAtributos);
    obj.button8:setAlign("left");
    obj.button8:setWidth(40);
    obj.button8:setText("RES");
    obj.button8:setMargins({left=2,right=2,top=2,bottom=2});
    obj.button8:setName("button8");

    obj.button9 = gui.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layoutAtributos);
    obj.button9:setAlign("left");
    obj.button9:setWidth(40);
    obj.button9:setText("VEL");
    obj.button9:setMargins({left=2,right=2,top=2,bottom=2});
    obj.button9:setName("button9");

    obj.button10 = gui.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layoutAtributos);
    obj.button10:setAlign("left");
    obj.button10:setWidth(40);
    obj.button10:setText("AGI");
    obj.button10:setMargins({left=2,right=2,top=2,bottom=2});
    obj.button10:setName("button10");

    obj.button11 = gui.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layoutAtributos);
    obj.button11:setAlign("left");
    obj.button11:setWidth(40);
    obj.button11:setText("DES");
    obj.button11:setMargins({left=2,right=2,top=2,bottom=2});
    obj.button11:setName("button11");

    obj.button12 = gui.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layoutAtributos);
    obj.button12:setAlign("left");
    obj.button12:setWidth(40);
    obj.button12:setText("FOR");
    obj.button12:setMargins({left=2,right=2,top=2,bottom=2});
    obj.button12:setName("button12");

    obj.button13 = gui.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layoutAtributos);
    obj.button13:setAlign("left");
    obj.button13:setWidth(40);
    obj.button13:setText("VIG");
    obj.button13:setMargins({left=2,right=2,top=2,bottom=2});
    obj.button13:setName("button13");

    obj.tab2 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("SEN");
    obj.tab2:setHint("Sentidos");
    obj.tab2:setName("tab2");

    obj.layoutSentidos = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.layoutSentidos:setParent(obj.tab2);
    obj.layoutSentidos:setName("layoutSentidos");
    obj.layoutSentidos:setLeft(5);
    obj.layoutSentidos:setTop(5);
    obj.layoutSentidos:setHeight(80);
    obj.layoutSentidos:setWidth(150);
    obj.layoutSentidos:setVisible(false);

    obj.button14 = gui.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layoutSentidos);
    obj.button14:setAlign("left");
    obj.button14:setWidth(62);
    obj.button14:setText("Sexto Sentido");
    obj.button14:setTextTrimming("word");
    obj.button14:setMargins({left=2,right=2,top=2,bottom=2});
    obj.button14:setName("button14");

    obj.button15 = gui.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layoutSentidos);
    obj.button15:setAlign("left");
    obj.button15:setWidth(62);
    obj.button15:setText("Audição");
    obj.button15:setTextTrimming("word");
    obj.button15:setMargins({left=2,right=2,top=2,bottom=2});
    obj.button15:setName("button15");

    obj.button16 = gui.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layoutSentidos);
    obj.button16:setAlign("left");
    obj.button16:setWidth(62);
    obj.button16:setText("Paladar");
    obj.button16:setTextTrimming("word");
    obj.button16:setMargins({left=2,right=2,top=2,bottom=2});
    obj.button16:setName("button16");

    obj.button17 = gui.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layoutSentidos);
    obj.button17:setAlign("left");
    obj.button17:setWidth(62);
    obj.button17:setText("Olfato");
    obj.button17:setTextTrimming("word");
    obj.button17:setMargins({left=2,right=2,top=2,bottom=2});
    obj.button17:setName("button17");

    obj.button18 = gui.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layoutSentidos);
    obj.button18:setAlign("left");
    obj.button18:setWidth(62);
    obj.button18:setText("Visão");
    obj.button18:setTextTrimming("word");
    obj.button18:setMargins({left=2,right=2,top=2,bottom=2});
    obj.button18:setName("button18");

    obj.button19 = gui.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layoutSentidos);
    obj.button19:setAlign("left");
    obj.button19:setWidth(62);
    obj.button19:setText("Tato");
    obj.button19:setTextTrimming("word");
    obj.button19:setMargins({left=2,right=2,top=2,bottom=2});
    obj.button19:setName("button19");

    obj.tab3 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("PER");
    obj.tab3:setHint("Perícias");
    obj.tab3:setName("tab3");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.tab3);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.recordList1 = gui.fromHandle(_obj_newObject("recordList"));
    obj.recordList1:setParent(obj.scrollBox1);
    obj.recordList1:setField("player.pericias");
    obj.recordList1:setTemplateForm("frmListaDePericias");
    obj.recordList1:setLeft(5);
    obj.recordList1:setTop(5);
    obj.recordList1:setWidth(135);
    obj.recordList1:setAutoHeight(true);
    obj.recordList1:setName("recordList1");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (self)
            loadPlayers()
        end, obj);

    obj._e_event1 = obj.cmbPlayer:addEventListener("onChange",
        function (self)
            changePlayer()
        end, obj);

    obj._e_event2 = obj.button1:addEventListener("onClick",
        function (self)
            loadPlayers()
        end, obj);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(self)
            
                    local textoPersonagem = ""
            
                    if mesa.meuJogador.isMestre then
                      textoPersonagem = sheet.player.nome .. ": "
                    end
            
                    mesa.activeChat:rolarDados(
                      "01d20 + " .. sheet.player.atributos[atributos.INT].total,
                      textoPersonagem .. "Teste de " .. i18n.atributos.INT
                    )
        end, obj);

    obj._e_event4 = obj.button3:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(self)
            
                    local textoPersonagem = ""
            
                    if mesa.meuJogador.isMestre then
                      textoPersonagem = sheet.player.nome .. ": "
                    end
            
                    mesa.activeChat:rolarDados(
                      "01d20 + " .. sheet.player.atributos[atributos.SAB].total,
                      textoPersonagem .. "Teste de " .. i18n.atributos.SAB
                    )
        end, obj);

    obj._e_event5 = obj.button4:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(self)
            
                    local textoPersonagem = ""
            
                    if mesa.meuJogador.isMestre then
                      textoPersonagem = sheet.player.nome .. ": "
                    end
            
                    mesa.activeChat:rolarDados(
                      "01d20 + " .. sheet.player.atributos[atributos.VON].total,
                      textoPersonagem .. "Teste de " .. i18n.atributos.VON
                    )
        end, obj);

    obj._e_event6 = obj.button5:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(self)
            
                    local textoPersonagem = ""
            
                    if mesa.meuJogador.isMestre then
                      textoPersonagem = sheet.player.nome .. ": "
                    end
            
                    mesa.activeChat:rolarDados(
                      "01d20 + " .. sheet.player.atributos[atributos.CAR].total,
                      textoPersonagem .. "Teste de " .. i18n.atributos.CAR
                    )
        end, obj);

    obj._e_event7 = obj.button6:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(self)
            
                    local textoPersonagem = ""
            
                    if mesa.meuJogador.isMestre then
                      textoPersonagem = sheet.player.nome .. ": "
                    end
            
                    mesa.activeChat:rolarDados(
                      "01d20 + " .. sheet.player.atributos[atributos.ENE].total,
                      textoPersonagem .. "Teste de " .. i18n.atributos.ENE
                    )
        end, obj);

    obj._e_event8 = obj.button7:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(self)
            
                    local textoPersonagem = ""
            
                    if mesa.meuJogador.isMestre then
                      textoPersonagem = sheet.player.nome .. ": "
                    end
            
                    mesa.activeChat:rolarDados(
                      "01d20 + " .. sheet.player.atributos[atributos.COR].total,
                      textoPersonagem .. "Teste de " .. i18n.atributos.COR
                    )
        end, obj);

    obj._e_event9 = obj.button8:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(self)
            
                    local textoPersonagem = ""
            
                    if mesa.meuJogador.isMestre then
                      textoPersonagem = sheet.player.nome .. ": "
                    end
            
                    mesa.activeChat:rolarDados(
                      "01d20 + " .. sheet.player.atributos[atributos.RES].total,
                      textoPersonagem .. "Teste de " .. i18n.atributos.RES
                    )
        end, obj);

    obj._e_event10 = obj.button9:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(self)
            
                    local textoPersonagem = ""
            
                    if mesa.meuJogador.isMestre then
                      textoPersonagem = sheet.player.nome .. ": "
                    end
            
                    mesa.activeChat:rolarDados(
                      "01d20 + " .. sheet.player.atributos[atributos.VEL].total,
                      textoPersonagem .. "Teste de " .. i18n.atributos.VEL
                    )
        end, obj);

    obj._e_event11 = obj.button10:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(self)
            
                    local textoPersonagem = ""
            
                    if mesa.meuJogador.isMestre then
                      textoPersonagem = sheet.player.nome .. ": "
                    end
            
                    mesa.activeChat:rolarDados(
                      "01d20 + " .. sheet.player.atributos[atributos.AGI].total,
                      textoPersonagem .. "Teste de " .. i18n.atributos.AGI
                    )
        end, obj);

    obj._e_event12 = obj.button11:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(self)
            
                    local textoPersonagem = ""
            
                    if mesa.meuJogador.isMestre then
                      textoPersonagem = sheet.player.nome .. ": "
                    end
            
                    mesa.activeChat:rolarDados(
                      "01d20 + " .. sheet.player.atributos[atributos.DES].total,
                      textoPersonagem .. "Teste de " .. i18n.atributos.DES
                    )
        end, obj);

    obj._e_event13 = obj.button12:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(self)
            
                    local textoPersonagem = ""
            
                    if mesa.meuJogador.isMestre then
                      textoPersonagem = sheet.player.nome .. ": "
                    end
            
                    mesa.activeChat:rolarDados(
                      "01d20 + " .. sheet.player.atributos[atributos.FOR].total,
                      textoPersonagem .. "Teste de " .. i18n.atributos.FOR
                    )
        end, obj);

    obj._e_event14 = obj.button13:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(self)
            
                    local textoPersonagem = ""
            
                    if mesa.meuJogador.isMestre then
                      textoPersonagem = sheet.player.nome .. ": "
                    end
            
                    mesa.activeChat:rolarDados(
                      "01d20 + " .. sheet.player.atributos[atributos.VIG].total,
                      textoPersonagem .. "Teste de " .. i18n.atributos.VIG
                    )
        end, obj);

    obj._e_event15 = obj.button14:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(self)
            
                    local textoPersonagem = ""
            
                    if mesa.meuJogador.isMestre then
                      textoPersonagem = sheet.player.nome .. ": "
                    end
            
                    mesa.activeChat:rolarDados(
                      "01d20 + " .. sheet.player.sentidos.sextoSentido.total,
                      textoPersonagem .. "Teste de Sexto Sentido"
                    )
        end, obj);

    obj._e_event16 = obj.button15:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(self)
            
                    local textoPersonagem = ""
            
                    if mesa.meuJogador.isMestre then
                      textoPersonagem = sheet.player.nome .. ": "
                    end
            
                    mesa.activeChat:rolarDados(
                      "01d20 + " .. sheet.player.sentidos.audicao.total,
                      textoPersonagem .. "Teste de Audição"
                    )
        end, obj);

    obj._e_event17 = obj.button16:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(self)
            
                    local textoPersonagem = ""
            
                    if mesa.meuJogador.isMestre then
                      textoPersonagem = sheet.player.nome .. ": "
                    end
            
                    mesa.activeChat:rolarDados(
                      "01d20 + " .. sheet.player.sentidos.paladar.total,
                      textoPersonagem .. "Teste de Paladar"
                    )
        end, obj);

    obj._e_event18 = obj.button17:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(self)
            
                    local textoPersonagem = ""
            
                    if mesa.meuJogador.isMestre then
                      textoPersonagem = sheet.player.nome .. ": "
                    end
            
                    mesa.activeChat:rolarDados(
                      "01d20 + " .. sheet.player.sentidos.olfato.total,
                      textoPersonagem .. "Teste de Olfato"
                    )
        end, obj);

    obj._e_event19 = obj.button18:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(self)
            
                    local textoPersonagem = ""
            
                    if mesa.meuJogador.isMestre then
                      textoPersonagem = sheet.player.nome .. ": "
                    end
            
                    mesa.activeChat:rolarDados(
                      "01d20 + " .. sheet.player.sentidos.visao.total,
                      textoPersonagem .. "Teste de Visão"
                    )
        end, obj);

    obj._e_event20 = obj.button19:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(self)
            
                    local textoPersonagem = ""
            
                    if mesa.meuJogador.isMestre then
                      textoPersonagem = sheet.player.nome .. ": "
                    end
            
                    mesa.activeChat:rolarDados(
                      "01d20 + " .. sheet.player.sentidos.tato.total,
                      textoPersonagem .. "Teste de Tato"
                    )
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event20);
        __o_rrpgObjs.removeEventListenerById(self._e_event19);
        __o_rrpgObjs.removeEventListenerById(self._e_event18);
        __o_rrpgObjs.removeEventListenerById(self._e_event17);
        __o_rrpgObjs.removeEventListenerById(self._e_event16);
        __o_rrpgObjs.removeEventListenerById(self._e_event15);
        __o_rrpgObjs.removeEventListenerById(self._e_event14);
        __o_rrpgObjs.removeEventListenerById(self._e_event13);
        __o_rrpgObjs.removeEventListenerById(self._e_event12);
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
        __o_rrpgObjs.removeEventListenerById(self._e_event5);
        __o_rrpgObjs.removeEventListenerById(self._e_event4);
        __o_rrpgObjs.removeEventListenerById(self._e_event3);
        __o_rrpgObjs.removeEventListenerById(self._e_event2);
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.layoutSentidos ~= nil then self.layoutSentidos:destroy(); self.layoutSentidos = nil; end;
        if self.cmbPlayer ~= nil then self.cmbPlayer:destroy(); self.cmbPlayer = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.recordList1 ~= nil then self.recordList1:destroy(); self.recordList1 = nil; end;
        if self.layoutAtributos ~= nil then self.layoutAtributos:destroy(); self.layoutAtributos = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmAtalhosParaFicha = {
    newEditor = newfrmAtalhosParaFicha, 
    new = newfrmAtalhosParaFicha, 
    name = "frmAtalhosParaFicha", 
    dataType = "gtk.atalhosDaFicha", 
    formType = "tablesDock", 
    formComponentName = "form", 
    title = "Atalhos para Ficha - GTK (v0.5.5)", 
    description=""};

frmAtalhosParaFicha = _frmAtalhosParaFicha;
rrpg.registrarForm(_frmAtalhosParaFicha);
rrpg.registrarDataType(_frmAtalhosParaFicha);
rrpg.registrarSpecialForm(_frmAtalhosParaFicha);

return _frmAtalhosParaFicha;
