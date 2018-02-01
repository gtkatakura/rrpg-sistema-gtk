require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmFichaDoPersonagem()
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
    obj:setFormType("sheetTemplate");
    obj:setDataType("gtk.fichaDoPersonagem");
    obj:setTitle("Sistema GTK - Ficha do Personagem (v0.1)");
    obj:setName("frmFichaDoPersonagem");

    obj.tabControl1 = gui.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Atributos");
    obj.tab1:setName("tab1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.tab1);
    obj.layout1:setLeft(20);
    obj.layout1:setTop(20);
    obj.layout1:setHeight(25);
    obj.layout1:setWidth(250);
    obj.layout1:setName("layout1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setAlign("left");
    obj.label1:setText("Inteligência: ");
    obj.label1:setAutoSize(true);
    obj.label1:setName("label1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setAlign("client");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setField("atributos.inteligencia");
    obj.edit1:setName("edit1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.tab1);
    obj.layout2:setLeft(20);
    obj.layout2:setTop(50);
    obj.layout2:setHeight(25);
    obj.layout2:setWidth(250);
    obj.layout2:setName("layout2");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setAlign("left");
    obj.label2:setText("Sabedoria: ");
    obj.label2:setAutoSize(true);
    obj.label2:setName("label2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setAlign("client");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setField("atributos.sabedoria");
    obj.edit2:setName("edit2");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.tab1);
    obj.layout3:setLeft(20);
    obj.layout3:setTop(80);
    obj.layout3:setHeight(25);
    obj.layout3:setWidth(250);
    obj.layout3:setName("layout3");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout3);
    obj.label3:setAlign("left");
    obj.label3:setText("Vontade: ");
    obj.label3:setAutoSize(true);
    obj.label3:setName("label3");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setAlign("client");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setField("atributos.vontade");
    obj.edit3:setName("edit3");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.tab1);
    obj.layout4:setLeft(20);
    obj.layout4:setTop(110);
    obj.layout4:setHeight(25);
    obj.layout4:setWidth(250);
    obj.layout4:setName("layout4");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout4);
    obj.label4:setAlign("left");
    obj.label4:setText("Carisma: ");
    obj.label4:setAutoSize(true);
    obj.label4:setName("label4");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout4);
    obj.edit4:setAlign("client");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setField("atributos.carisma");
    obj.edit4:setName("edit4");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.tab1);
    obj.layout5:setLeft(20);
    obj.layout5:setTop(140);
    obj.layout5:setHeight(25);
    obj.layout5:setWidth(250);
    obj.layout5:setName("layout5");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout5);
    obj.label5:setAlign("left");
    obj.label5:setText("Energia: ");
    obj.label5:setAutoSize(true);
    obj.label5:setName("label5");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout5);
    obj.edit5:setAlign("client");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setField("atributos.energia");
    obj.edit5:setName("edit5");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.tab1);
    obj.layout6:setLeft(20);
    obj.layout6:setTop(170);
    obj.layout6:setHeight(25);
    obj.layout6:setWidth(250);
    obj.layout6:setName("layout6");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout6);
    obj.label6:setAlign("left");
    obj.label6:setText("Corpo: ");
    obj.label6:setAutoSize(true);
    obj.label6:setName("label6");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout6);
    obj.edit6:setAlign("client");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setField("atributos.corpo");
    obj.edit6:setName("edit6");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.tab1);
    obj.layout7:setLeft(280);
    obj.layout7:setTop(20);
    obj.layout7:setHeight(25);
    obj.layout7:setWidth(250);
    obj.layout7:setName("layout7");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout7);
    obj.label7:setAlign("left");
    obj.label7:setText("Resistência: ");
    obj.label7:setAutoSize(true);
    obj.label7:setName("label7");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout7);
    obj.edit7:setAlign("client");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setField("atributos.resistencia");
    obj.edit7:setName("edit7");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.tab1);
    obj.layout8:setLeft(280);
    obj.layout8:setTop(50);
    obj.layout8:setHeight(25);
    obj.layout8:setWidth(250);
    obj.layout8:setName("layout8");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout8);
    obj.label8:setAlign("left");
    obj.label8:setText("Velocidade: ");
    obj.label8:setAutoSize(true);
    obj.label8:setName("label8");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout8);
    obj.edit8:setAlign("client");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setField("atributos.velocidade");
    obj.edit8:setName("edit8");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.tab1);
    obj.layout9:setLeft(280);
    obj.layout9:setTop(80);
    obj.layout9:setHeight(25);
    obj.layout9:setWidth(250);
    obj.layout9:setName("layout9");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout9);
    obj.label9:setAlign("left");
    obj.label9:setText("Agilidade: ");
    obj.label9:setAutoSize(true);
    obj.label9:setName("label9");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout9);
    obj.edit9:setAlign("client");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setField("atributos.agilidade");
    obj.edit9:setName("edit9");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.tab1);
    obj.layout10:setLeft(280);
    obj.layout10:setTop(110);
    obj.layout10:setHeight(25);
    obj.layout10:setWidth(250);
    obj.layout10:setName("layout10");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout10);
    obj.label10:setAlign("left");
    obj.label10:setText("Destreza: ");
    obj.label10:setAutoSize(true);
    obj.label10:setName("label10");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout10);
    obj.edit10:setAlign("client");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setField("atributos.destreza");
    obj.edit10:setName("edit10");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.tab1);
    obj.layout11:setLeft(280);
    obj.layout11:setTop(140);
    obj.layout11:setHeight(25);
    obj.layout11:setWidth(250);
    obj.layout11:setName("layout11");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout11);
    obj.label11:setAlign("left");
    obj.label11:setText("Força: ");
    obj.label11:setAutoSize(true);
    obj.label11:setName("label11");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout11);
    obj.edit11:setAlign("client");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setField("atributos.forca");
    obj.edit11:setName("edit11");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.tab1);
    obj.layout12:setLeft(280);
    obj.layout12:setTop(170);
    obj.layout12:setHeight(25);
    obj.layout12:setWidth(250);
    obj.layout12:setName("layout12");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout12);
    obj.label12:setAlign("left");
    obj.label12:setText("Vigor: ");
    obj.label12:setAutoSize(true);
    obj.label12:setName("label12");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout12);
    obj.edit12:setAlign("client");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setField("atributos.vigor");
    obj.edit12:setName("edit12");

    obj.tab2 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Perícias");
    obj.tab2:setName("tab2");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.tab2);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setLeft(20);
    obj.button1:setTop(20);
    obj.button1:setHeight(25);
    obj.button1:setText("Nova Perícia");
    obj.button1:setWidth(100);
    obj.button1:setName("button1");

    obj.pericias = gui.fromHandle(_obj_newObject("recordList"));
    obj.pericias:setParent(obj.scrollBox1);
    obj.pericias:setName("pericias");
    obj.pericias:setField("pericias");
    obj.pericias:setTemplateForm("frmPericias");
    obj.pericias:setLeft(20);
    obj.pericias:setTop(60);
    obj.pericias:setWidth(530);
    obj.pericias:setAutoHeight(true);

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            self.pericias:append()
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.pericias ~= nil then self.pericias:destroy(); self.pericias = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmFichaDoPersonagem = {
    newEditor = newfrmFichaDoPersonagem, 
    new = newfrmFichaDoPersonagem, 
    name = "frmFichaDoPersonagem", 
    dataType = "gtk.fichaDoPersonagem", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Sistema GTK - Ficha do Personagem (v0.1)", 
    description=""};

frmFichaDoPersonagem = _frmFichaDoPersonagem;
rrpg.registrarForm(_frmFichaDoPersonagem);
rrpg.registrarDataType(_frmFichaDoPersonagem);

return _frmFichaDoPersonagem;
