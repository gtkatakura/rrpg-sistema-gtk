require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmGerenciadorRacasClasses()
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
    obj:setDataType("gtk.gerenciadorRacasClasses");
    obj:setTitle("Gerenciador de Raças - GTK (v0.5.8)");
    obj:setName("frmGerenciadorRacasClasses");

    obj.tabControl1 = gui.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Raças");
    obj.tab1:setName("tab1");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.tab1);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.flowLayout1 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.scrollBox1);
    obj.flowLayout1:setLeft(10);
    obj.flowLayout1:setTop(10);
    obj.flowLayout1:setWidth(170);
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setName("flowLayout1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.flowLayout1);
    obj.button1:setWidth(50);
    obj.button1:setText("Nova");
    obj.button1:setName("button1");

    obj.rclRacas = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclRacas:setParent(obj.flowLayout1);
    obj.rclRacas:setName("rclRacas");
    obj.rclRacas:setField("racas");
    obj.rclRacas:setMargins({top=10});
    obj.rclRacas:setTemplateForm("frmRaca");
    obj.rclRacas:setWidth(530);
    obj.rclRacas:setAutoHeight(true);

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            self.rclRacas:append()
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

        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.rclRacas ~= nil then self.rclRacas:destroy(); self.rclRacas = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmGerenciadorRacasClasses = {
    newEditor = newfrmGerenciadorRacasClasses, 
    new = newfrmGerenciadorRacasClasses, 
    name = "frmGerenciadorRacasClasses", 
    dataType = "gtk.gerenciadorRacasClasses", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Gerenciador de Raças - GTK (v0.5.8)", 
    description=""};

frmGerenciadorRacasClasses = _frmGerenciadorRacasClasses;
rrpg.registrarForm(_frmGerenciadorRacasClasses);
rrpg.registrarDataType(_frmGerenciadorRacasClasses);

return _frmGerenciadorRacasClasses;
