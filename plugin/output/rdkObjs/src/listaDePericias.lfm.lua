require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmListaDePericias()
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
    obj:setName("frmListaDePericias");
    obj:setHeight(30);
    obj:setMargins({top=2,bottom=2});

    obj.nomeCompleto = gui.fromHandle(_obj_newObject("button"));
    obj.nomeCompleto:setParent(obj);
    obj.nomeCompleto:setAlign("left");
    obj.nomeCompleto:setWidth(150);
    obj.nomeCompleto:setName("nomeCompleto");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (self)
            self.nomeCompleto.text = sheet.grupo .. " (" .. sheet.nome .. ")"
        end, obj);

    obj._e_event1 = obj.nomeCompleto:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet)
                  local ficha = ndb.getRoot(sheet).player
            
                  mesa.activeChat:rolarDados(
                    "01d20 + " .. sheet.pontos.total .. " + " .. ficha.atributos[atributos[sheet.atributoBase]].total,
                    ficha.nome .. ": " .. sheet.grupo .. " (" .. sheet.nome .. ") - " .. sheet.atributoBase
                  )
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

        if self.nomeCompleto ~= nil then self.nomeCompleto:destroy(); self.nomeCompleto = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmListaDePericias = {
    newEditor = newfrmListaDePericias, 
    new = newfrmListaDePericias, 
    name = "frmListaDePericias", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmListaDePericias = _frmListaDePericias;
rrpg.registrarForm(_frmListaDePericias);

return _frmListaDePericias;
