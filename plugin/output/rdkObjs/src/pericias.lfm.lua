require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmPericias()
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
    obj:setName("frmPericias");
    obj:setHeight(30);
    obj:setMargins({top=2,bottom=2});

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setAlign("left");
    obj.button1:setWidth(30);
    obj.button1:setMargins({right=4});
    obj.button1:setHint("Rolagem de Teste da Perícia");
    obj.button1:setName("button1");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.button1);
    obj.image1:setAlign("left");
    obj.image1:setWidth(30);
    obj.image1:setSRC("/src/assets/dice-six-faces.png");
    obj.image1:setName("image1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setAlign("left");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setWidth(100);
    obj.edit1:setMargins({left=2,right=2});
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setType("number");
    obj.edit2:setAlign("left");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setWidth(30);
    obj.edit2:setMargins({left=2,right=2});
    obj.edit2:setField("nivel");
    obj.edit2:setName("edit2");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj);
    obj.comboBox1:setAlign("left");
    obj.comboBox1:setWidth(60);
    obj.comboBox1:setMargins({left=2,right=2});
    obj.comboBox1:setField("atributoBase");
    obj.comboBox1:setItems({'INT', 'SAB', 'VON', 'CAR', 'ENE', 'COR', 'RES', 'VEL', 'AGI', 'DES', 'FOR', 'VIG'});
    obj.comboBox1:setName("comboBox1");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setAlign("left");
    obj.button2:setWidth(30);
    obj.button2:setMargins({left=2,right=2});
    obj.button2:setHint("Excluir");
    obj.button2:setName("button2");

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.button2);
    obj.image2:setAlign("left");
    obj.image2:setWidth(20);
    obj.image2:setMargins({left=4});
    obj.image2:setSRC("/src/assets/cancel.png");
    obj.image2:setName("image2");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
                  local ficha = ndb.getRoot(sheet);
            
                  mesa.chat:rolarDados(
                    "01d20 + " .. sheet.nivel .. " + " .. ficha.atributos[atributos[sheet.atributoBase]].total,
                    sheet.nome .. " - " .. sheet.atributoBase
                  )
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (self)
            ndb.deleteNode(sheet)
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmPericias = {
    newEditor = newfrmPericias, 
    new = newfrmPericias, 
    name = "frmPericias", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmPericias = _frmPericias;
rrpg.registrarForm(_frmPericias);

return _frmPericias;
