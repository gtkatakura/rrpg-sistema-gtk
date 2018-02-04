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
    obj:setTitle("GTK (0.4) - Atalhos para Ficha");
    obj:setName("frmAtalhosParaFicha");
    obj:setHeight(300);
    obj:setWidth(300);


    local function carregar()
      local mesa = rrpg.getMesaDe(self);
      local jogador = mesa.meuJogador;
      local personagemItem = mesa:findBibliotecaItem(jogador.personagemPrincipal)
      local personagem = rrpg.getPersonagemDe(personagemItem)

      personagem:loadSheetNDB(function(player)
        if player ~= nil then
          sheet.player = player

          self.layoutAttributos.visible = true
        end
      end)
    end
  


    obj.tabControl1 = gui.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Atributos");
    obj.tab1:setName("tab1");

    obj.btnCarregar = gui.fromHandle(_obj_newObject("button"));
    obj.btnCarregar:setParent(obj.tab1);
    obj.btnCarregar:setName("btnCarregar");
    obj.btnCarregar:setText("Carregar");
    obj.btnCarregar:setLeft(10);
    obj.btnCarregar:setTop(10);

    obj.layoutAttributos = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.layoutAttributos:setParent(obj.tab1);
    obj.layoutAttributos:setName("layoutAttributos");
    obj.layoutAttributos:setLeft(10);
    obj.layoutAttributos:setTop(50);
    obj.layoutAttributos:setHeight(200);
    obj.layoutAttributos:setWidth(150);
    obj.layoutAttributos:setVisible(false);

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layoutAttributos);
    obj.button1:setAlign("left");
    obj.button1:setWidth(40);
    obj.button1:setText("INT");
    obj.button1:setMargins({left=2,right=2,top=2,bottom=2});
    obj.button1:setName("button1");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layoutAttributos);
    obj.button2:setAlign("left");
    obj.button2:setWidth(40);
    obj.button2:setText("SAB");
    obj.button2:setMargins({left=2,right=2,top=2,bottom=2});
    obj.button2:setName("button2");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layoutAttributos);
    obj.button3:setAlign("left");
    obj.button3:setWidth(40);
    obj.button3:setText("VON");
    obj.button3:setMargins({left=2,right=2,top=2,bottom=2});
    obj.button3:setName("button3");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layoutAttributos);
    obj.button4:setAlign("left");
    obj.button4:setWidth(40);
    obj.button4:setText("CAR");
    obj.button4:setMargins({left=2,right=2,top=2,bottom=2});
    obj.button4:setName("button4");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layoutAttributos);
    obj.button5:setAlign("left");
    obj.button5:setWidth(40);
    obj.button5:setText("ENE");
    obj.button5:setMargins({left=2,right=2,top=2,bottom=2});
    obj.button5:setName("button5");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layoutAttributos);
    obj.button6:setAlign("left");
    obj.button6:setWidth(40);
    obj.button6:setText("COR");
    obj.button6:setMargins({left=2,right=2,top=2,bottom=2});
    obj.button6:setName("button6");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layoutAttributos);
    obj.button7:setAlign("left");
    obj.button7:setWidth(40);
    obj.button7:setText("RES");
    obj.button7:setMargins({left=2,right=2,top=2,bottom=2});
    obj.button7:setName("button7");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layoutAttributos);
    obj.button8:setAlign("left");
    obj.button8:setWidth(40);
    obj.button8:setText("VEL");
    obj.button8:setMargins({left=2,right=2,top=2,bottom=2});
    obj.button8:setName("button8");

    obj.button9 = gui.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layoutAttributos);
    obj.button9:setAlign("left");
    obj.button9:setWidth(40);
    obj.button9:setText("AGI");
    obj.button9:setMargins({left=2,right=2,top=2,bottom=2});
    obj.button9:setName("button9");

    obj.button10 = gui.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layoutAttributos);
    obj.button10:setAlign("left");
    obj.button10:setWidth(40);
    obj.button10:setText("DES");
    obj.button10:setMargins({left=2,right=2,top=2,bottom=2});
    obj.button10:setName("button10");

    obj.button11 = gui.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layoutAttributos);
    obj.button11:setAlign("left");
    obj.button11:setWidth(40);
    obj.button11:setText("FOR");
    obj.button11:setMargins({left=2,right=2,top=2,bottom=2});
    obj.button11:setName("button11");

    obj.button12 = gui.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layoutAttributos);
    obj.button12:setAlign("left");
    obj.button12:setWidth(40);
    obj.button12:setText("VIG");
    obj.button12:setMargins({left=2,right=2,top=2,bottom=2});
    obj.button12:setName("button12");

    obj.tab2 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Perícias");
    obj.tab2:setName("tab2");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.tab2);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.recordList1 = gui.fromHandle(_obj_newObject("recordList"));
    obj.recordList1:setParent(obj.scrollBox1);
    obj.recordList1:setField("player.pericias");
    obj.recordList1:setTemplateForm("frmListaDePericias");
    obj.recordList1:setLeft(10);
    obj.recordList1:setTop(10);
    obj.recordList1:setWidth(150);
    obj.recordList1:setAutoHeight(true);
    obj.recordList1:setName("recordList1");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (self)
            if sheet ~= nil and sheet.player ~= nil then
                  self.layoutAttributos.visible = true
                else
                  carregar()
                end
        end, obj);

    obj._e_event1 = obj.btnCarregar:addEventListener("onClick",
        function (self)
            carregar()
        end, obj);

    obj._e_event2 = obj.button1:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(self)
            
                    mesa.chat:rolarDados(
                      "01d20 + " .. sheet.player.atributos[atributos.INT].total,
                      "Teste de " .. i18n.atributos.INT
                    )
        end, obj);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(self)
            
                    mesa.chat:rolarDados(
                      "01d20 + " .. sheet.player.atributos[atributos.SAB].total,
                      "Teste de " .. i18n.atributos.SAB
                    )
        end, obj);

    obj._e_event4 = obj.button3:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(self)
            
                    mesa.chat:rolarDados(
                      "01d20 + " .. sheet.player.atributos[atributos.VON].total,
                      "Teste de " .. i18n.atributos.VON
                    )
        end, obj);

    obj._e_event5 = obj.button4:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(self)
            
                    mesa.chat:rolarDados(
                      "01d20 + " .. sheet.player.atributos[atributos.CAR].total,
                      "Teste de " .. i18n.atributos.CAR
                    )
        end, obj);

    obj._e_event6 = obj.button5:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(self)
            
                    mesa.chat:rolarDados(
                      "01d20 + " .. sheet.player.atributos[atributos.ENE].total,
                      "Teste de " .. i18n.atributos.ENE
                    )
        end, obj);

    obj._e_event7 = obj.button6:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(self)
            
                    mesa.chat:rolarDados(
                      "01d20 + " .. sheet.player.atributos[atributos.COR].total,
                      "Teste de " .. i18n.atributos.COR
                    )
        end, obj);

    obj._e_event8 = obj.button7:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(self)
            
                    mesa.chat:rolarDados(
                      "01d20 + " .. sheet.player.atributos[atributos.RES].total,
                      "Teste de " .. i18n.atributos.RES
                    )
        end, obj);

    obj._e_event9 = obj.button8:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(self)
            
                    mesa.chat:rolarDados(
                      "01d20 + " .. sheet.player.atributos[atributos.VEL].total,
                      "Teste de " .. i18n.atributos.VEL
                    )
        end, obj);

    obj._e_event10 = obj.button9:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(self)
            
                    mesa.chat:rolarDados(
                      "01d20 + " .. sheet.player.atributos[atributos.AGI].total,
                      "Teste de " .. i18n.atributos.AGI
                    )
        end, obj);

    obj._e_event11 = obj.button10:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(self)
            
                    mesa.chat:rolarDados(
                      "01d20 + " .. sheet.player.atributos[atributos.DES].total,
                      "Teste de " .. i18n.atributos.DES
                    )
        end, obj);

    obj._e_event12 = obj.button11:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(self)
            
                    mesa.chat:rolarDados(
                      "01d20 + " .. sheet.player.atributos[atributos.FOR].total,
                      "Teste de " .. i18n.atributos.FOR
                    )
        end, obj);

    obj._e_event13 = obj.button12:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(self)
            
                    mesa.chat:rolarDados(
                      "01d20 + " .. sheet.player.atributos[atributos.VIG].total,
                      "Teste de " .. i18n.atributos.VIG
                    )
        end, obj);

    function obj:_releaseEvents()
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
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.btnCarregar ~= nil then self.btnCarregar:destroy(); self.btnCarregar = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layoutAttributos ~= nil then self.layoutAttributos:destroy(); self.layoutAttributos = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.recordList1 ~= nil then self.recordList1:destroy(); self.recordList1 = nil; end;
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
    title = "GTK (0.4) - Atalhos para Ficha", 
    description=""};

frmAtalhosParaFicha = _frmAtalhosParaFicha;
rrpg.registrarForm(_frmAtalhosParaFicha);
rrpg.registrarDataType(_frmAtalhosParaFicha);
rrpg.registrarSpecialForm(_frmAtalhosParaFicha);

return _frmAtalhosParaFicha;
