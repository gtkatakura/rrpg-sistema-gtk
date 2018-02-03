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
    obj:setTitle("Sistema GTK - Ficha do Personagem (v0.2)");
    obj:setName("frmFichaDoPersonagem");

    obj.tabControl1 = gui.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Informações");
    obj.tab1:setName("tab1");

    obj.richEdit1 = gui.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.tab1);
    obj.richEdit1:setAlign("client");
    obj.richEdit1:setField("informacoes");
    obj.richEdit1:setName("richEdit1");

    obj.tab2 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Atributos");
    obj.tab2:setName("tab2");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.tab2);
    obj.layout1:setTop(40);
    obj.layout1:setHeight(25);
    obj.layout1:setWidth(450);
    obj.layout1:setMargins({left=4,right=4});
    obj.layout1:setName("layout1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setAlign("left");
    obj.button1:setWidth(30);
    obj.button1:setMargins({right=4});
    obj.button1:setHint("Rolagem de Teste de Atributo");
    obj.button1:setName("button1");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.button1);
    obj.image1:setAlign("left");
    obj.image1:setWidth(30);
    obj.image1:setSRC("/src/assets/dice-six-faces.png");
    obj.image1:setName("image1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setAlign("left");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setText("Inteligência");
    obj.label1:setWidth(80);
    obj.label1:setAutoSize(true);
    obj.label1:setName("label1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setType("number");
    obj.edit1:setAlign("left");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setWidth(30);
    obj.edit1:setMargins({left=2, right=2});
    obj.edit1:setField("atributos.inteligencia.base");
    obj.edit1:setName("edit1");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout1);
    obj.dataLink1:setField("atributos.inteligencia.base");
    obj.dataLink1:setName("dataLink1");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout1);
    obj.edit2:setType("number");
    obj.edit2:setAlign("left");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setWidth(30);
    obj.edit2:setMargins({left=2, right=2});
    obj.edit2:setField("atributos.inteligencia.racaClasse");
    obj.edit2:setName("edit2");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout1);
    obj.dataLink2:setField("atributos.inteligencia.racaClasse");
    obj.dataLink2:setName("dataLink2");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout1);
    obj.edit3:setType("number");
    obj.edit3:setAlign("left");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setWidth(30);
    obj.edit3:setMargins({left=2, right=2});
    obj.edit3:setField("atributos.inteligencia.treinamento");
    obj.edit3:setName("edit3");

    obj.dataLink3 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout1);
    obj.dataLink3:setField("atributos.inteligencia.treinamento");
    obj.dataLink3:setName("dataLink3");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout1);
    obj.edit4:setType("number");
    obj.edit4:setAlign("left");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setWidth(30);
    obj.edit4:setMargins({left=2, right=2});
    obj.edit4:setField("atributos.inteligencia.habilidade");
    obj.edit4:setName("edit4");

    obj.dataLink4 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout1);
    obj.dataLink4:setField("atributos.inteligencia.habilidade");
    obj.dataLink4:setName("dataLink4");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setAlign("left");
    obj.label2:setText("=");
    obj.label2:setWidth(10);
    obj.label2:setMargins({left=4,right=4});
    obj.label2:setName("label2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout1);
    obj.label3:setAlign("left");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setWidth(30);
    obj.label3:setField("atributos.inteligencia.total");
    obj.label3:setName("label3");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.tab2);
    obj.layout2:setTop(70);
    obj.layout2:setHeight(25);
    obj.layout2:setWidth(450);
    obj.layout2:setMargins({left=4,right=4});
    obj.layout2:setName("layout2");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout2);
    obj.button2:setAlign("left");
    obj.button2:setWidth(30);
    obj.button2:setMargins({right=4});
    obj.button2:setHint("Rolagem de Teste de Atributo");
    obj.button2:setName("button2");

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.button2);
    obj.image2:setAlign("left");
    obj.image2:setWidth(30);
    obj.image2:setSRC("/src/assets/dice-six-faces.png");
    obj.image2:setName("image2");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout2);
    obj.label4:setAlign("left");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setText("Sabedoria");
    obj.label4:setWidth(80);
    obj.label4:setAutoSize(true);
    obj.label4:setName("label4");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout2);
    obj.edit5:setType("number");
    obj.edit5:setAlign("left");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setWidth(30);
    obj.edit5:setMargins({left=2, right=2});
    obj.edit5:setField("atributos.sabedoria.base");
    obj.edit5:setName("edit5");

    obj.dataLink5 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout2);
    obj.dataLink5:setField("atributos.sabedoria.base");
    obj.dataLink5:setName("dataLink5");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout2);
    obj.edit6:setType("number");
    obj.edit6:setAlign("left");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setWidth(30);
    obj.edit6:setMargins({left=2, right=2});
    obj.edit6:setField("atributos.sabedoria.racaClasse");
    obj.edit6:setName("edit6");

    obj.dataLink6 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout2);
    obj.dataLink6:setField("atributos.sabedoria.racaClasse");
    obj.dataLink6:setName("dataLink6");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout2);
    obj.edit7:setType("number");
    obj.edit7:setAlign("left");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setWidth(30);
    obj.edit7:setMargins({left=2, right=2});
    obj.edit7:setField("atributos.sabedoria.treinamento");
    obj.edit7:setName("edit7");

    obj.dataLink7 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout2);
    obj.dataLink7:setField("atributos.sabedoria.treinamento");
    obj.dataLink7:setName("dataLink7");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout2);
    obj.edit8:setType("number");
    obj.edit8:setAlign("left");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setWidth(30);
    obj.edit8:setMargins({left=2, right=2});
    obj.edit8:setField("atributos.sabedoria.habilidade");
    obj.edit8:setName("edit8");

    obj.dataLink8 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout2);
    obj.dataLink8:setField("atributos.sabedoria.habilidade");
    obj.dataLink8:setName("dataLink8");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout2);
    obj.label5:setAlign("left");
    obj.label5:setText("=");
    obj.label5:setWidth(10);
    obj.label5:setMargins({left=4,right=4});
    obj.label5:setName("label5");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout2);
    obj.label6:setAlign("left");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setWidth(30);
    obj.label6:setField("atributos.sabedoria.total");
    obj.label6:setName("label6");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.tab2);
    obj.layout3:setTop(100);
    obj.layout3:setHeight(25);
    obj.layout3:setWidth(450);
    obj.layout3:setMargins({left=4,right=4});
    obj.layout3:setName("layout3");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout3);
    obj.button3:setAlign("left");
    obj.button3:setWidth(30);
    obj.button3:setMargins({right=4});
    obj.button3:setHint("Rolagem de Teste de Atributo");
    obj.button3:setName("button3");

    obj.image3 = gui.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.button3);
    obj.image3:setAlign("left");
    obj.image3:setWidth(30);
    obj.image3:setSRC("/src/assets/dice-six-faces.png");
    obj.image3:setName("image3");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout3);
    obj.label7:setAlign("left");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setText("Vontade");
    obj.label7:setWidth(80);
    obj.label7:setAutoSize(true);
    obj.label7:setName("label7");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout3);
    obj.edit9:setType("number");
    obj.edit9:setAlign("left");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setWidth(30);
    obj.edit9:setMargins({left=2, right=2});
    obj.edit9:setField("atributos.vontade.base");
    obj.edit9:setName("edit9");

    obj.dataLink9 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout3);
    obj.dataLink9:setField("atributos.vontade.base");
    obj.dataLink9:setName("dataLink9");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout3);
    obj.edit10:setType("number");
    obj.edit10:setAlign("left");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setWidth(30);
    obj.edit10:setMargins({left=2, right=2});
    obj.edit10:setField("atributos.vontade.racaClasse");
    obj.edit10:setName("edit10");

    obj.dataLink10 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout3);
    obj.dataLink10:setField("atributos.vontade.racaClasse");
    obj.dataLink10:setName("dataLink10");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout3);
    obj.edit11:setType("number");
    obj.edit11:setAlign("left");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setWidth(30);
    obj.edit11:setMargins({left=2, right=2});
    obj.edit11:setField("atributos.vontade.treinamento");
    obj.edit11:setName("edit11");

    obj.dataLink11 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout3);
    obj.dataLink11:setField("atributos.vontade.treinamento");
    obj.dataLink11:setName("dataLink11");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout3);
    obj.edit12:setType("number");
    obj.edit12:setAlign("left");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setWidth(30);
    obj.edit12:setMargins({left=2, right=2});
    obj.edit12:setField("atributos.vontade.habilidade");
    obj.edit12:setName("edit12");

    obj.dataLink12 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout3);
    obj.dataLink12:setField("atributos.vontade.habilidade");
    obj.dataLink12:setName("dataLink12");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout3);
    obj.label8:setAlign("left");
    obj.label8:setText("=");
    obj.label8:setWidth(10);
    obj.label8:setMargins({left=4,right=4});
    obj.label8:setName("label8");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout3);
    obj.label9:setAlign("left");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setWidth(30);
    obj.label9:setField("atributos.vontade.total");
    obj.label9:setName("label9");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.tab2);
    obj.layout4:setTop(130);
    obj.layout4:setHeight(25);
    obj.layout4:setWidth(450);
    obj.layout4:setMargins({left=4,right=4});
    obj.layout4:setName("layout4");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout4);
    obj.button4:setAlign("left");
    obj.button4:setWidth(30);
    obj.button4:setMargins({right=4});
    obj.button4:setHint("Rolagem de Teste de Atributo");
    obj.button4:setName("button4");

    obj.image4 = gui.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.button4);
    obj.image4:setAlign("left");
    obj.image4:setWidth(30);
    obj.image4:setSRC("/src/assets/dice-six-faces.png");
    obj.image4:setName("image4");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout4);
    obj.label10:setAlign("left");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setText("Carisma");
    obj.label10:setWidth(80);
    obj.label10:setAutoSize(true);
    obj.label10:setName("label10");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout4);
    obj.edit13:setType("number");
    obj.edit13:setAlign("left");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setWidth(30);
    obj.edit13:setMargins({left=2, right=2});
    obj.edit13:setField("atributos.carisma.base");
    obj.edit13:setName("edit13");

    obj.dataLink13 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout4);
    obj.dataLink13:setField("atributos.carisma.base");
    obj.dataLink13:setName("dataLink13");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout4);
    obj.edit14:setType("number");
    obj.edit14:setAlign("left");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setWidth(30);
    obj.edit14:setMargins({left=2, right=2});
    obj.edit14:setField("atributos.carisma.racaClasse");
    obj.edit14:setName("edit14");

    obj.dataLink14 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout4);
    obj.dataLink14:setField("atributos.carisma.racaClasse");
    obj.dataLink14:setName("dataLink14");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout4);
    obj.edit15:setType("number");
    obj.edit15:setAlign("left");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setWidth(30);
    obj.edit15:setMargins({left=2, right=2});
    obj.edit15:setField("atributos.carisma.treinamento");
    obj.edit15:setName("edit15");

    obj.dataLink15 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout4);
    obj.dataLink15:setField("atributos.carisma.treinamento");
    obj.dataLink15:setName("dataLink15");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout4);
    obj.edit16:setType("number");
    obj.edit16:setAlign("left");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setWidth(30);
    obj.edit16:setMargins({left=2, right=2});
    obj.edit16:setField("atributos.carisma.habilidade");
    obj.edit16:setName("edit16");

    obj.dataLink16 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout4);
    obj.dataLink16:setField("atributos.carisma.habilidade");
    obj.dataLink16:setName("dataLink16");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout4);
    obj.label11:setAlign("left");
    obj.label11:setText("=");
    obj.label11:setWidth(10);
    obj.label11:setMargins({left=4,right=4});
    obj.label11:setName("label11");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout4);
    obj.label12:setAlign("left");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setWidth(30);
    obj.label12:setField("atributos.carisma.total");
    obj.label12:setName("label12");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.tab2);
    obj.layout5:setTop(160);
    obj.layout5:setHeight(25);
    obj.layout5:setWidth(450);
    obj.layout5:setMargins({left=4,right=4});
    obj.layout5:setName("layout5");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout5);
    obj.button5:setAlign("left");
    obj.button5:setWidth(30);
    obj.button5:setMargins({right=4});
    obj.button5:setHint("Rolagem de Teste de Atributo");
    obj.button5:setName("button5");

    obj.image5 = gui.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.button5);
    obj.image5:setAlign("left");
    obj.image5:setWidth(30);
    obj.image5:setSRC("/src/assets/dice-six-faces.png");
    obj.image5:setName("image5");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout5);
    obj.label13:setAlign("left");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setText("Energia");
    obj.label13:setWidth(80);
    obj.label13:setAutoSize(true);
    obj.label13:setName("label13");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout5);
    obj.edit17:setType("number");
    obj.edit17:setAlign("left");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setWidth(30);
    obj.edit17:setMargins({left=2, right=2});
    obj.edit17:setField("atributos.energia.base");
    obj.edit17:setName("edit17");

    obj.dataLink17 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout5);
    obj.dataLink17:setField("atributos.energia.base");
    obj.dataLink17:setName("dataLink17");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout5);
    obj.edit18:setType("number");
    obj.edit18:setAlign("left");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setWidth(30);
    obj.edit18:setMargins({left=2, right=2});
    obj.edit18:setField("atributos.energia.racaClasse");
    obj.edit18:setName("edit18");

    obj.dataLink18 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout5);
    obj.dataLink18:setField("atributos.energia.racaClasse");
    obj.dataLink18:setName("dataLink18");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout5);
    obj.edit19:setType("number");
    obj.edit19:setAlign("left");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setWidth(30);
    obj.edit19:setMargins({left=2, right=2});
    obj.edit19:setField("atributos.energia.treinamento");
    obj.edit19:setName("edit19");

    obj.dataLink19 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout5);
    obj.dataLink19:setField("atributos.energia.treinamento");
    obj.dataLink19:setName("dataLink19");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout5);
    obj.edit20:setType("number");
    obj.edit20:setAlign("left");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setWidth(30);
    obj.edit20:setMargins({left=2, right=2});
    obj.edit20:setField("atributos.energia.habilidade");
    obj.edit20:setName("edit20");

    obj.dataLink20 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout5);
    obj.dataLink20:setField("atributos.energia.habilidade");
    obj.dataLink20:setName("dataLink20");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout5);
    obj.label14:setAlign("left");
    obj.label14:setText("=");
    obj.label14:setWidth(10);
    obj.label14:setMargins({left=4,right=4});
    obj.label14:setName("label14");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout5);
    obj.label15:setAlign("left");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setWidth(30);
    obj.label15:setField("atributos.energia.total");
    obj.label15:setName("label15");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.tab2);
    obj.layout6:setTop(190);
    obj.layout6:setHeight(25);
    obj.layout6:setWidth(450);
    obj.layout6:setMargins({left=4,right=4});
    obj.layout6:setName("layout6");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout6);
    obj.button6:setAlign("left");
    obj.button6:setWidth(30);
    obj.button6:setMargins({right=4});
    obj.button6:setHint("Rolagem de Teste de Atributo");
    obj.button6:setName("button6");

    obj.image6 = gui.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.button6);
    obj.image6:setAlign("left");
    obj.image6:setWidth(30);
    obj.image6:setSRC("/src/assets/dice-six-faces.png");
    obj.image6:setName("image6");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout6);
    obj.label16:setAlign("left");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setText("Corpo");
    obj.label16:setWidth(80);
    obj.label16:setAutoSize(true);
    obj.label16:setName("label16");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout6);
    obj.edit21:setType("number");
    obj.edit21:setAlign("left");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setWidth(30);
    obj.edit21:setMargins({left=2, right=2});
    obj.edit21:setField("atributos.corpo.base");
    obj.edit21:setName("edit21");

    obj.dataLink21 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout6);
    obj.dataLink21:setField("atributos.corpo.base");
    obj.dataLink21:setName("dataLink21");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout6);
    obj.edit22:setType("number");
    obj.edit22:setAlign("left");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setWidth(30);
    obj.edit22:setMargins({left=2, right=2});
    obj.edit22:setField("atributos.corpo.racaClasse");
    obj.edit22:setName("edit22");

    obj.dataLink22 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout6);
    obj.dataLink22:setField("atributos.corpo.racaClasse");
    obj.dataLink22:setName("dataLink22");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout6);
    obj.edit23:setType("number");
    obj.edit23:setAlign("left");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setWidth(30);
    obj.edit23:setMargins({left=2, right=2});
    obj.edit23:setField("atributos.corpo.treinamento");
    obj.edit23:setName("edit23");

    obj.dataLink23 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout6);
    obj.dataLink23:setField("atributos.corpo.treinamento");
    obj.dataLink23:setName("dataLink23");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout6);
    obj.edit24:setType("number");
    obj.edit24:setAlign("left");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setWidth(30);
    obj.edit24:setMargins({left=2, right=2});
    obj.edit24:setField("atributos.corpo.habilidade");
    obj.edit24:setName("edit24");

    obj.dataLink24 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout6);
    obj.dataLink24:setField("atributos.corpo.habilidade");
    obj.dataLink24:setName("dataLink24");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout6);
    obj.label17:setAlign("left");
    obj.label17:setText("=");
    obj.label17:setWidth(10);
    obj.label17:setMargins({left=4,right=4});
    obj.label17:setName("label17");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout6);
    obj.label18:setAlign("left");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setWidth(30);
    obj.label18:setField("atributos.corpo.total");
    obj.label18:setName("label18");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.tab2);
    obj.layout7:setLeft(320);
    obj.layout7:setWidth(300);
    obj.layout7:setHeight(400);
    obj.layout7:setName("layout7");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout7);
    obj.layout8:setTop(40);
    obj.layout8:setHeight(25);
    obj.layout8:setWidth(450);
    obj.layout8:setMargins({left=4,right=4});
    obj.layout8:setName("layout8");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout8);
    obj.button7:setAlign("left");
    obj.button7:setWidth(30);
    obj.button7:setMargins({right=4});
    obj.button7:setHint("Rolagem de Teste de Atributo");
    obj.button7:setName("button7");

    obj.image7 = gui.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.button7);
    obj.image7:setAlign("left");
    obj.image7:setWidth(30);
    obj.image7:setSRC("/src/assets/dice-six-faces.png");
    obj.image7:setName("image7");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout8);
    obj.label19:setAlign("left");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setText("Resistência");
    obj.label19:setWidth(80);
    obj.label19:setAutoSize(true);
    obj.label19:setName("label19");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout8);
    obj.edit25:setType("number");
    obj.edit25:setAlign("left");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setWidth(30);
    obj.edit25:setMargins({left=2, right=2});
    obj.edit25:setField("atributos.resistencia.base");
    obj.edit25:setName("edit25");

    obj.dataLink25 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout8);
    obj.dataLink25:setField("atributos.resistencia.base");
    obj.dataLink25:setName("dataLink25");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout8);
    obj.edit26:setType("number");
    obj.edit26:setAlign("left");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setWidth(30);
    obj.edit26:setMargins({left=2, right=2});
    obj.edit26:setField("atributos.resistencia.racaClasse");
    obj.edit26:setName("edit26");

    obj.dataLink26 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout8);
    obj.dataLink26:setField("atributos.resistencia.racaClasse");
    obj.dataLink26:setName("dataLink26");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout8);
    obj.edit27:setType("number");
    obj.edit27:setAlign("left");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setWidth(30);
    obj.edit27:setMargins({left=2, right=2});
    obj.edit27:setField("atributos.resistencia.treinamento");
    obj.edit27:setName("edit27");

    obj.dataLink27 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.layout8);
    obj.dataLink27:setField("atributos.resistencia.treinamento");
    obj.dataLink27:setName("dataLink27");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout8);
    obj.edit28:setType("number");
    obj.edit28:setAlign("left");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setWidth(30);
    obj.edit28:setMargins({left=2, right=2});
    obj.edit28:setField("atributos.resistencia.habilidade");
    obj.edit28:setName("edit28");

    obj.dataLink28 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.layout8);
    obj.dataLink28:setField("atributos.resistencia.habilidade");
    obj.dataLink28:setName("dataLink28");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout8);
    obj.label20:setAlign("left");
    obj.label20:setText("=");
    obj.label20:setWidth(10);
    obj.label20:setMargins({left=4,right=4});
    obj.label20:setName("label20");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout8);
    obj.label21:setAlign("left");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setWidth(30);
    obj.label21:setField("atributos.resistencia.total");
    obj.label21:setName("label21");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout7);
    obj.layout9:setTop(70);
    obj.layout9:setHeight(25);
    obj.layout9:setWidth(450);
    obj.layout9:setMargins({left=4,right=4});
    obj.layout9:setName("layout9");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout9);
    obj.button8:setAlign("left");
    obj.button8:setWidth(30);
    obj.button8:setMargins({right=4});
    obj.button8:setHint("Rolagem de Teste de Atributo");
    obj.button8:setName("button8");

    obj.image8 = gui.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.button8);
    obj.image8:setAlign("left");
    obj.image8:setWidth(30);
    obj.image8:setSRC("/src/assets/dice-six-faces.png");
    obj.image8:setName("image8");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout9);
    obj.label22:setAlign("left");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setText("Velocidade");
    obj.label22:setWidth(80);
    obj.label22:setAutoSize(true);
    obj.label22:setName("label22");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout9);
    obj.edit29:setType("number");
    obj.edit29:setAlign("left");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setWidth(30);
    obj.edit29:setMargins({left=2, right=2});
    obj.edit29:setField("atributos.velocidade.base");
    obj.edit29:setName("edit29");

    obj.dataLink29 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.layout9);
    obj.dataLink29:setField("atributos.velocidade.base");
    obj.dataLink29:setName("dataLink29");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout9);
    obj.edit30:setType("number");
    obj.edit30:setAlign("left");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setWidth(30);
    obj.edit30:setMargins({left=2, right=2});
    obj.edit30:setField("atributos.velocidade.racaClasse");
    obj.edit30:setName("edit30");

    obj.dataLink30 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.layout9);
    obj.dataLink30:setField("atributos.velocidade.racaClasse");
    obj.dataLink30:setName("dataLink30");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout9);
    obj.edit31:setType("number");
    obj.edit31:setAlign("left");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setWidth(30);
    obj.edit31:setMargins({left=2, right=2});
    obj.edit31:setField("atributos.velocidade.treinamento");
    obj.edit31:setName("edit31");

    obj.dataLink31 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.layout9);
    obj.dataLink31:setField("atributos.velocidade.treinamento");
    obj.dataLink31:setName("dataLink31");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout9);
    obj.edit32:setType("number");
    obj.edit32:setAlign("left");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setWidth(30);
    obj.edit32:setMargins({left=2, right=2});
    obj.edit32:setField("atributos.velocidade.habilidade");
    obj.edit32:setName("edit32");

    obj.dataLink32 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.layout9);
    obj.dataLink32:setField("atributos.velocidade.habilidade");
    obj.dataLink32:setName("dataLink32");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout9);
    obj.label23:setAlign("left");
    obj.label23:setText("=");
    obj.label23:setWidth(10);
    obj.label23:setMargins({left=4,right=4});
    obj.label23:setName("label23");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout9);
    obj.label24:setAlign("left");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setWidth(30);
    obj.label24:setField("atributos.velocidade.total");
    obj.label24:setName("label24");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout7);
    obj.layout10:setTop(100);
    obj.layout10:setHeight(25);
    obj.layout10:setWidth(450);
    obj.layout10:setMargins({left=4,right=4});
    obj.layout10:setName("layout10");

    obj.button9 = gui.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout10);
    obj.button9:setAlign("left");
    obj.button9:setWidth(30);
    obj.button9:setMargins({right=4});
    obj.button9:setHint("Rolagem de Teste de Atributo");
    obj.button9:setName("button9");

    obj.image9 = gui.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.button9);
    obj.image9:setAlign("left");
    obj.image9:setWidth(30);
    obj.image9:setSRC("/src/assets/dice-six-faces.png");
    obj.image9:setName("image9");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout10);
    obj.label25:setAlign("left");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setText("Agilidade");
    obj.label25:setWidth(80);
    obj.label25:setAutoSize(true);
    obj.label25:setName("label25");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout10);
    obj.edit33:setType("number");
    obj.edit33:setAlign("left");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setWidth(30);
    obj.edit33:setMargins({left=2, right=2});
    obj.edit33:setField("atributos.agilidade.base");
    obj.edit33:setName("edit33");

    obj.dataLink33 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.layout10);
    obj.dataLink33:setField("atributos.agilidade.base");
    obj.dataLink33:setName("dataLink33");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout10);
    obj.edit34:setType("number");
    obj.edit34:setAlign("left");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setWidth(30);
    obj.edit34:setMargins({left=2, right=2});
    obj.edit34:setField("atributos.agilidade.racaClasse");
    obj.edit34:setName("edit34");

    obj.dataLink34 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.layout10);
    obj.dataLink34:setField("atributos.agilidade.racaClasse");
    obj.dataLink34:setName("dataLink34");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout10);
    obj.edit35:setType("number");
    obj.edit35:setAlign("left");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setWidth(30);
    obj.edit35:setMargins({left=2, right=2});
    obj.edit35:setField("atributos.agilidade.treinamento");
    obj.edit35:setName("edit35");

    obj.dataLink35 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.layout10);
    obj.dataLink35:setField("atributos.agilidade.treinamento");
    obj.dataLink35:setName("dataLink35");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout10);
    obj.edit36:setType("number");
    obj.edit36:setAlign("left");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setWidth(30);
    obj.edit36:setMargins({left=2, right=2});
    obj.edit36:setField("atributos.agilidade.habilidade");
    obj.edit36:setName("edit36");

    obj.dataLink36 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.layout10);
    obj.dataLink36:setField("atributos.agilidade.habilidade");
    obj.dataLink36:setName("dataLink36");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout10);
    obj.label26:setAlign("left");
    obj.label26:setText("=");
    obj.label26:setWidth(10);
    obj.label26:setMargins({left=4,right=4});
    obj.label26:setName("label26");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout10);
    obj.label27:setAlign("left");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setWidth(30);
    obj.label27:setField("atributos.agilidade.total");
    obj.label27:setName("label27");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout7);
    obj.layout11:setTop(130);
    obj.layout11:setHeight(25);
    obj.layout11:setWidth(450);
    obj.layout11:setMargins({left=4,right=4});
    obj.layout11:setName("layout11");

    obj.button10 = gui.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout11);
    obj.button10:setAlign("left");
    obj.button10:setWidth(30);
    obj.button10:setMargins({right=4});
    obj.button10:setHint("Rolagem de Teste de Atributo");
    obj.button10:setName("button10");

    obj.image10 = gui.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.button10);
    obj.image10:setAlign("left");
    obj.image10:setWidth(30);
    obj.image10:setSRC("/src/assets/dice-six-faces.png");
    obj.image10:setName("image10");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout11);
    obj.label28:setAlign("left");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setText("Destreza");
    obj.label28:setWidth(80);
    obj.label28:setAutoSize(true);
    obj.label28:setName("label28");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout11);
    obj.edit37:setType("number");
    obj.edit37:setAlign("left");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setWidth(30);
    obj.edit37:setMargins({left=2, right=2});
    obj.edit37:setField("atributos.destreza.base");
    obj.edit37:setName("edit37");

    obj.dataLink37 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.layout11);
    obj.dataLink37:setField("atributos.destreza.base");
    obj.dataLink37:setName("dataLink37");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout11);
    obj.edit38:setType("number");
    obj.edit38:setAlign("left");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setWidth(30);
    obj.edit38:setMargins({left=2, right=2});
    obj.edit38:setField("atributos.destreza.racaClasse");
    obj.edit38:setName("edit38");

    obj.dataLink38 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.layout11);
    obj.dataLink38:setField("atributos.destreza.racaClasse");
    obj.dataLink38:setName("dataLink38");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout11);
    obj.edit39:setType("number");
    obj.edit39:setAlign("left");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setWidth(30);
    obj.edit39:setMargins({left=2, right=2});
    obj.edit39:setField("atributos.destreza.treinamento");
    obj.edit39:setName("edit39");

    obj.dataLink39 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.layout11);
    obj.dataLink39:setField("atributos.destreza.treinamento");
    obj.dataLink39:setName("dataLink39");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout11);
    obj.edit40:setType("number");
    obj.edit40:setAlign("left");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setWidth(30);
    obj.edit40:setMargins({left=2, right=2});
    obj.edit40:setField("atributos.destreza.habilidade");
    obj.edit40:setName("edit40");

    obj.dataLink40 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.layout11);
    obj.dataLink40:setField("atributos.destreza.habilidade");
    obj.dataLink40:setName("dataLink40");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout11);
    obj.label29:setAlign("left");
    obj.label29:setText("=");
    obj.label29:setWidth(10);
    obj.label29:setMargins({left=4,right=4});
    obj.label29:setName("label29");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout11);
    obj.label30:setAlign("left");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setWidth(30);
    obj.label30:setField("atributos.destreza.total");
    obj.label30:setName("label30");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout7);
    obj.layout12:setTop(160);
    obj.layout12:setHeight(25);
    obj.layout12:setWidth(450);
    obj.layout12:setMargins({left=4,right=4});
    obj.layout12:setName("layout12");

    obj.button11 = gui.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout12);
    obj.button11:setAlign("left");
    obj.button11:setWidth(30);
    obj.button11:setMargins({right=4});
    obj.button11:setHint("Rolagem de Teste de Atributo");
    obj.button11:setName("button11");

    obj.image11 = gui.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.button11);
    obj.image11:setAlign("left");
    obj.image11:setWidth(30);
    obj.image11:setSRC("/src/assets/dice-six-faces.png");
    obj.image11:setName("image11");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout12);
    obj.label31:setAlign("left");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setText("Força");
    obj.label31:setWidth(80);
    obj.label31:setAutoSize(true);
    obj.label31:setName("label31");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout12);
    obj.edit41:setType("number");
    obj.edit41:setAlign("left");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setWidth(30);
    obj.edit41:setMargins({left=2, right=2});
    obj.edit41:setField("atributos.forca.base");
    obj.edit41:setName("edit41");

    obj.dataLink41 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.layout12);
    obj.dataLink41:setField("atributos.forca.base");
    obj.dataLink41:setName("dataLink41");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout12);
    obj.edit42:setType("number");
    obj.edit42:setAlign("left");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setWidth(30);
    obj.edit42:setMargins({left=2, right=2});
    obj.edit42:setField("atributos.forca.racaClasse");
    obj.edit42:setName("edit42");

    obj.dataLink42 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.layout12);
    obj.dataLink42:setField("atributos.forca.racaClasse");
    obj.dataLink42:setName("dataLink42");

    obj.edit43 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout12);
    obj.edit43:setType("number");
    obj.edit43:setAlign("left");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setWidth(30);
    obj.edit43:setMargins({left=2, right=2});
    obj.edit43:setField("atributos.forca.treinamento");
    obj.edit43:setName("edit43");

    obj.dataLink43 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj.layout12);
    obj.dataLink43:setField("atributos.forca.treinamento");
    obj.dataLink43:setName("dataLink43");

    obj.edit44 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout12);
    obj.edit44:setType("number");
    obj.edit44:setAlign("left");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setWidth(30);
    obj.edit44:setMargins({left=2, right=2});
    obj.edit44:setField("atributos.forca.habilidade");
    obj.edit44:setName("edit44");

    obj.dataLink44 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj.layout12);
    obj.dataLink44:setField("atributos.forca.habilidade");
    obj.dataLink44:setName("dataLink44");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout12);
    obj.label32:setAlign("left");
    obj.label32:setText("=");
    obj.label32:setWidth(10);
    obj.label32:setMargins({left=4,right=4});
    obj.label32:setName("label32");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout12);
    obj.label33:setAlign("left");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setWidth(30);
    obj.label33:setField("atributos.forca.total");
    obj.label33:setName("label33");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout7);
    obj.layout13:setTop(190);
    obj.layout13:setHeight(25);
    obj.layout13:setWidth(450);
    obj.layout13:setMargins({left=4,right=4});
    obj.layout13:setName("layout13");

    obj.button12 = gui.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout13);
    obj.button12:setAlign("left");
    obj.button12:setWidth(30);
    obj.button12:setMargins({right=4});
    obj.button12:setHint("Rolagem de Teste de Atributo");
    obj.button12:setName("button12");

    obj.image12 = gui.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.button12);
    obj.image12:setAlign("left");
    obj.image12:setWidth(30);
    obj.image12:setSRC("/src/assets/dice-six-faces.png");
    obj.image12:setName("image12");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout13);
    obj.label34:setAlign("left");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setText("Vigor");
    obj.label34:setWidth(80);
    obj.label34:setAutoSize(true);
    obj.label34:setName("label34");

    obj.edit45 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout13);
    obj.edit45:setType("number");
    obj.edit45:setAlign("left");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setWidth(30);
    obj.edit45:setMargins({left=2, right=2});
    obj.edit45:setField("atributos.vigor.base");
    obj.edit45:setName("edit45");

    obj.dataLink45 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj.layout13);
    obj.dataLink45:setField("atributos.vigor.base");
    obj.dataLink45:setName("dataLink45");

    obj.edit46 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout13);
    obj.edit46:setType("number");
    obj.edit46:setAlign("left");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setWidth(30);
    obj.edit46:setMargins({left=2, right=2});
    obj.edit46:setField("atributos.vigor.racaClasse");
    obj.edit46:setName("edit46");

    obj.dataLink46 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink46:setParent(obj.layout13);
    obj.dataLink46:setField("atributos.vigor.racaClasse");
    obj.dataLink46:setName("dataLink46");

    obj.edit47 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout13);
    obj.edit47:setType("number");
    obj.edit47:setAlign("left");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setWidth(30);
    obj.edit47:setMargins({left=2, right=2});
    obj.edit47:setField("atributos.vigor.treinamento");
    obj.edit47:setName("edit47");

    obj.dataLink47 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink47:setParent(obj.layout13);
    obj.dataLink47:setField("atributos.vigor.treinamento");
    obj.dataLink47:setName("dataLink47");

    obj.edit48 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout13);
    obj.edit48:setType("number");
    obj.edit48:setAlign("left");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setWidth(30);
    obj.edit48:setMargins({left=2, right=2});
    obj.edit48:setField("atributos.vigor.habilidade");
    obj.edit48:setName("edit48");

    obj.dataLink48 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink48:setParent(obj.layout13);
    obj.dataLink48:setField("atributos.vigor.habilidade");
    obj.dataLink48:setName("dataLink48");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout13);
    obj.label35:setAlign("left");
    obj.label35:setText("=");
    obj.label35:setWidth(10);
    obj.label35:setMargins({left=4,right=4});
    obj.label35:setName("label35");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout13);
    obj.label36:setAlign("left");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setWidth(30);
    obj.label36:setField("atributos.vigor.total");
    obj.label36:setName("label36");

    obj.tab3 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Sentidos");
    obj.tab3:setName("tab3");

    obj.richEdit2 = gui.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit2:setParent(obj.tab3);
    obj.richEdit2:setAlign("client");
    obj.richEdit2:setField("sentidos");
    obj.richEdit2:setName("richEdit2");

    obj.tab4 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Perícias");
    obj.tab4:setName("tab4");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.tab4);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.button13 = gui.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.scrollBox1);
    obj.button13:setLeft(20);
    obj.button13:setTop(20);
    obj.button13:setHeight(25);
    obj.button13:setText("Nova Perícia");
    obj.button13:setWidth(100);
    obj.button13:setName("button13");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.scrollBox1);
    obj.layout14:setLeft(55);
    obj.layout14:setTop(45);
    obj.layout14:setWidth(350);
    obj.layout14:setMargins({top=5,bottom=15});
    obj.layout14:setName("layout14");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout14);
    obj.label37:setAlign("left");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setWidth(100);
    obj.label37:setMargins({left=2,right=2});
    obj.label37:setText("GRUPO");
    obj.label37:setName("label37");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout14);
    obj.label38:setAlign("left");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setWidth(100);
    obj.label38:setMargins({left=2,right=2});
    obj.label38:setText("NOME");
    obj.label38:setName("label38");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout14);
    obj.label39:setAlign("left");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setWidth(30);
    obj.label39:setMargins({left=2,right=2});
    obj.label39:setText("B");
    obj.label39:setName("label39");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout14);
    obj.label40:setAlign("left");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setWidth(30);
    obj.label40:setMargins({left=2,right=2});
    obj.label40:setText("R/C");
    obj.label40:setName("label40");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout14);
    obj.label41:setAlign("left");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setWidth(30);
    obj.label41:setMargins({left=2,right=2});
    obj.label41:setText("H");
    obj.label41:setName("label41");

    obj.pericias = gui.fromHandle(_obj_newObject("recordList"));
    obj.pericias:setParent(obj.scrollBox1);
    obj.pericias:setName("pericias");
    obj.pericias:setField("pericias");
    obj.pericias:setTemplateForm("frmPericias");
    obj.pericias:setLeft(20);
    obj.pericias:setTop(80);
    obj.pericias:setWidth(530);
    obj.pericias:setAutoHeight(true);

    obj.tab5 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Habilidades");
    obj.tab5:setName("tab5");

    obj.richEdit3 = gui.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit3:setParent(obj.tab5);
    obj.richEdit3:setAlign("client");
    obj.richEdit3:setField("habilidades");
    obj.richEdit3:setName("richEdit3");

    obj.tab6 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Acessórios");
    obj.tab6:setName("tab6");

    obj.richEdit4 = gui.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit4:setParent(obj.tab6);
    obj.richEdit4:setAlign("client");
    obj.richEdit4:setField("acessorios");
    obj.richEdit4:setName("richEdit4");

    obj.tab7 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl1);
    obj.tab7:setTitle("Moedas");
    obj.tab7:setName("tab7");

    obj.richEdit5 = gui.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit5:setParent(obj.tab7);
    obj.richEdit5:setAlign("client");
    obj.richEdit5:setField("moedas");
    obj.richEdit5:setName("richEdit5");

    obj.tab8 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab8:setParent(obj.tabControl1);
    obj.tab8:setTitle("História");
    obj.tab8:setName("tab8");

    obj.richEdit6 = gui.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit6:setParent(obj.tab8);
    obj.richEdit6:setAlign("client");
    obj.richEdit6:setField("historia");
    obj.richEdit6:setName("richEdit6");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
                      local ficha = ndb.getRoot(sheet);
            
                      mesa.chat:rolarDados(
                        "01d20 + " .. sheet.atributos.inteligencia.total,
                        "Teste de Inteligência"
                      )
        end, obj);

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.inteligencia.total = (
                      (sheet.atributos.inteligencia.base or 0) +
                      (sheet.atributos.inteligencia.racaClasse or 0) +
                      (sheet.atributos.inteligencia.treinamento or 0) +
                      (sheet.atributos.inteligencia.habilidade or 0)
                    )
        end, obj);

    obj._e_event2 = obj.dataLink2:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.inteligencia.total = (
                      (sheet.atributos.inteligencia.base or 0) +
                      (sheet.atributos.inteligencia.racaClasse or 0) +
                      (sheet.atributos.inteligencia.treinamento or 0) +
                      (sheet.atributos.inteligencia.habilidade or 0)
                    )
        end, obj);

    obj._e_event3 = obj.dataLink3:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.inteligencia.total = (
                      (sheet.atributos.inteligencia.base or 0) +
                      (sheet.atributos.inteligencia.racaClasse or 0) +
                      (sheet.atributos.inteligencia.treinamento or 0) +
                      (sheet.atributos.inteligencia.habilidade or 0)
                    )
        end, obj);

    obj._e_event4 = obj.dataLink4:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.inteligencia.total = (
                      (sheet.atributos.inteligencia.base or 0) +
                      (sheet.atributos.inteligencia.racaClasse or 0) +
                      (sheet.atributos.inteligencia.treinamento or 0) +
                      (sheet.atributos.inteligencia.habilidade or 0)
                    )
        end, obj);

    obj._e_event5 = obj.button2:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
                      local ficha = ndb.getRoot(sheet);
            
                      mesa.chat:rolarDados(
                        "01d20 + " .. sheet.atributos.sabedoria.total,
                        "Teste de Sabedoria"
                      )
        end, obj);

    obj._e_event6 = obj.dataLink5:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.sabedoria.total = (
                      (sheet.atributos.sabedoria.base or 0) +
                      (sheet.atributos.sabedoria.racaClasse or 0) +
                      (sheet.atributos.sabedoria.treinamento or 0) +
                      (sheet.atributos.sabedoria.habilidade or 0)
                    )
        end, obj);

    obj._e_event7 = obj.dataLink6:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.sabedoria.total = (
                      (sheet.atributos.sabedoria.base or 0) +
                      (sheet.atributos.sabedoria.racaClasse or 0) +
                      (sheet.atributos.sabedoria.treinamento or 0) +
                      (sheet.atributos.sabedoria.habilidade or 0)
                    )
        end, obj);

    obj._e_event8 = obj.dataLink7:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.sabedoria.total = (
                      (sheet.atributos.sabedoria.base or 0) +
                      (sheet.atributos.sabedoria.racaClasse or 0) +
                      (sheet.atributos.sabedoria.treinamento or 0) +
                      (sheet.atributos.sabedoria.habilidade or 0)
                    )
        end, obj);

    obj._e_event9 = obj.dataLink8:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.sabedoria.total = (
                      (sheet.atributos.sabedoria.base or 0) +
                      (sheet.atributos.sabedoria.racaClasse or 0) +
                      (sheet.atributos.sabedoria.treinamento or 0) +
                      (sheet.atributos.sabedoria.habilidade or 0)
                    )
        end, obj);

    obj._e_event10 = obj.button3:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
                      local ficha = ndb.getRoot(sheet);
            
                      mesa.chat:rolarDados(
                        "01d20 + " .. sheet.atributos.vontade.total,
                        "Teste de Vontade"
                      )
        end, obj);

    obj._e_event11 = obj.dataLink9:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.vontade.total = (
                      (sheet.atributos.vontade.base or 0) +
                      (sheet.atributos.vontade.racaClasse or 0) +
                      (sheet.atributos.vontade.treinamento or 0) +
                      (sheet.atributos.vontade.habilidade or 0)
                    )
        end, obj);

    obj._e_event12 = obj.dataLink10:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.vontade.total = (
                      (sheet.atributos.vontade.base or 0) +
                      (sheet.atributos.vontade.racaClasse or 0) +
                      (sheet.atributos.vontade.treinamento or 0) +
                      (sheet.atributos.vontade.habilidade or 0)
                    )
        end, obj);

    obj._e_event13 = obj.dataLink11:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.vontade.total = (
                      (sheet.atributos.vontade.base or 0) +
                      (sheet.atributos.vontade.racaClasse or 0) +
                      (sheet.atributos.vontade.treinamento or 0) +
                      (sheet.atributos.vontade.habilidade or 0)
                    )
        end, obj);

    obj._e_event14 = obj.dataLink12:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.vontade.total = (
                      (sheet.atributos.vontade.base or 0) +
                      (sheet.atributos.vontade.racaClasse or 0) +
                      (sheet.atributos.vontade.treinamento or 0) +
                      (sheet.atributos.vontade.habilidade or 0)
                    )
        end, obj);

    obj._e_event15 = obj.button4:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
                      local ficha = ndb.getRoot(sheet);
            
                      mesa.chat:rolarDados(
                        "01d20 + " .. sheet.atributos.carisma.total,
                        "Teste de Carisma"
                      )
        end, obj);

    obj._e_event16 = obj.dataLink13:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.carisma.total = (
                      (sheet.atributos.carisma.base or 0) +
                      (sheet.atributos.carisma.racaClasse or 0) +
                      (sheet.atributos.carisma.treinamento or 0) +
                      (sheet.atributos.carisma.habilidade or 0)
                    )
        end, obj);

    obj._e_event17 = obj.dataLink14:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.carisma.total = (
                      (sheet.atributos.carisma.base or 0) +
                      (sheet.atributos.carisma.racaClasse or 0) +
                      (sheet.atributos.carisma.treinamento or 0) +
                      (sheet.atributos.carisma.habilidade or 0)
                    )
        end, obj);

    obj._e_event18 = obj.dataLink15:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.carisma.total = (
                      (sheet.atributos.carisma.base or 0) +
                      (sheet.atributos.carisma.racaClasse or 0) +
                      (sheet.atributos.carisma.treinamento or 0) +
                      (sheet.atributos.carisma.habilidade or 0)
                    )
        end, obj);

    obj._e_event19 = obj.dataLink16:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.carisma.total = (
                      (sheet.atributos.carisma.base or 0) +
                      (sheet.atributos.carisma.racaClasse or 0) +
                      (sheet.atributos.carisma.treinamento or 0) +
                      (sheet.atributos.carisma.habilidade or 0)
                    )
        end, obj);

    obj._e_event20 = obj.button5:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
                      local ficha = ndb.getRoot(sheet);
            
                      mesa.chat:rolarDados(
                        "01d20 + " .. sheet.atributos.energia.total,
                        "Teste de Energia"
                      )
        end, obj);

    obj._e_event21 = obj.dataLink17:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.energia.total = (
                      (sheet.atributos.energia.base or 0) +
                      (sheet.atributos.energia.racaClasse or 0) +
                      (sheet.atributos.energia.treinamento or 0) +
                      (sheet.atributos.energia.habilidade or 0)
                    )
        end, obj);

    obj._e_event22 = obj.dataLink18:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.energia.total = (
                      (sheet.atributos.energia.base or 0) +
                      (sheet.atributos.energia.racaClasse or 0) +
                      (sheet.atributos.energia.treinamento or 0) +
                      (sheet.atributos.energia.habilidade or 0)
                    )
        end, obj);

    obj._e_event23 = obj.dataLink19:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.energia.total = (
                      (sheet.atributos.energia.base or 0) +
                      (sheet.atributos.energia.racaClasse or 0) +
                      (sheet.atributos.energia.treinamento or 0) +
                      (sheet.atributos.energia.habilidade or 0)
                    )
        end, obj);

    obj._e_event24 = obj.dataLink20:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.energia.total = (
                      (sheet.atributos.energia.base or 0) +
                      (sheet.atributos.energia.racaClasse or 0) +
                      (sheet.atributos.energia.treinamento or 0) +
                      (sheet.atributos.energia.habilidade or 0)
                    )
        end, obj);

    obj._e_event25 = obj.button6:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
                      local ficha = ndb.getRoot(sheet);
            
                      mesa.chat:rolarDados(
                        "01d20 + " .. sheet.atributos.corpo.total,
                        "Teste de Corpo"
                      )
        end, obj);

    obj._e_event26 = obj.dataLink21:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.corpo.total = (
                      (sheet.atributos.corpo.base or 0) +
                      (sheet.atributos.corpo.racaClasse or 0) +
                      (sheet.atributos.corpo.treinamento or 0) +
                      (sheet.atributos.corpo.habilidade or 0)
                    )
        end, obj);

    obj._e_event27 = obj.dataLink22:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.corpo.total = (
                      (sheet.atributos.corpo.base or 0) +
                      (sheet.atributos.corpo.racaClasse or 0) +
                      (sheet.atributos.corpo.treinamento or 0) +
                      (sheet.atributos.corpo.habilidade or 0)
                    )
        end, obj);

    obj._e_event28 = obj.dataLink23:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.corpo.total = (
                      (sheet.atributos.corpo.base or 0) +
                      (sheet.atributos.corpo.racaClasse or 0) +
                      (sheet.atributos.corpo.treinamento or 0) +
                      (sheet.atributos.corpo.habilidade or 0)
                    )
        end, obj);

    obj._e_event29 = obj.dataLink24:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.corpo.total = (
                      (sheet.atributos.corpo.base or 0) +
                      (sheet.atributos.corpo.racaClasse or 0) +
                      (sheet.atributos.corpo.treinamento or 0) +
                      (sheet.atributos.corpo.habilidade or 0)
                    )
        end, obj);

    obj._e_event30 = obj.button7:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
                      local ficha = ndb.getRoot(sheet);
            
                      mesa.chat:rolarDados(
                        "01d20 + " .. sheet.atributos.resistencia.total,
                        "Teste de Resistência"
                      )
        end, obj);

    obj._e_event31 = obj.dataLink25:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.resistencia.total = (
                      (sheet.atributos.resistencia.base or 0) +
                      (sheet.atributos.resistencia.racaClasse or 0) +
                      (sheet.atributos.resistencia.treinamento or 0) +
                      (sheet.atributos.resistencia.habilidade or 0)
                    )
        end, obj);

    obj._e_event32 = obj.dataLink26:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.resistencia.total = (
                      (sheet.atributos.resistencia.base or 0) +
                      (sheet.atributos.resistencia.racaClasse or 0) +
                      (sheet.atributos.resistencia.treinamento or 0) +
                      (sheet.atributos.resistencia.habilidade or 0)
                    )
        end, obj);

    obj._e_event33 = obj.dataLink27:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.resistencia.total = (
                      (sheet.atributos.resistencia.base or 0) +
                      (sheet.atributos.resistencia.racaClasse or 0) +
                      (sheet.atributos.resistencia.treinamento or 0) +
                      (sheet.atributos.resistencia.habilidade or 0)
                    )
        end, obj);

    obj._e_event34 = obj.dataLink28:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.resistencia.total = (
                      (sheet.atributos.resistencia.base or 0) +
                      (sheet.atributos.resistencia.racaClasse or 0) +
                      (sheet.atributos.resistencia.treinamento or 0) +
                      (sheet.atributos.resistencia.habilidade or 0)
                    )
        end, obj);

    obj._e_event35 = obj.button8:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
                      local ficha = ndb.getRoot(sheet);
            
                      mesa.chat:rolarDados(
                        "01d20 + " .. sheet.atributos.velocidade.total,
                        "Teste de Velocidade"
                      )
        end, obj);

    obj._e_event36 = obj.dataLink29:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.velocidade.total = (
                      (sheet.atributos.velocidade.base or 0) +
                      (sheet.atributos.velocidade.racaClasse or 0) +
                      (sheet.atributos.velocidade.treinamento or 0) +
                      (sheet.atributos.velocidade.habilidade or 0)
                    )
        end, obj);

    obj._e_event37 = obj.dataLink30:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.velocidade.total = (
                      (sheet.atributos.velocidade.base or 0) +
                      (sheet.atributos.velocidade.racaClasse or 0) +
                      (sheet.atributos.velocidade.treinamento or 0) +
                      (sheet.atributos.velocidade.habilidade or 0)
                    )
        end, obj);

    obj._e_event38 = obj.dataLink31:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.velocidade.total = (
                      (sheet.atributos.velocidade.base or 0) +
                      (sheet.atributos.velocidade.racaClasse or 0) +
                      (sheet.atributos.velocidade.treinamento or 0) +
                      (sheet.atributos.velocidade.habilidade or 0)
                    )
        end, obj);

    obj._e_event39 = obj.dataLink32:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.velocidade.total = (
                      (sheet.atributos.velocidade.base or 0) +
                      (sheet.atributos.velocidade.racaClasse or 0) +
                      (sheet.atributos.velocidade.treinamento or 0) +
                      (sheet.atributos.velocidade.habilidade or 0)
                    )
        end, obj);

    obj._e_event40 = obj.button9:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
                      local ficha = ndb.getRoot(sheet);
            
                      mesa.chat:rolarDados(
                        "01d20 + " .. sheet.atributos.agilidade.total,
                        "Teste de Agilidade"
                      )
        end, obj);

    obj._e_event41 = obj.dataLink33:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.agilidade.total = (
                      (sheet.atributos.agilidade.base or 0) +
                      (sheet.atributos.agilidade.racaClasse or 0) +
                      (sheet.atributos.agilidade.treinamento or 0) +
                      (sheet.atributos.agilidade.habilidade or 0)
                    )
        end, obj);

    obj._e_event42 = obj.dataLink34:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.agilidade.total = (
                      (sheet.atributos.agilidade.base or 0) +
                      (sheet.atributos.agilidade.racaClasse or 0) +
                      (sheet.atributos.agilidade.treinamento or 0) +
                      (sheet.atributos.agilidade.habilidade or 0)
                    )
        end, obj);

    obj._e_event43 = obj.dataLink35:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.agilidade.total = (
                      (sheet.atributos.agilidade.base or 0) +
                      (sheet.atributos.agilidade.racaClasse or 0) +
                      (sheet.atributos.agilidade.treinamento or 0) +
                      (sheet.atributos.agilidade.habilidade or 0)
                    )
        end, obj);

    obj._e_event44 = obj.dataLink36:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.agilidade.total = (
                      (sheet.atributos.agilidade.base or 0) +
                      (sheet.atributos.agilidade.racaClasse or 0) +
                      (sheet.atributos.agilidade.treinamento or 0) +
                      (sheet.atributos.agilidade.habilidade or 0)
                    )
        end, obj);

    obj._e_event45 = obj.button10:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
                      local ficha = ndb.getRoot(sheet);
            
                      mesa.chat:rolarDados(
                        "01d20 + " .. sheet.atributos.destreza.total,
                        "Teste de Destreza"
                      )
        end, obj);

    obj._e_event46 = obj.dataLink37:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.destreza.total = (
                      (sheet.atributos.destreza.base or 0) +
                      (sheet.atributos.destreza.racaClasse or 0) +
                      (sheet.atributos.destreza.treinamento or 0) +
                      (sheet.atributos.destreza.habilidade or 0)
                    )
        end, obj);

    obj._e_event47 = obj.dataLink38:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.destreza.total = (
                      (sheet.atributos.destreza.base or 0) +
                      (sheet.atributos.destreza.racaClasse or 0) +
                      (sheet.atributos.destreza.treinamento or 0) +
                      (sheet.atributos.destreza.habilidade or 0)
                    )
        end, obj);

    obj._e_event48 = obj.dataLink39:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.destreza.total = (
                      (sheet.atributos.destreza.base or 0) +
                      (sheet.atributos.destreza.racaClasse or 0) +
                      (sheet.atributos.destreza.treinamento or 0) +
                      (sheet.atributos.destreza.habilidade or 0)
                    )
        end, obj);

    obj._e_event49 = obj.dataLink40:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.destreza.total = (
                      (sheet.atributos.destreza.base or 0) +
                      (sheet.atributos.destreza.racaClasse or 0) +
                      (sheet.atributos.destreza.treinamento or 0) +
                      (sheet.atributos.destreza.habilidade or 0)
                    )
        end, obj);

    obj._e_event50 = obj.button11:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
                      local ficha = ndb.getRoot(sheet);
            
                      mesa.chat:rolarDados(
                        "01d20 + " .. sheet.atributos.forca.total,
                        "Teste de Força"
                      )
        end, obj);

    obj._e_event51 = obj.dataLink41:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.forca.total = (
                      (sheet.atributos.forca.base or 0) +
                      (sheet.atributos.forca.racaClasse or 0) +
                      (sheet.atributos.forca.treinamento or 0) +
                      (sheet.atributos.forca.habilidade or 0)
                    )
        end, obj);

    obj._e_event52 = obj.dataLink42:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.forca.total = (
                      (sheet.atributos.forca.base or 0) +
                      (sheet.atributos.forca.racaClasse or 0) +
                      (sheet.atributos.forca.treinamento or 0) +
                      (sheet.atributos.forca.habilidade or 0)
                    )
        end, obj);

    obj._e_event53 = obj.dataLink43:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.forca.total = (
                      (sheet.atributos.forca.base or 0) +
                      (sheet.atributos.forca.racaClasse or 0) +
                      (sheet.atributos.forca.treinamento or 0) +
                      (sheet.atributos.forca.habilidade or 0)
                    )
        end, obj);

    obj._e_event54 = obj.dataLink44:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.forca.total = (
                      (sheet.atributos.forca.base or 0) +
                      (sheet.atributos.forca.racaClasse or 0) +
                      (sheet.atributos.forca.treinamento or 0) +
                      (sheet.atributos.forca.habilidade or 0)
                    )
        end, obj);

    obj._e_event55 = obj.button12:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
                      local ficha = ndb.getRoot(sheet);
            
                      mesa.chat:rolarDados(
                        "01d20 + " .. sheet.atributos.vigor.total,
                        "Teste de Vigor"
                      )
        end, obj);

    obj._e_event56 = obj.dataLink45:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.vigor.total = (
                      (sheet.atributos.vigor.base or 0) +
                      (sheet.atributos.vigor.racaClasse or 0) +
                      (sheet.atributos.vigor.treinamento or 0) +
                      (sheet.atributos.vigor.habilidade or 0)
                    )
        end, obj);

    obj._e_event57 = obj.dataLink46:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.vigor.total = (
                      (sheet.atributos.vigor.base or 0) +
                      (sheet.atributos.vigor.racaClasse or 0) +
                      (sheet.atributos.vigor.treinamento or 0) +
                      (sheet.atributos.vigor.habilidade or 0)
                    )
        end, obj);

    obj._e_event58 = obj.dataLink47:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.vigor.total = (
                      (sheet.atributos.vigor.base or 0) +
                      (sheet.atributos.vigor.racaClasse or 0) +
                      (sheet.atributos.vigor.treinamento or 0) +
                      (sheet.atributos.vigor.habilidade or 0)
                    )
        end, obj);

    obj._e_event59 = obj.dataLink48:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.vigor.total = (
                      (sheet.atributos.vigor.base or 0) +
                      (sheet.atributos.vigor.racaClasse or 0) +
                      (sheet.atributos.vigor.treinamento or 0) +
                      (sheet.atributos.vigor.habilidade or 0)
                    )
        end, obj);

    obj._e_event60 = obj.button13:addEventListener("onClick",
        function (self)
            self.pericias:append()
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event60);
        __o_rrpgObjs.removeEventListenerById(self._e_event59);
        __o_rrpgObjs.removeEventListenerById(self._e_event58);
        __o_rrpgObjs.removeEventListenerById(self._e_event57);
        __o_rrpgObjs.removeEventListenerById(self._e_event56);
        __o_rrpgObjs.removeEventListenerById(self._e_event55);
        __o_rrpgObjs.removeEventListenerById(self._e_event54);
        __o_rrpgObjs.removeEventListenerById(self._e_event53);
        __o_rrpgObjs.removeEventListenerById(self._e_event52);
        __o_rrpgObjs.removeEventListenerById(self._e_event51);
        __o_rrpgObjs.removeEventListenerById(self._e_event50);
        __o_rrpgObjs.removeEventListenerById(self._e_event49);
        __o_rrpgObjs.removeEventListenerById(self._e_event48);
        __o_rrpgObjs.removeEventListenerById(self._e_event47);
        __o_rrpgObjs.removeEventListenerById(self._e_event46);
        __o_rrpgObjs.removeEventListenerById(self._e_event45);
        __o_rrpgObjs.removeEventListenerById(self._e_event44);
        __o_rrpgObjs.removeEventListenerById(self._e_event43);
        __o_rrpgObjs.removeEventListenerById(self._e_event42);
        __o_rrpgObjs.removeEventListenerById(self._e_event41);
        __o_rrpgObjs.removeEventListenerById(self._e_event40);
        __o_rrpgObjs.removeEventListenerById(self._e_event39);
        __o_rrpgObjs.removeEventListenerById(self._e_event38);
        __o_rrpgObjs.removeEventListenerById(self._e_event37);
        __o_rrpgObjs.removeEventListenerById(self._e_event36);
        __o_rrpgObjs.removeEventListenerById(self._e_event35);
        __o_rrpgObjs.removeEventListenerById(self._e_event34);
        __o_rrpgObjs.removeEventListenerById(self._e_event33);
        __o_rrpgObjs.removeEventListenerById(self._e_event32);
        __o_rrpgObjs.removeEventListenerById(self._e_event31);
        __o_rrpgObjs.removeEventListenerById(self._e_event30);
        __o_rrpgObjs.removeEventListenerById(self._e_event29);
        __o_rrpgObjs.removeEventListenerById(self._e_event28);
        __o_rrpgObjs.removeEventListenerById(self._e_event27);
        __o_rrpgObjs.removeEventListenerById(self._e_event26);
        __o_rrpgObjs.removeEventListenerById(self._e_event25);
        __o_rrpgObjs.removeEventListenerById(self._e_event24);
        __o_rrpgObjs.removeEventListenerById(self._e_event23);
        __o_rrpgObjs.removeEventListenerById(self._e_event22);
        __o_rrpgObjs.removeEventListenerById(self._e_event21);
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

        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.richEdit3 ~= nil then self.richEdit3:destroy(); self.richEdit3 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.richEdit4 ~= nil then self.richEdit4:destroy(); self.richEdit4 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.pericias ~= nil then self.pericias:destroy(); self.pericias = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.richEdit6 ~= nil then self.richEdit6:destroy(); self.richEdit6 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.richEdit5 ~= nil then self.richEdit5:destroy(); self.richEdit5 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
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
    title = "Sistema GTK - Ficha do Personagem (v0.2)", 
    description=""};

frmFichaDoPersonagem = _frmFichaDoPersonagem;
rrpg.registrarForm(_frmFichaDoPersonagem);
rrpg.registrarDataType(_frmFichaDoPersonagem);

return _frmFichaDoPersonagem;
