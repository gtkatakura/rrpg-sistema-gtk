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
    obj:setTitle("Ficha do Personagem - GTK (v0.5.3)");
    obj:setName("frmFichaDoPersonagem");

    obj.tabControl1 = gui.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Informações");
    obj.tab1:setName("tab1");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.tab1);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(10);
    obj.rectangle1:setTop(10);
    obj.rectangle1:setWidth(400);
    obj.rectangle1:setHeight(75);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(5);
    obj.layout1:setTop(5);
    obj.layout1:setWidth(400);
    obj.layout1:setHeight(30);
    obj.layout1:setName("layout1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setAlign("left");
    obj.label1:setWidth(140);
    obj.label1:setText("NOME COMPLETO");
    obj.label1:setName("label1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setAlign("left");
    obj.edit1:setWidth(250);
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setLeft(5);
    obj.layout2:setTop(40);
    obj.layout2:setWidth(400);
    obj.layout2:setHeight(30);
    obj.layout2:setName("layout2");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setAlign("left");
    obj.label2:setWidth(140);
    obj.label2:setText("PROFISSÃO");
    obj.label2:setName("label2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setAlign("left");
    obj.edit2:setWidth(250);
    obj.edit2:setField("profissao");
    obj.edit2:setName("edit2");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox1);
    obj.rectangle2:setLeft(10);
    obj.rectangle2:setTop(90);
    obj.rectangle2:setWidth(400);
    obj.rectangle2:setHeight(80);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle2);
    obj.layout3:setLeft(5);
    obj.layout3:setTop(5);
    obj.layout3:setWidth(400);
    obj.layout3:setHeight(30);
    obj.layout3:setName("layout3");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout3);
    obj.label3:setAlign("left");
    obj.label3:setWidth(150);
    obj.label3:setText("IDADE (ANOS)");
    obj.label3:setName("label3");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setType("number");
    obj.edit3:setAlign("left");
    obj.edit3:setWidth(40);
    obj.edit3:setField("idade");
    obj.edit3:setName("edit3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout3);
    obj.label4:setAlign("left");
    obj.label4:setWidth(150);
    obj.label4:setText("GRUPO SANGUÍNEO");
    obj.label4:setMargins({left=4});
    obj.label4:setName("label4");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout3);
    obj.edit4:setAlign("left");
    obj.edit4:setWidth(40);
    obj.edit4:setField("grupoSanguineo");
    obj.edit4:setName("edit4");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle2);
    obj.layout4:setLeft(5);
    obj.layout4:setTop(40);
    obj.layout4:setWidth(500);
    obj.layout4:setHeight(30);
    obj.layout4:setName("layout4");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout4);
    obj.label5:setAlign("left");
    obj.label5:setWidth(150);
    obj.label5:setText("ALTURA (CENTÍMETROS)");
    obj.label5:setName("label5");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout4);
    obj.edit5:setType("number");
    obj.edit5:setAlign("left");
    obj.edit5:setWidth(40);
    obj.edit5:setField("altura");
    obj.edit5:setName("edit5");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout4);
    obj.label6:setAlign("left");
    obj.label6:setWidth(150);
    obj.label6:setText("PESO (QUILOGRAMAS)");
    obj.label6:setMargins({left=4});
    obj.label6:setName("label6");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout4);
    obj.edit6:setType("number");
    obj.edit6:setAlign("left");
    obj.edit6:setWidth(40);
    obj.edit6:setField("peso");
    obj.edit6:setName("edit6");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.scrollBox1);
    obj.rectangle3:setLeft(10);
    obj.rectangle3:setTop(175);
    obj.rectangle3:setWidth(400);
    obj.rectangle3:setHeight(380);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(12);
    obj.image1:setTop(177);
    obj.image1:setWidth(396);
    obj.image1:setHeight(376);
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setStyle("proportional");
    obj.image1:setName("image1");

    obj.tab2 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Atributos");
    obj.tab2:setName("tab2");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.tab2);
    obj.layout5:setLeft(20);
    obj.layout5:setWidth(300);
    obj.layout5:setHeight(400);
    obj.layout5:setName("layout5");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout5);
    obj.layout6:setTop(40);
    obj.layout6:setHeight(25);
    obj.layout6:setWidth(450);
    obj.layout6:setMargins({left=4,right=4});
    obj.layout6:setName("layout6");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout6);
    obj.button1:setAlign("left");
    obj.button1:setWidth(30);
    obj.button1:setMargins({right=4});
    obj.button1:setHint("Rolagem de Teste de Atributo");
    obj.button1:setName("button1");

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.button1);
    obj.image2:setAlign("left");
    obj.image2:setWidth(30);
    obj.image2:setSRC("/src/assets/dice-six-faces.png");
    obj.image2:setName("image2");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout6);
    obj.label7:setAlign("left");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setText("Inteligência");
    obj.label7:setWidth(85);
    obj.label7:setAutoSize(true);
    obj.label7:setName("label7");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout6);
    obj.edit7:setType("number");
    obj.edit7:setAlign("left");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setWidth(30);
    obj.edit7:setMargins({left=2, right=2});
    obj.edit7:setField("atributos.inteligencia.base");
    obj.edit7:setName("edit7");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout6);
    obj.dataLink1:setField("atributos.inteligencia.base");
    obj.dataLink1:setName("dataLink1");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout6);
    obj.edit8:setType("number");
    obj.edit8:setAlign("left");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setWidth(30);
    obj.edit8:setMargins({left=2, right=2});
    obj.edit8:setField("atributos.inteligencia.racaClasse");
    obj.edit8:setName("edit8");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout6);
    obj.dataLink2:setField("atributos.inteligencia.racaClasse");
    obj.dataLink2:setName("dataLink2");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout6);
    obj.edit9:setType("number");
    obj.edit9:setAlign("left");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setWidth(30);
    obj.edit9:setMargins({left=2, right=2});
    obj.edit9:setField("atributos.inteligencia.treinamento");
    obj.edit9:setName("edit9");

    obj.dataLink3 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout6);
    obj.dataLink3:setField("atributos.inteligencia.treinamento");
    obj.dataLink3:setName("dataLink3");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout6);
    obj.edit10:setType("number");
    obj.edit10:setAlign("left");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setWidth(30);
    obj.edit10:setMargins({left=2, right=2});
    obj.edit10:setField("atributos.inteligencia.habilidade");
    obj.edit10:setName("edit10");

    obj.dataLink4 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout6);
    obj.dataLink4:setField("atributos.inteligencia.habilidade");
    obj.dataLink4:setName("dataLink4");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout6);
    obj.label8:setAlign("left");
    obj.label8:setText("=");
    obj.label8:setWidth(10);
    obj.label8:setMargins({left=4,right=4});
    obj.label8:setName("label8");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout6);
    obj.label9:setAlign("left");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setWidth(30);
    obj.label9:setField("atributos.inteligencia.total");
    obj.label9:setName("label9");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout5);
    obj.layout7:setTop(70);
    obj.layout7:setHeight(25);
    obj.layout7:setWidth(450);
    obj.layout7:setMargins({left=4,right=4});
    obj.layout7:setName("layout7");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout7);
    obj.button2:setAlign("left");
    obj.button2:setWidth(30);
    obj.button2:setMargins({right=4});
    obj.button2:setHint("Rolagem de Teste de Atributo");
    obj.button2:setName("button2");

    obj.image3 = gui.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.button2);
    obj.image3:setAlign("left");
    obj.image3:setWidth(30);
    obj.image3:setSRC("/src/assets/dice-six-faces.png");
    obj.image3:setName("image3");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout7);
    obj.label10:setAlign("left");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setText("Sabedoria");
    obj.label10:setWidth(85);
    obj.label10:setAutoSize(true);
    obj.label10:setName("label10");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout7);
    obj.edit11:setType("number");
    obj.edit11:setAlign("left");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setWidth(30);
    obj.edit11:setMargins({left=2, right=2});
    obj.edit11:setField("atributos.sabedoria.base");
    obj.edit11:setName("edit11");

    obj.dataLink5 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout7);
    obj.dataLink5:setField("atributos.sabedoria.base");
    obj.dataLink5:setName("dataLink5");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout7);
    obj.edit12:setType("number");
    obj.edit12:setAlign("left");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setWidth(30);
    obj.edit12:setMargins({left=2, right=2});
    obj.edit12:setField("atributos.sabedoria.racaClasse");
    obj.edit12:setName("edit12");

    obj.dataLink6 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout7);
    obj.dataLink6:setField("atributos.sabedoria.racaClasse");
    obj.dataLink6:setName("dataLink6");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout7);
    obj.edit13:setType("number");
    obj.edit13:setAlign("left");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setWidth(30);
    obj.edit13:setMargins({left=2, right=2});
    obj.edit13:setField("atributos.sabedoria.treinamento");
    obj.edit13:setName("edit13");

    obj.dataLink7 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout7);
    obj.dataLink7:setField("atributos.sabedoria.treinamento");
    obj.dataLink7:setName("dataLink7");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout7);
    obj.edit14:setType("number");
    obj.edit14:setAlign("left");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setWidth(30);
    obj.edit14:setMargins({left=2, right=2});
    obj.edit14:setField("atributos.sabedoria.habilidade");
    obj.edit14:setName("edit14");

    obj.dataLink8 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout7);
    obj.dataLink8:setField("atributos.sabedoria.habilidade");
    obj.dataLink8:setName("dataLink8");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout7);
    obj.label11:setAlign("left");
    obj.label11:setText("=");
    obj.label11:setWidth(10);
    obj.label11:setMargins({left=4,right=4});
    obj.label11:setName("label11");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout7);
    obj.label12:setAlign("left");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setWidth(30);
    obj.label12:setField("atributos.sabedoria.total");
    obj.label12:setName("label12");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout5);
    obj.layout8:setTop(100);
    obj.layout8:setHeight(25);
    obj.layout8:setWidth(450);
    obj.layout8:setMargins({left=4,right=4});
    obj.layout8:setName("layout8");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout8);
    obj.button3:setAlign("left");
    obj.button3:setWidth(30);
    obj.button3:setMargins({right=4});
    obj.button3:setHint("Rolagem de Teste de Atributo");
    obj.button3:setName("button3");

    obj.image4 = gui.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.button3);
    obj.image4:setAlign("left");
    obj.image4:setWidth(30);
    obj.image4:setSRC("/src/assets/dice-six-faces.png");
    obj.image4:setName("image4");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout8);
    obj.label13:setAlign("left");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setText("Vontade");
    obj.label13:setWidth(85);
    obj.label13:setAutoSize(true);
    obj.label13:setName("label13");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout8);
    obj.edit15:setType("number");
    obj.edit15:setAlign("left");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setWidth(30);
    obj.edit15:setMargins({left=2, right=2});
    obj.edit15:setField("atributos.vontade.base");
    obj.edit15:setName("edit15");

    obj.dataLink9 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout8);
    obj.dataLink9:setField("atributos.vontade.base");
    obj.dataLink9:setName("dataLink9");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout8);
    obj.edit16:setType("number");
    obj.edit16:setAlign("left");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setWidth(30);
    obj.edit16:setMargins({left=2, right=2});
    obj.edit16:setField("atributos.vontade.racaClasse");
    obj.edit16:setName("edit16");

    obj.dataLink10 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout8);
    obj.dataLink10:setField("atributos.vontade.racaClasse");
    obj.dataLink10:setName("dataLink10");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout8);
    obj.edit17:setType("number");
    obj.edit17:setAlign("left");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setWidth(30);
    obj.edit17:setMargins({left=2, right=2});
    obj.edit17:setField("atributos.vontade.treinamento");
    obj.edit17:setName("edit17");

    obj.dataLink11 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout8);
    obj.dataLink11:setField("atributos.vontade.treinamento");
    obj.dataLink11:setName("dataLink11");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout8);
    obj.edit18:setType("number");
    obj.edit18:setAlign("left");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setWidth(30);
    obj.edit18:setMargins({left=2, right=2});
    obj.edit18:setField("atributos.vontade.habilidade");
    obj.edit18:setName("edit18");

    obj.dataLink12 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout8);
    obj.dataLink12:setField("atributos.vontade.habilidade");
    obj.dataLink12:setName("dataLink12");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout8);
    obj.label14:setAlign("left");
    obj.label14:setText("=");
    obj.label14:setWidth(10);
    obj.label14:setMargins({left=4,right=4});
    obj.label14:setName("label14");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout8);
    obj.label15:setAlign("left");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setWidth(30);
    obj.label15:setField("atributos.vontade.total");
    obj.label15:setName("label15");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout5);
    obj.layout9:setTop(130);
    obj.layout9:setHeight(25);
    obj.layout9:setWidth(450);
    obj.layout9:setMargins({left=4,right=4});
    obj.layout9:setName("layout9");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout9);
    obj.button4:setAlign("left");
    obj.button4:setWidth(30);
    obj.button4:setMargins({right=4});
    obj.button4:setHint("Rolagem de Teste de Atributo");
    obj.button4:setName("button4");

    obj.image5 = gui.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.button4);
    obj.image5:setAlign("left");
    obj.image5:setWidth(30);
    obj.image5:setSRC("/src/assets/dice-six-faces.png");
    obj.image5:setName("image5");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout9);
    obj.label16:setAlign("left");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setText("Carisma");
    obj.label16:setWidth(85);
    obj.label16:setAutoSize(true);
    obj.label16:setName("label16");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout9);
    obj.edit19:setType("number");
    obj.edit19:setAlign("left");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setWidth(30);
    obj.edit19:setMargins({left=2, right=2});
    obj.edit19:setField("atributos.carisma.base");
    obj.edit19:setName("edit19");

    obj.dataLink13 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout9);
    obj.dataLink13:setField("atributos.carisma.base");
    obj.dataLink13:setName("dataLink13");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout9);
    obj.edit20:setType("number");
    obj.edit20:setAlign("left");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setWidth(30);
    obj.edit20:setMargins({left=2, right=2});
    obj.edit20:setField("atributos.carisma.racaClasse");
    obj.edit20:setName("edit20");

    obj.dataLink14 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout9);
    obj.dataLink14:setField("atributos.carisma.racaClasse");
    obj.dataLink14:setName("dataLink14");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout9);
    obj.edit21:setType("number");
    obj.edit21:setAlign("left");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setWidth(30);
    obj.edit21:setMargins({left=2, right=2});
    obj.edit21:setField("atributos.carisma.treinamento");
    obj.edit21:setName("edit21");

    obj.dataLink15 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout9);
    obj.dataLink15:setField("atributos.carisma.treinamento");
    obj.dataLink15:setName("dataLink15");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout9);
    obj.edit22:setType("number");
    obj.edit22:setAlign("left");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setWidth(30);
    obj.edit22:setMargins({left=2, right=2});
    obj.edit22:setField("atributos.carisma.habilidade");
    obj.edit22:setName("edit22");

    obj.dataLink16 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout9);
    obj.dataLink16:setField("atributos.carisma.habilidade");
    obj.dataLink16:setName("dataLink16");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout9);
    obj.label17:setAlign("left");
    obj.label17:setText("=");
    obj.label17:setWidth(10);
    obj.label17:setMargins({left=4,right=4});
    obj.label17:setName("label17");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout9);
    obj.label18:setAlign("left");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setWidth(30);
    obj.label18:setField("atributos.carisma.total");
    obj.label18:setName("label18");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout5);
    obj.layout10:setTop(160);
    obj.layout10:setHeight(25);
    obj.layout10:setWidth(450);
    obj.layout10:setMargins({left=4,right=4});
    obj.layout10:setName("layout10");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout10);
    obj.button5:setAlign("left");
    obj.button5:setWidth(30);
    obj.button5:setMargins({right=4});
    obj.button5:setHint("Rolagem de Teste de Atributo");
    obj.button5:setName("button5");

    obj.image6 = gui.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.button5);
    obj.image6:setAlign("left");
    obj.image6:setWidth(30);
    obj.image6:setSRC("/src/assets/dice-six-faces.png");
    obj.image6:setName("image6");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout10);
    obj.label19:setAlign("left");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setText("Energia");
    obj.label19:setWidth(85);
    obj.label19:setAutoSize(true);
    obj.label19:setName("label19");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout10);
    obj.edit23:setType("number");
    obj.edit23:setAlign("left");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setWidth(30);
    obj.edit23:setMargins({left=2, right=2});
    obj.edit23:setField("atributos.energia.base");
    obj.edit23:setName("edit23");

    obj.dataLink17 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout10);
    obj.dataLink17:setField("atributos.energia.base");
    obj.dataLink17:setName("dataLink17");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout10);
    obj.edit24:setType("number");
    obj.edit24:setAlign("left");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setWidth(30);
    obj.edit24:setMargins({left=2, right=2});
    obj.edit24:setField("atributos.energia.racaClasse");
    obj.edit24:setName("edit24");

    obj.dataLink18 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout10);
    obj.dataLink18:setField("atributos.energia.racaClasse");
    obj.dataLink18:setName("dataLink18");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout10);
    obj.edit25:setType("number");
    obj.edit25:setAlign("left");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setWidth(30);
    obj.edit25:setMargins({left=2, right=2});
    obj.edit25:setField("atributos.energia.treinamento");
    obj.edit25:setName("edit25");

    obj.dataLink19 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout10);
    obj.dataLink19:setField("atributos.energia.treinamento");
    obj.dataLink19:setName("dataLink19");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout10);
    obj.edit26:setType("number");
    obj.edit26:setAlign("left");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setWidth(30);
    obj.edit26:setMargins({left=2, right=2});
    obj.edit26:setField("atributos.energia.habilidade");
    obj.edit26:setName("edit26");

    obj.dataLink20 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout10);
    obj.dataLink20:setField("atributos.energia.habilidade");
    obj.dataLink20:setName("dataLink20");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout10);
    obj.label20:setAlign("left");
    obj.label20:setText("=");
    obj.label20:setWidth(10);
    obj.label20:setMargins({left=4,right=4});
    obj.label20:setName("label20");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout10);
    obj.label21:setAlign("left");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setWidth(30);
    obj.label21:setField("atributos.energia.total");
    obj.label21:setName("label21");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout5);
    obj.layout11:setTop(190);
    obj.layout11:setHeight(25);
    obj.layout11:setWidth(450);
    obj.layout11:setMargins({left=4,right=4});
    obj.layout11:setName("layout11");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout11);
    obj.button6:setAlign("left");
    obj.button6:setWidth(30);
    obj.button6:setMargins({right=4});
    obj.button6:setHint("Rolagem de Teste de Atributo");
    obj.button6:setName("button6");

    obj.image7 = gui.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.button6);
    obj.image7:setAlign("left");
    obj.image7:setWidth(30);
    obj.image7:setSRC("/src/assets/dice-six-faces.png");
    obj.image7:setName("image7");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout11);
    obj.label22:setAlign("left");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setText("Corpo");
    obj.label22:setWidth(85);
    obj.label22:setAutoSize(true);
    obj.label22:setName("label22");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout11);
    obj.edit27:setType("number");
    obj.edit27:setAlign("left");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setWidth(30);
    obj.edit27:setMargins({left=2, right=2});
    obj.edit27:setField("atributos.corpo.base");
    obj.edit27:setName("edit27");

    obj.dataLink21 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout11);
    obj.dataLink21:setField("atributos.corpo.base");
    obj.dataLink21:setName("dataLink21");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout11);
    obj.edit28:setType("number");
    obj.edit28:setAlign("left");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setWidth(30);
    obj.edit28:setMargins({left=2, right=2});
    obj.edit28:setField("atributos.corpo.racaClasse");
    obj.edit28:setName("edit28");

    obj.dataLink22 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout11);
    obj.dataLink22:setField("atributos.corpo.racaClasse");
    obj.dataLink22:setName("dataLink22");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout11);
    obj.edit29:setType("number");
    obj.edit29:setAlign("left");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setWidth(30);
    obj.edit29:setMargins({left=2, right=2});
    obj.edit29:setField("atributos.corpo.treinamento");
    obj.edit29:setName("edit29");

    obj.dataLink23 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout11);
    obj.dataLink23:setField("atributos.corpo.treinamento");
    obj.dataLink23:setName("dataLink23");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout11);
    obj.edit30:setType("number");
    obj.edit30:setAlign("left");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setWidth(30);
    obj.edit30:setMargins({left=2, right=2});
    obj.edit30:setField("atributos.corpo.habilidade");
    obj.edit30:setName("edit30");

    obj.dataLink24 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout11);
    obj.dataLink24:setField("atributos.corpo.habilidade");
    obj.dataLink24:setName("dataLink24");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout11);
    obj.label23:setAlign("left");
    obj.label23:setText("=");
    obj.label23:setWidth(10);
    obj.label23:setMargins({left=4,right=4});
    obj.label23:setName("label23");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout11);
    obj.label24:setAlign("left");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setWidth(30);
    obj.label24:setField("atributos.corpo.total");
    obj.label24:setName("label24");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.tab2);
    obj.layout12:setLeft(320);
    obj.layout12:setWidth(300);
    obj.layout12:setHeight(400);
    obj.layout12:setName("layout12");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout12);
    obj.layout13:setTop(40);
    obj.layout13:setHeight(25);
    obj.layout13:setWidth(450);
    obj.layout13:setMargins({left=4,right=4});
    obj.layout13:setName("layout13");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout13);
    obj.button7:setAlign("left");
    obj.button7:setWidth(30);
    obj.button7:setMargins({right=4});
    obj.button7:setHint("Rolagem de Teste de Atributo");
    obj.button7:setName("button7");

    obj.image8 = gui.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.button7);
    obj.image8:setAlign("left");
    obj.image8:setWidth(30);
    obj.image8:setSRC("/src/assets/dice-six-faces.png");
    obj.image8:setName("image8");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout13);
    obj.label25:setAlign("left");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setText("Resistência");
    obj.label25:setWidth(85);
    obj.label25:setAutoSize(true);
    obj.label25:setName("label25");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout13);
    obj.edit31:setType("number");
    obj.edit31:setAlign("left");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setWidth(30);
    obj.edit31:setMargins({left=2, right=2});
    obj.edit31:setField("atributos.resistencia.base");
    obj.edit31:setName("edit31");

    obj.dataLink25 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout13);
    obj.dataLink25:setField("atributos.resistencia.base");
    obj.dataLink25:setName("dataLink25");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout13);
    obj.edit32:setType("number");
    obj.edit32:setAlign("left");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setWidth(30);
    obj.edit32:setMargins({left=2, right=2});
    obj.edit32:setField("atributos.resistencia.racaClasse");
    obj.edit32:setName("edit32");

    obj.dataLink26 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout13);
    obj.dataLink26:setField("atributos.resistencia.racaClasse");
    obj.dataLink26:setName("dataLink26");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout13);
    obj.edit33:setType("number");
    obj.edit33:setAlign("left");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setWidth(30);
    obj.edit33:setMargins({left=2, right=2});
    obj.edit33:setField("atributos.resistencia.treinamento");
    obj.edit33:setName("edit33");

    obj.dataLink27 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.layout13);
    obj.dataLink27:setField("atributos.resistencia.treinamento");
    obj.dataLink27:setName("dataLink27");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout13);
    obj.edit34:setType("number");
    obj.edit34:setAlign("left");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setWidth(30);
    obj.edit34:setMargins({left=2, right=2});
    obj.edit34:setField("atributos.resistencia.habilidade");
    obj.edit34:setName("edit34");

    obj.dataLink28 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.layout13);
    obj.dataLink28:setField("atributos.resistencia.habilidade");
    obj.dataLink28:setName("dataLink28");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout13);
    obj.label26:setAlign("left");
    obj.label26:setText("=");
    obj.label26:setWidth(10);
    obj.label26:setMargins({left=4,right=4});
    obj.label26:setName("label26");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout13);
    obj.label27:setAlign("left");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setWidth(30);
    obj.label27:setField("atributos.resistencia.total");
    obj.label27:setName("label27");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout12);
    obj.layout14:setTop(70);
    obj.layout14:setHeight(25);
    obj.layout14:setWidth(450);
    obj.layout14:setMargins({left=4,right=4});
    obj.layout14:setName("layout14");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout14);
    obj.button8:setAlign("left");
    obj.button8:setWidth(30);
    obj.button8:setMargins({right=4});
    obj.button8:setHint("Rolagem de Teste de Atributo");
    obj.button8:setName("button8");

    obj.image9 = gui.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.button8);
    obj.image9:setAlign("left");
    obj.image9:setWidth(30);
    obj.image9:setSRC("/src/assets/dice-six-faces.png");
    obj.image9:setName("image9");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout14);
    obj.label28:setAlign("left");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setText("Velocidade");
    obj.label28:setWidth(85);
    obj.label28:setAutoSize(true);
    obj.label28:setName("label28");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout14);
    obj.edit35:setType("number");
    obj.edit35:setAlign("left");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setWidth(30);
    obj.edit35:setMargins({left=2, right=2});
    obj.edit35:setField("atributos.velocidade.base");
    obj.edit35:setName("edit35");

    obj.dataLink29 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.layout14);
    obj.dataLink29:setField("atributos.velocidade.base");
    obj.dataLink29:setName("dataLink29");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout14);
    obj.edit36:setType("number");
    obj.edit36:setAlign("left");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setWidth(30);
    obj.edit36:setMargins({left=2, right=2});
    obj.edit36:setField("atributos.velocidade.racaClasse");
    obj.edit36:setName("edit36");

    obj.dataLink30 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.layout14);
    obj.dataLink30:setField("atributos.velocidade.racaClasse");
    obj.dataLink30:setName("dataLink30");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout14);
    obj.edit37:setType("number");
    obj.edit37:setAlign("left");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setWidth(30);
    obj.edit37:setMargins({left=2, right=2});
    obj.edit37:setField("atributos.velocidade.treinamento");
    obj.edit37:setName("edit37");

    obj.dataLink31 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.layout14);
    obj.dataLink31:setField("atributos.velocidade.treinamento");
    obj.dataLink31:setName("dataLink31");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout14);
    obj.edit38:setType("number");
    obj.edit38:setAlign("left");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setWidth(30);
    obj.edit38:setMargins({left=2, right=2});
    obj.edit38:setField("atributos.velocidade.habilidade");
    obj.edit38:setName("edit38");

    obj.dataLink32 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.layout14);
    obj.dataLink32:setField("atributos.velocidade.habilidade");
    obj.dataLink32:setName("dataLink32");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout14);
    obj.label29:setAlign("left");
    obj.label29:setText("=");
    obj.label29:setWidth(10);
    obj.label29:setMargins({left=4,right=4});
    obj.label29:setName("label29");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout14);
    obj.label30:setAlign("left");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setWidth(30);
    obj.label30:setField("atributos.velocidade.total");
    obj.label30:setName("label30");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout12);
    obj.layout15:setTop(100);
    obj.layout15:setHeight(25);
    obj.layout15:setWidth(450);
    obj.layout15:setMargins({left=4,right=4});
    obj.layout15:setName("layout15");

    obj.button9 = gui.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout15);
    obj.button9:setAlign("left");
    obj.button9:setWidth(30);
    obj.button9:setMargins({right=4});
    obj.button9:setHint("Rolagem de Teste de Atributo");
    obj.button9:setName("button9");

    obj.image10 = gui.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.button9);
    obj.image10:setAlign("left");
    obj.image10:setWidth(30);
    obj.image10:setSRC("/src/assets/dice-six-faces.png");
    obj.image10:setName("image10");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout15);
    obj.label31:setAlign("left");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setText("Agilidade");
    obj.label31:setWidth(85);
    obj.label31:setAutoSize(true);
    obj.label31:setName("label31");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout15);
    obj.edit39:setType("number");
    obj.edit39:setAlign("left");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setWidth(30);
    obj.edit39:setMargins({left=2, right=2});
    obj.edit39:setField("atributos.agilidade.base");
    obj.edit39:setName("edit39");

    obj.dataLink33 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.layout15);
    obj.dataLink33:setField("atributos.agilidade.base");
    obj.dataLink33:setName("dataLink33");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout15);
    obj.edit40:setType("number");
    obj.edit40:setAlign("left");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setWidth(30);
    obj.edit40:setMargins({left=2, right=2});
    obj.edit40:setField("atributos.agilidade.racaClasse");
    obj.edit40:setName("edit40");

    obj.dataLink34 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.layout15);
    obj.dataLink34:setField("atributos.agilidade.racaClasse");
    obj.dataLink34:setName("dataLink34");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout15);
    obj.edit41:setType("number");
    obj.edit41:setAlign("left");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setWidth(30);
    obj.edit41:setMargins({left=2, right=2});
    obj.edit41:setField("atributos.agilidade.treinamento");
    obj.edit41:setName("edit41");

    obj.dataLink35 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.layout15);
    obj.dataLink35:setField("atributos.agilidade.treinamento");
    obj.dataLink35:setName("dataLink35");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout15);
    obj.edit42:setType("number");
    obj.edit42:setAlign("left");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setWidth(30);
    obj.edit42:setMargins({left=2, right=2});
    obj.edit42:setField("atributos.agilidade.habilidade");
    obj.edit42:setName("edit42");

    obj.dataLink36 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.layout15);
    obj.dataLink36:setField("atributos.agilidade.habilidade");
    obj.dataLink36:setName("dataLink36");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout15);
    obj.label32:setAlign("left");
    obj.label32:setText("=");
    obj.label32:setWidth(10);
    obj.label32:setMargins({left=4,right=4});
    obj.label32:setName("label32");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout15);
    obj.label33:setAlign("left");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setWidth(30);
    obj.label33:setField("atributos.agilidade.total");
    obj.label33:setName("label33");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout12);
    obj.layout16:setTop(130);
    obj.layout16:setHeight(25);
    obj.layout16:setWidth(450);
    obj.layout16:setMargins({left=4,right=4});
    obj.layout16:setName("layout16");

    obj.button10 = gui.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout16);
    obj.button10:setAlign("left");
    obj.button10:setWidth(30);
    obj.button10:setMargins({right=4});
    obj.button10:setHint("Rolagem de Teste de Atributo");
    obj.button10:setName("button10");

    obj.image11 = gui.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.button10);
    obj.image11:setAlign("left");
    obj.image11:setWidth(30);
    obj.image11:setSRC("/src/assets/dice-six-faces.png");
    obj.image11:setName("image11");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout16);
    obj.label34:setAlign("left");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setText("Destreza");
    obj.label34:setWidth(85);
    obj.label34:setAutoSize(true);
    obj.label34:setName("label34");

    obj.edit43 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout16);
    obj.edit43:setType("number");
    obj.edit43:setAlign("left");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setWidth(30);
    obj.edit43:setMargins({left=2, right=2});
    obj.edit43:setField("atributos.destreza.base");
    obj.edit43:setName("edit43");

    obj.dataLink37 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.layout16);
    obj.dataLink37:setField("atributos.destreza.base");
    obj.dataLink37:setName("dataLink37");

    obj.edit44 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout16);
    obj.edit44:setType("number");
    obj.edit44:setAlign("left");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setWidth(30);
    obj.edit44:setMargins({left=2, right=2});
    obj.edit44:setField("atributos.destreza.racaClasse");
    obj.edit44:setName("edit44");

    obj.dataLink38 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.layout16);
    obj.dataLink38:setField("atributos.destreza.racaClasse");
    obj.dataLink38:setName("dataLink38");

    obj.edit45 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout16);
    obj.edit45:setType("number");
    obj.edit45:setAlign("left");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setWidth(30);
    obj.edit45:setMargins({left=2, right=2});
    obj.edit45:setField("atributos.destreza.treinamento");
    obj.edit45:setName("edit45");

    obj.dataLink39 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.layout16);
    obj.dataLink39:setField("atributos.destreza.treinamento");
    obj.dataLink39:setName("dataLink39");

    obj.edit46 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout16);
    obj.edit46:setType("number");
    obj.edit46:setAlign("left");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setWidth(30);
    obj.edit46:setMargins({left=2, right=2});
    obj.edit46:setField("atributos.destreza.habilidade");
    obj.edit46:setName("edit46");

    obj.dataLink40 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.layout16);
    obj.dataLink40:setField("atributos.destreza.habilidade");
    obj.dataLink40:setName("dataLink40");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout16);
    obj.label35:setAlign("left");
    obj.label35:setText("=");
    obj.label35:setWidth(10);
    obj.label35:setMargins({left=4,right=4});
    obj.label35:setName("label35");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout16);
    obj.label36:setAlign("left");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setWidth(30);
    obj.label36:setField("atributos.destreza.total");
    obj.label36:setName("label36");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout12);
    obj.layout17:setTop(160);
    obj.layout17:setHeight(25);
    obj.layout17:setWidth(450);
    obj.layout17:setMargins({left=4,right=4});
    obj.layout17:setName("layout17");

    obj.button11 = gui.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout17);
    obj.button11:setAlign("left");
    obj.button11:setWidth(30);
    obj.button11:setMargins({right=4});
    obj.button11:setHint("Rolagem de Teste de Atributo");
    obj.button11:setName("button11");

    obj.image12 = gui.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.button11);
    obj.image12:setAlign("left");
    obj.image12:setWidth(30);
    obj.image12:setSRC("/src/assets/dice-six-faces.png");
    obj.image12:setName("image12");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout17);
    obj.label37:setAlign("left");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setText("Força");
    obj.label37:setWidth(85);
    obj.label37:setAutoSize(true);
    obj.label37:setName("label37");

    obj.edit47 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout17);
    obj.edit47:setType("number");
    obj.edit47:setAlign("left");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setWidth(30);
    obj.edit47:setMargins({left=2, right=2});
    obj.edit47:setField("atributos.forca.base");
    obj.edit47:setName("edit47");

    obj.dataLink41 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.layout17);
    obj.dataLink41:setField("atributos.forca.base");
    obj.dataLink41:setName("dataLink41");

    obj.edit48 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout17);
    obj.edit48:setType("number");
    obj.edit48:setAlign("left");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setWidth(30);
    obj.edit48:setMargins({left=2, right=2});
    obj.edit48:setField("atributos.forca.racaClasse");
    obj.edit48:setName("edit48");

    obj.dataLink42 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.layout17);
    obj.dataLink42:setField("atributos.forca.racaClasse");
    obj.dataLink42:setName("dataLink42");

    obj.edit49 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout17);
    obj.edit49:setType("number");
    obj.edit49:setAlign("left");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setWidth(30);
    obj.edit49:setMargins({left=2, right=2});
    obj.edit49:setField("atributos.forca.treinamento");
    obj.edit49:setName("edit49");

    obj.dataLink43 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj.layout17);
    obj.dataLink43:setField("atributos.forca.treinamento");
    obj.dataLink43:setName("dataLink43");

    obj.edit50 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout17);
    obj.edit50:setType("number");
    obj.edit50:setAlign("left");
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setWidth(30);
    obj.edit50:setMargins({left=2, right=2});
    obj.edit50:setField("atributos.forca.habilidade");
    obj.edit50:setName("edit50");

    obj.dataLink44 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj.layout17);
    obj.dataLink44:setField("atributos.forca.habilidade");
    obj.dataLink44:setName("dataLink44");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout17);
    obj.label38:setAlign("left");
    obj.label38:setText("=");
    obj.label38:setWidth(10);
    obj.label38:setMargins({left=4,right=4});
    obj.label38:setName("label38");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout17);
    obj.label39:setAlign("left");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setWidth(30);
    obj.label39:setField("atributos.forca.total");
    obj.label39:setName("label39");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout12);
    obj.layout18:setTop(190);
    obj.layout18:setHeight(25);
    obj.layout18:setWidth(450);
    obj.layout18:setMargins({left=4,right=4});
    obj.layout18:setName("layout18");

    obj.button12 = gui.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout18);
    obj.button12:setAlign("left");
    obj.button12:setWidth(30);
    obj.button12:setMargins({right=4});
    obj.button12:setHint("Rolagem de Teste de Atributo");
    obj.button12:setName("button12");

    obj.image13 = gui.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.button12);
    obj.image13:setAlign("left");
    obj.image13:setWidth(30);
    obj.image13:setSRC("/src/assets/dice-six-faces.png");
    obj.image13:setName("image13");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout18);
    obj.label40:setAlign("left");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setText("Vigor");
    obj.label40:setWidth(85);
    obj.label40:setAutoSize(true);
    obj.label40:setName("label40");

    obj.edit51 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout18);
    obj.edit51:setType("number");
    obj.edit51:setAlign("left");
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setWidth(30);
    obj.edit51:setMargins({left=2, right=2});
    obj.edit51:setField("atributos.vigor.base");
    obj.edit51:setName("edit51");

    obj.dataLink45 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj.layout18);
    obj.dataLink45:setField("atributos.vigor.base");
    obj.dataLink45:setName("dataLink45");

    obj.edit52 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout18);
    obj.edit52:setType("number");
    obj.edit52:setAlign("left");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setWidth(30);
    obj.edit52:setMargins({left=2, right=2});
    obj.edit52:setField("atributos.vigor.racaClasse");
    obj.edit52:setName("edit52");

    obj.dataLink46 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink46:setParent(obj.layout18);
    obj.dataLink46:setField("atributos.vigor.racaClasse");
    obj.dataLink46:setName("dataLink46");

    obj.edit53 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout18);
    obj.edit53:setType("number");
    obj.edit53:setAlign("left");
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setWidth(30);
    obj.edit53:setMargins({left=2, right=2});
    obj.edit53:setField("atributos.vigor.treinamento");
    obj.edit53:setName("edit53");

    obj.dataLink47 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink47:setParent(obj.layout18);
    obj.dataLink47:setField("atributos.vigor.treinamento");
    obj.dataLink47:setName("dataLink47");

    obj.edit54 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout18);
    obj.edit54:setType("number");
    obj.edit54:setAlign("left");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setWidth(30);
    obj.edit54:setMargins({left=2, right=2});
    obj.edit54:setField("atributos.vigor.habilidade");
    obj.edit54:setName("edit54");

    obj.dataLink48 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink48:setParent(obj.layout18);
    obj.dataLink48:setField("atributos.vigor.habilidade");
    obj.dataLink48:setName("dataLink48");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout18);
    obj.label41:setAlign("left");
    obj.label41:setText("=");
    obj.label41:setWidth(10);
    obj.label41:setMargins({left=4,right=4});
    obj.label41:setName("label41");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout18);
    obj.label42:setAlign("left");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setWidth(30);
    obj.label42:setField("atributos.vigor.total");
    obj.label42:setName("label42");

    obj.tab3 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Sentidos");
    obj.tab3:setName("tab3");

    obj.textTotalSentidos = gui.fromHandle(_obj_newObject("label"));
    obj.textTotalSentidos:setParent(obj.tab3);
    obj.textTotalSentidos:setName("textTotalSentidos");
    obj.textTotalSentidos:setLeft(20);
    obj.textTotalSentidos:setTop(10);
    obj.textTotalSentidos:setText("PONTOS: (CORPO * 3) = 0");
    obj.textTotalSentidos:setWidth(180);

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.tab3);
    obj.layout19:setLeft(20);
    obj.layout19:setWidth(300);
    obj.layout19:setHeight(400);
    obj.layout19:setName("layout19");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout19);
    obj.layout20:setTop(40);
    obj.layout20:setHeight(25);
    obj.layout20:setWidth(450);
    obj.layout20:setMargins({left=4,right=4});
    obj.layout20:setName("layout20");

    obj.button13 = gui.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout20);
    obj.button13:setAlign("left");
    obj.button13:setWidth(30);
    obj.button13:setMargins({right=4});
    obj.button13:setHint("Rolagem de Teste de Sentido");
    obj.button13:setName("button13");

    obj.image14 = gui.fromHandle(_obj_newObject("image"));
    obj.image14:setParent(obj.button13);
    obj.image14:setAlign("left");
    obj.image14:setWidth(30);
    obj.image14:setSRC("/src/assets/dice-six-faces.png");
    obj.image14:setName("image14");

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout20);
    obj.label43:setAlign("left");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setText("Sexto Sentido");
    obj.label43:setWidth(85);
    obj.label43:setAutoSize(true);
    obj.label43:setName("label43");

    obj.edit55 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout20);
    obj.edit55:setType("number");
    obj.edit55:setAlign("left");
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setWidth(30);
    obj.edit55:setMargins({left=2, right=2});
    obj.edit55:setField("sentidos.sextoSentido.base");
    obj.edit55:setName("edit55");

    obj.dataLink49 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink49:setParent(obj.layout20);
    obj.dataLink49:setField("sentidos.sextoSentido.base");
    obj.dataLink49:setName("dataLink49");

    obj.edit56 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout20);
    obj.edit56:setType("number");
    obj.edit56:setAlign("left");
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setWidth(30);
    obj.edit56:setMargins({left=2, right=2});
    obj.edit56:setField("sentidos.sextoSentido.racaClasse");
    obj.edit56:setName("edit56");

    obj.dataLink50 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink50:setParent(obj.layout20);
    obj.dataLink50:setField("sentidos.sextoSentido.racaClasse");
    obj.dataLink50:setName("dataLink50");

    obj.edit57 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout20);
    obj.edit57:setType("number");
    obj.edit57:setAlign("left");
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setWidth(30);
    obj.edit57:setMargins({left=2, right=2});
    obj.edit57:setField("sentidos.sextoSentido.treinamento");
    obj.edit57:setName("edit57");

    obj.dataLink51 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink51:setParent(obj.layout20);
    obj.dataLink51:setField("sentidos.sextoSentido.treinamento");
    obj.dataLink51:setName("dataLink51");

    obj.edit58 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout20);
    obj.edit58:setType("number");
    obj.edit58:setAlign("left");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setWidth(30);
    obj.edit58:setMargins({left=2, right=2});
    obj.edit58:setField("sentidos.sextoSentido.habilidade");
    obj.edit58:setName("edit58");

    obj.dataLink52 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink52:setParent(obj.layout20);
    obj.dataLink52:setField("sentidos.sextoSentido.habilidade");
    obj.dataLink52:setName("dataLink52");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout20);
    obj.label44:setAlign("left");
    obj.label44:setText("=");
    obj.label44:setWidth(10);
    obj.label44:setMargins({left=4,right=4});
    obj.label44:setName("label44");

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout20);
    obj.label45:setAlign("left");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setWidth(30);
    obj.label45:setField("sentidos.sextoSentido.total");
    obj.label45:setName("label45");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout19);
    obj.layout21:setTop(70);
    obj.layout21:setHeight(25);
    obj.layout21:setWidth(450);
    obj.layout21:setMargins({left=4,right=4});
    obj.layout21:setName("layout21");

    obj.button14 = gui.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout21);
    obj.button14:setAlign("left");
    obj.button14:setWidth(30);
    obj.button14:setMargins({right=4});
    obj.button14:setHint("Rolagem de Teste de Sentido");
    obj.button14:setName("button14");

    obj.image15 = gui.fromHandle(_obj_newObject("image"));
    obj.image15:setParent(obj.button14);
    obj.image15:setAlign("left");
    obj.image15:setWidth(30);
    obj.image15:setSRC("/src/assets/dice-six-faces.png");
    obj.image15:setName("image15");

    obj.label46 = gui.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout21);
    obj.label46:setAlign("left");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setText("Audição");
    obj.label46:setWidth(85);
    obj.label46:setAutoSize(true);
    obj.label46:setName("label46");

    obj.edit59 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout21);
    obj.edit59:setType("number");
    obj.edit59:setAlign("left");
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setWidth(30);
    obj.edit59:setMargins({left=2, right=2});
    obj.edit59:setField("sentidos.audicao.base");
    obj.edit59:setName("edit59");

    obj.dataLink53 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink53:setParent(obj.layout21);
    obj.dataLink53:setField("sentidos.audicao.base");
    obj.dataLink53:setName("dataLink53");

    obj.edit60 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout21);
    obj.edit60:setType("number");
    obj.edit60:setAlign("left");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setWidth(30);
    obj.edit60:setMargins({left=2, right=2});
    obj.edit60:setField("sentidos.audicao.racaClasse");
    obj.edit60:setName("edit60");

    obj.dataLink54 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink54:setParent(obj.layout21);
    obj.dataLink54:setField("sentidos.audicao.racaClasse");
    obj.dataLink54:setName("dataLink54");

    obj.edit61 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout21);
    obj.edit61:setType("number");
    obj.edit61:setAlign("left");
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setWidth(30);
    obj.edit61:setMargins({left=2, right=2});
    obj.edit61:setField("sentidos.audicao.treinamento");
    obj.edit61:setName("edit61");

    obj.dataLink55 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink55:setParent(obj.layout21);
    obj.dataLink55:setField("sentidos.audicao.treinamento");
    obj.dataLink55:setName("dataLink55");

    obj.edit62 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout21);
    obj.edit62:setType("number");
    obj.edit62:setAlign("left");
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setWidth(30);
    obj.edit62:setMargins({left=2, right=2});
    obj.edit62:setField("sentidos.audicao.habilidade");
    obj.edit62:setName("edit62");

    obj.dataLink56 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink56:setParent(obj.layout21);
    obj.dataLink56:setField("sentidos.audicao.habilidade");
    obj.dataLink56:setName("dataLink56");

    obj.label47 = gui.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout21);
    obj.label47:setAlign("left");
    obj.label47:setText("=");
    obj.label47:setWidth(10);
    obj.label47:setMargins({left=4,right=4});
    obj.label47:setName("label47");

    obj.label48 = gui.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout21);
    obj.label48:setAlign("left");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setWidth(30);
    obj.label48:setField("sentidos.audicao.total");
    obj.label48:setName("label48");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout19);
    obj.layout22:setTop(100);
    obj.layout22:setHeight(25);
    obj.layout22:setWidth(450);
    obj.layout22:setMargins({left=4,right=4});
    obj.layout22:setName("layout22");

    obj.button15 = gui.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout22);
    obj.button15:setAlign("left");
    obj.button15:setWidth(30);
    obj.button15:setMargins({right=4});
    obj.button15:setHint("Rolagem de Teste de Sentido");
    obj.button15:setName("button15");

    obj.image16 = gui.fromHandle(_obj_newObject("image"));
    obj.image16:setParent(obj.button15);
    obj.image16:setAlign("left");
    obj.image16:setWidth(30);
    obj.image16:setSRC("/src/assets/dice-six-faces.png");
    obj.image16:setName("image16");

    obj.label49 = gui.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout22);
    obj.label49:setAlign("left");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setText("Paladar");
    obj.label49:setWidth(85);
    obj.label49:setAutoSize(true);
    obj.label49:setName("label49");

    obj.edit63 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout22);
    obj.edit63:setType("number");
    obj.edit63:setAlign("left");
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setWidth(30);
    obj.edit63:setMargins({left=2, right=2});
    obj.edit63:setField("sentidos.paladar.base");
    obj.edit63:setName("edit63");

    obj.dataLink57 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink57:setParent(obj.layout22);
    obj.dataLink57:setField("sentidos.paladar.base");
    obj.dataLink57:setName("dataLink57");

    obj.edit64 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout22);
    obj.edit64:setType("number");
    obj.edit64:setAlign("left");
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setWidth(30);
    obj.edit64:setMargins({left=2, right=2});
    obj.edit64:setField("sentidos.paladar.racaClasse");
    obj.edit64:setName("edit64");

    obj.dataLink58 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink58:setParent(obj.layout22);
    obj.dataLink58:setField("sentidos.paladar.racaClasse");
    obj.dataLink58:setName("dataLink58");

    obj.edit65 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout22);
    obj.edit65:setType("number");
    obj.edit65:setAlign("left");
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setWidth(30);
    obj.edit65:setMargins({left=2, right=2});
    obj.edit65:setField("sentidos.paladar.treinamento");
    obj.edit65:setName("edit65");

    obj.dataLink59 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink59:setParent(obj.layout22);
    obj.dataLink59:setField("sentidos.paladar.treinamento");
    obj.dataLink59:setName("dataLink59");

    obj.edit66 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout22);
    obj.edit66:setType("number");
    obj.edit66:setAlign("left");
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setWidth(30);
    obj.edit66:setMargins({left=2, right=2});
    obj.edit66:setField("sentidos.paladar.habilidade");
    obj.edit66:setName("edit66");

    obj.dataLink60 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink60:setParent(obj.layout22);
    obj.dataLink60:setField("sentidos.paladar.habilidade");
    obj.dataLink60:setName("dataLink60");

    obj.label50 = gui.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout22);
    obj.label50:setAlign("left");
    obj.label50:setText("=");
    obj.label50:setWidth(10);
    obj.label50:setMargins({left=4,right=4});
    obj.label50:setName("label50");

    obj.label51 = gui.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout22);
    obj.label51:setAlign("left");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setWidth(30);
    obj.label51:setField("sentidos.paladar.total");
    obj.label51:setName("label51");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.tab3);
    obj.layout23:setLeft(320);
    obj.layout23:setWidth(300);
    obj.layout23:setHeight(400);
    obj.layout23:setName("layout23");

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout23);
    obj.layout24:setTop(40);
    obj.layout24:setHeight(25);
    obj.layout24:setWidth(450);
    obj.layout24:setMargins({left=4,right=4});
    obj.layout24:setName("layout24");

    obj.button16 = gui.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout24);
    obj.button16:setAlign("left");
    obj.button16:setWidth(30);
    obj.button16:setMargins({right=4});
    obj.button16:setHint("Rolagem de Teste de Sentido");
    obj.button16:setName("button16");

    obj.image17 = gui.fromHandle(_obj_newObject("image"));
    obj.image17:setParent(obj.button16);
    obj.image17:setAlign("left");
    obj.image17:setWidth(30);
    obj.image17:setSRC("/src/assets/dice-six-faces.png");
    obj.image17:setName("image17");

    obj.label52 = gui.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout24);
    obj.label52:setAlign("left");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setText("Olfato");
    obj.label52:setWidth(85);
    obj.label52:setAutoSize(true);
    obj.label52:setName("label52");

    obj.edit67 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout24);
    obj.edit67:setType("number");
    obj.edit67:setAlign("left");
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setWidth(30);
    obj.edit67:setMargins({left=2, right=2});
    obj.edit67:setField("sentidos.olfato.base");
    obj.edit67:setName("edit67");

    obj.dataLink61 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink61:setParent(obj.layout24);
    obj.dataLink61:setField("sentidos.olfato.base");
    obj.dataLink61:setName("dataLink61");

    obj.edit68 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout24);
    obj.edit68:setType("number");
    obj.edit68:setAlign("left");
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setWidth(30);
    obj.edit68:setMargins({left=2, right=2});
    obj.edit68:setField("sentidos.olfato.racaClasse");
    obj.edit68:setName("edit68");

    obj.dataLink62 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink62:setParent(obj.layout24);
    obj.dataLink62:setField("sentidos.olfato.racaClasse");
    obj.dataLink62:setName("dataLink62");

    obj.edit69 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout24);
    obj.edit69:setType("number");
    obj.edit69:setAlign("left");
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setWidth(30);
    obj.edit69:setMargins({left=2, right=2});
    obj.edit69:setField("sentidos.olfato.treinamento");
    obj.edit69:setName("edit69");

    obj.dataLink63 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink63:setParent(obj.layout24);
    obj.dataLink63:setField("sentidos.olfato.treinamento");
    obj.dataLink63:setName("dataLink63");

    obj.edit70 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout24);
    obj.edit70:setType("number");
    obj.edit70:setAlign("left");
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setWidth(30);
    obj.edit70:setMargins({left=2, right=2});
    obj.edit70:setField("sentidos.olfato.habilidade");
    obj.edit70:setName("edit70");

    obj.dataLink64 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink64:setParent(obj.layout24);
    obj.dataLink64:setField("sentidos.olfato.habilidade");
    obj.dataLink64:setName("dataLink64");

    obj.label53 = gui.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout24);
    obj.label53:setAlign("left");
    obj.label53:setText("=");
    obj.label53:setWidth(10);
    obj.label53:setMargins({left=4,right=4});
    obj.label53:setName("label53");

    obj.label54 = gui.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout24);
    obj.label54:setAlign("left");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setWidth(30);
    obj.label54:setField("sentidos.olfato.total");
    obj.label54:setName("label54");

    obj.layout25 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout23);
    obj.layout25:setTop(70);
    obj.layout25:setHeight(25);
    obj.layout25:setWidth(450);
    obj.layout25:setMargins({left=4,right=4});
    obj.layout25:setName("layout25");

    obj.button17 = gui.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout25);
    obj.button17:setAlign("left");
    obj.button17:setWidth(30);
    obj.button17:setMargins({right=4});
    obj.button17:setHint("Rolagem de Teste de Sentido");
    obj.button17:setName("button17");

    obj.image18 = gui.fromHandle(_obj_newObject("image"));
    obj.image18:setParent(obj.button17);
    obj.image18:setAlign("left");
    obj.image18:setWidth(30);
    obj.image18:setSRC("/src/assets/dice-six-faces.png");
    obj.image18:setName("image18");

    obj.label55 = gui.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout25);
    obj.label55:setAlign("left");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setText("Visão");
    obj.label55:setWidth(85);
    obj.label55:setAutoSize(true);
    obj.label55:setName("label55");

    obj.edit71 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout25);
    obj.edit71:setType("number");
    obj.edit71:setAlign("left");
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setWidth(30);
    obj.edit71:setMargins({left=2, right=2});
    obj.edit71:setField("sentidos.visao.base");
    obj.edit71:setName("edit71");

    obj.dataLink65 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink65:setParent(obj.layout25);
    obj.dataLink65:setField("sentidos.visao.base");
    obj.dataLink65:setName("dataLink65");

    obj.edit72 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout25);
    obj.edit72:setType("number");
    obj.edit72:setAlign("left");
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setWidth(30);
    obj.edit72:setMargins({left=2, right=2});
    obj.edit72:setField("sentidos.visao.racaClasse");
    obj.edit72:setName("edit72");

    obj.dataLink66 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink66:setParent(obj.layout25);
    obj.dataLink66:setField("sentidos.visao.racaClasse");
    obj.dataLink66:setName("dataLink66");

    obj.edit73 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout25);
    obj.edit73:setType("number");
    obj.edit73:setAlign("left");
    obj.edit73:setHorzTextAlign("center");
    obj.edit73:setWidth(30);
    obj.edit73:setMargins({left=2, right=2});
    obj.edit73:setField("sentidos.visao.treinamento");
    obj.edit73:setName("edit73");

    obj.dataLink67 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink67:setParent(obj.layout25);
    obj.dataLink67:setField("sentidos.visao.treinamento");
    obj.dataLink67:setName("dataLink67");

    obj.edit74 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout25);
    obj.edit74:setType("number");
    obj.edit74:setAlign("left");
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setWidth(30);
    obj.edit74:setMargins({left=2, right=2});
    obj.edit74:setField("sentidos.visao.habilidade");
    obj.edit74:setName("edit74");

    obj.dataLink68 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink68:setParent(obj.layout25);
    obj.dataLink68:setField("sentidos.visao.habilidade");
    obj.dataLink68:setName("dataLink68");

    obj.label56 = gui.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout25);
    obj.label56:setAlign("left");
    obj.label56:setText("=");
    obj.label56:setWidth(10);
    obj.label56:setMargins({left=4,right=4});
    obj.label56:setName("label56");

    obj.label57 = gui.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout25);
    obj.label57:setAlign("left");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setWidth(30);
    obj.label57:setField("sentidos.visao.total");
    obj.label57:setName("label57");

    obj.layout26 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout23);
    obj.layout26:setTop(100);
    obj.layout26:setHeight(25);
    obj.layout26:setWidth(450);
    obj.layout26:setMargins({left=4,right=4});
    obj.layout26:setName("layout26");

    obj.button18 = gui.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout26);
    obj.button18:setAlign("left");
    obj.button18:setWidth(30);
    obj.button18:setMargins({right=4});
    obj.button18:setHint("Rolagem de Teste de Sentido");
    obj.button18:setName("button18");

    obj.image19 = gui.fromHandle(_obj_newObject("image"));
    obj.image19:setParent(obj.button18);
    obj.image19:setAlign("left");
    obj.image19:setWidth(30);
    obj.image19:setSRC("/src/assets/dice-six-faces.png");
    obj.image19:setName("image19");

    obj.label58 = gui.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout26);
    obj.label58:setAlign("left");
    obj.label58:setHorzTextAlign("center");
    obj.label58:setText("Tato");
    obj.label58:setWidth(85);
    obj.label58:setAutoSize(true);
    obj.label58:setName("label58");

    obj.edit75 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout26);
    obj.edit75:setType("number");
    obj.edit75:setAlign("left");
    obj.edit75:setHorzTextAlign("center");
    obj.edit75:setWidth(30);
    obj.edit75:setMargins({left=2, right=2});
    obj.edit75:setField("sentidos.tato.base");
    obj.edit75:setName("edit75");

    obj.dataLink69 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink69:setParent(obj.layout26);
    obj.dataLink69:setField("sentidos.tato.base");
    obj.dataLink69:setName("dataLink69");

    obj.edit76 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout26);
    obj.edit76:setType("number");
    obj.edit76:setAlign("left");
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setWidth(30);
    obj.edit76:setMargins({left=2, right=2});
    obj.edit76:setField("sentidos.tato.racaClasse");
    obj.edit76:setName("edit76");

    obj.dataLink70 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink70:setParent(obj.layout26);
    obj.dataLink70:setField("sentidos.tato.racaClasse");
    obj.dataLink70:setName("dataLink70");

    obj.edit77 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout26);
    obj.edit77:setType("number");
    obj.edit77:setAlign("left");
    obj.edit77:setHorzTextAlign("center");
    obj.edit77:setWidth(30);
    obj.edit77:setMargins({left=2, right=2});
    obj.edit77:setField("sentidos.tato.treinamento");
    obj.edit77:setName("edit77");

    obj.dataLink71 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink71:setParent(obj.layout26);
    obj.dataLink71:setField("sentidos.tato.treinamento");
    obj.dataLink71:setName("dataLink71");

    obj.edit78 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout26);
    obj.edit78:setType("number");
    obj.edit78:setAlign("left");
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setWidth(30);
    obj.edit78:setMargins({left=2, right=2});
    obj.edit78:setField("sentidos.tato.habilidade");
    obj.edit78:setName("edit78");

    obj.dataLink72 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink72:setParent(obj.layout26);
    obj.dataLink72:setField("sentidos.tato.habilidade");
    obj.dataLink72:setName("dataLink72");

    obj.label59 = gui.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout26);
    obj.label59:setAlign("left");
    obj.label59:setText("=");
    obj.label59:setWidth(10);
    obj.label59:setMargins({left=4,right=4});
    obj.label59:setName("label59");

    obj.label60 = gui.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout26);
    obj.label60:setAlign("left");
    obj.label60:setHorzTextAlign("center");
    obj.label60:setWidth(30);
    obj.label60:setField("sentidos.tato.total");
    obj.label60:setName("label60");

    obj.tab4 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Perícias");
    obj.tab4:setName("tab4");

    obj.scrollBox2 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.tab4);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.button19 = gui.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.scrollBox2);
    obj.button19:setLeft(20);
    obj.button19:setTop(20);
    obj.button19:setHeight(25);
    obj.button19:setText("Nova Perícia");
    obj.button19:setWidth(100);
    obj.button19:setName("button19");

    obj.layout27 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.scrollBox2);
    obj.layout27:setLeft(55);
    obj.layout27:setTop(45);
    obj.layout27:setWidth(350);
    obj.layout27:setMargins({top=5,bottom=15});
    obj.layout27:setName("layout27");

    obj.label61 = gui.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout27);
    obj.label61:setAlign("left");
    obj.label61:setHorzTextAlign("center");
    obj.label61:setWidth(100);
    obj.label61:setMargins({left=2,right=2});
    obj.label61:setText("GRUPO");
    obj.label61:setName("label61");

    obj.label62 = gui.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout27);
    obj.label62:setAlign("left");
    obj.label62:setHorzTextAlign("center");
    obj.label62:setWidth(100);
    obj.label62:setMargins({left=2,right=2});
    obj.label62:setText("NOME");
    obj.label62:setName("label62");

    obj.label63 = gui.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout27);
    obj.label63:setAlign("left");
    obj.label63:setHorzTextAlign("center");
    obj.label63:setWidth(30);
    obj.label63:setMargins({left=2,right=2});
    obj.label63:setText("B");
    obj.label63:setName("label63");

    obj.label64 = gui.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout27);
    obj.label64:setAlign("left");
    obj.label64:setHorzTextAlign("center");
    obj.label64:setWidth(30);
    obj.label64:setMargins({left=2,right=2});
    obj.label64:setText("R/C");
    obj.label64:setName("label64");

    obj.label65 = gui.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout27);
    obj.label65:setAlign("left");
    obj.label65:setHorzTextAlign("center");
    obj.label65:setWidth(30);
    obj.label65:setMargins({left=2,right=2});
    obj.label65:setText("H");
    obj.label65:setName("label65");

    obj.pericias = gui.fromHandle(_obj_newObject("recordList"));
    obj.pericias:setParent(obj.scrollBox2);
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

    obj.richEdit1 = gui.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.tab5);
    obj.richEdit1:setAlign("client");
    obj.richEdit1:setField("habilidades");
    obj.richEdit1:setName("richEdit1");

    obj.tab6 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Acessórios");
    obj.tab6:setName("tab6");

    obj.richEdit2 = gui.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit2:setParent(obj.tab6);
    obj.richEdit2:setAlign("client");
    obj.richEdit2:setField("acessorios");
    obj.richEdit2:setName("richEdit2");

    obj.tab7 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl1);
    obj.tab7:setTitle("Moedas");
    obj.tab7:setName("tab7");

    obj.richEdit3 = gui.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit3:setParent(obj.tab7);
    obj.richEdit3:setAlign("client");
    obj.richEdit3:setField("moedas");
    obj.richEdit3:setName("richEdit3");

    obj.tab8 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab8:setParent(obj.tabControl1);
    obj.tab8:setTitle("História");
    obj.tab8:setName("tab8");

    obj.richEdit4 = gui.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit4:setParent(obj.tab8);
    obj.richEdit4:setAlign("client");
    obj.richEdit4:setField("historia");
    obj.richEdit4:setName("richEdit4");

    obj.tab9 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab9:setParent(obj.tabControl1);
    obj.tab9:setTitle("Backup");
    obj.tab9:setName("tab9");

    obj.richEdit5 = gui.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit5:setParent(obj.tab9);
    obj.richEdit5:setAlign("client");
    obj.richEdit5:setField("backup");
    obj.richEdit5:setName("richEdit5");

    obj._e_event0 = obj.image1:addEventListener("onStartDrag",
        function (self, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
                      local ficha = ndb.getRoot(sheet);
            
                      mesa.activeChat:rolarDados(
                        "01d20 + " .. sheet.atributos.inteligencia.total,
                        "Teste de Inteligência"
                      )
        end, obj);

    obj._e_event2 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.inteligencia.total = (
                      (sheet.atributos.inteligencia.base or 0) +
                      (sheet.atributos.inteligencia.racaClasse or 0) +
                      (sheet.atributos.inteligencia.treinamento or 0) +
                      (sheet.atributos.inteligencia.habilidade or 0)
                    )
            
                    if "inteligencia" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.inteligencia.total * 3)
                    end
        end, obj);

    obj._e_event3 = obj.dataLink2:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.inteligencia.total = (
                      (sheet.atributos.inteligencia.base or 0) +
                      (sheet.atributos.inteligencia.racaClasse or 0) +
                      (sheet.atributos.inteligencia.treinamento or 0) +
                      (sheet.atributos.inteligencia.habilidade or 0)
                    )
            
                    if "inteligencia" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.inteligencia.total * 3)
                    end
        end, obj);

    obj._e_event4 = obj.dataLink3:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.inteligencia.total = (
                      (sheet.atributos.inteligencia.base or 0) +
                      (sheet.atributos.inteligencia.racaClasse or 0) +
                      (sheet.atributos.inteligencia.treinamento or 0) +
                      (sheet.atributos.inteligencia.habilidade or 0)
                    )
            
                    if "inteligencia" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.inteligencia.total * 3)
                    end
        end, obj);

    obj._e_event5 = obj.dataLink4:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.inteligencia.total = (
                      (sheet.atributos.inteligencia.base or 0) +
                      (sheet.atributos.inteligencia.racaClasse or 0) +
                      (sheet.atributos.inteligencia.treinamento or 0) +
                      (sheet.atributos.inteligencia.habilidade or 0)
                    )
            
                    if "inteligencia" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.inteligencia.total * 3)
                    end
        end, obj);

    obj._e_event6 = obj.button2:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
                      local ficha = ndb.getRoot(sheet);
            
                      mesa.activeChat:rolarDados(
                        "01d20 + " .. sheet.atributos.sabedoria.total,
                        "Teste de Sabedoria"
                      )
        end, obj);

    obj._e_event7 = obj.dataLink5:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.sabedoria.total = (
                      (sheet.atributos.sabedoria.base or 0) +
                      (sheet.atributos.sabedoria.racaClasse or 0) +
                      (sheet.atributos.sabedoria.treinamento or 0) +
                      (sheet.atributos.sabedoria.habilidade or 0)
                    )
            
                    if "sabedoria" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.sabedoria.total * 3)
                    end
        end, obj);

    obj._e_event8 = obj.dataLink6:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.sabedoria.total = (
                      (sheet.atributos.sabedoria.base or 0) +
                      (sheet.atributos.sabedoria.racaClasse or 0) +
                      (sheet.atributos.sabedoria.treinamento or 0) +
                      (sheet.atributos.sabedoria.habilidade or 0)
                    )
            
                    if "sabedoria" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.sabedoria.total * 3)
                    end
        end, obj);

    obj._e_event9 = obj.dataLink7:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.sabedoria.total = (
                      (sheet.atributos.sabedoria.base or 0) +
                      (sheet.atributos.sabedoria.racaClasse or 0) +
                      (sheet.atributos.sabedoria.treinamento or 0) +
                      (sheet.atributos.sabedoria.habilidade or 0)
                    )
            
                    if "sabedoria" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.sabedoria.total * 3)
                    end
        end, obj);

    obj._e_event10 = obj.dataLink8:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.sabedoria.total = (
                      (sheet.atributos.sabedoria.base or 0) +
                      (sheet.atributos.sabedoria.racaClasse or 0) +
                      (sheet.atributos.sabedoria.treinamento or 0) +
                      (sheet.atributos.sabedoria.habilidade or 0)
                    )
            
                    if "sabedoria" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.sabedoria.total * 3)
                    end
        end, obj);

    obj._e_event11 = obj.button3:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
                      local ficha = ndb.getRoot(sheet);
            
                      mesa.activeChat:rolarDados(
                        "01d20 + " .. sheet.atributos.vontade.total,
                        "Teste de Vontade"
                      )
        end, obj);

    obj._e_event12 = obj.dataLink9:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.vontade.total = (
                      (sheet.atributos.vontade.base or 0) +
                      (sheet.atributos.vontade.racaClasse or 0) +
                      (sheet.atributos.vontade.treinamento or 0) +
                      (sheet.atributos.vontade.habilidade or 0)
                    )
            
                    if "vontade" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.vontade.total * 3)
                    end
        end, obj);

    obj._e_event13 = obj.dataLink10:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.vontade.total = (
                      (sheet.atributos.vontade.base or 0) +
                      (sheet.atributos.vontade.racaClasse or 0) +
                      (sheet.atributos.vontade.treinamento or 0) +
                      (sheet.atributos.vontade.habilidade or 0)
                    )
            
                    if "vontade" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.vontade.total * 3)
                    end
        end, obj);

    obj._e_event14 = obj.dataLink11:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.vontade.total = (
                      (sheet.atributos.vontade.base or 0) +
                      (sheet.atributos.vontade.racaClasse or 0) +
                      (sheet.atributos.vontade.treinamento or 0) +
                      (sheet.atributos.vontade.habilidade or 0)
                    )
            
                    if "vontade" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.vontade.total * 3)
                    end
        end, obj);

    obj._e_event15 = obj.dataLink12:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.vontade.total = (
                      (sheet.atributos.vontade.base or 0) +
                      (sheet.atributos.vontade.racaClasse or 0) +
                      (sheet.atributos.vontade.treinamento or 0) +
                      (sheet.atributos.vontade.habilidade or 0)
                    )
            
                    if "vontade" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.vontade.total * 3)
                    end
        end, obj);

    obj._e_event16 = obj.button4:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
                      local ficha = ndb.getRoot(sheet);
            
                      mesa.activeChat:rolarDados(
                        "01d20 + " .. sheet.atributos.carisma.total,
                        "Teste de Carisma"
                      )
        end, obj);

    obj._e_event17 = obj.dataLink13:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.carisma.total = (
                      (sheet.atributos.carisma.base or 0) +
                      (sheet.atributos.carisma.racaClasse or 0) +
                      (sheet.atributos.carisma.treinamento or 0) +
                      (sheet.atributos.carisma.habilidade or 0)
                    )
            
                    if "carisma" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.carisma.total * 3)
                    end
        end, obj);

    obj._e_event18 = obj.dataLink14:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.carisma.total = (
                      (sheet.atributos.carisma.base or 0) +
                      (sheet.atributos.carisma.racaClasse or 0) +
                      (sheet.atributos.carisma.treinamento or 0) +
                      (sheet.atributos.carisma.habilidade or 0)
                    )
            
                    if "carisma" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.carisma.total * 3)
                    end
        end, obj);

    obj._e_event19 = obj.dataLink15:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.carisma.total = (
                      (sheet.atributos.carisma.base or 0) +
                      (sheet.atributos.carisma.racaClasse or 0) +
                      (sheet.atributos.carisma.treinamento or 0) +
                      (sheet.atributos.carisma.habilidade or 0)
                    )
            
                    if "carisma" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.carisma.total * 3)
                    end
        end, obj);

    obj._e_event20 = obj.dataLink16:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.carisma.total = (
                      (sheet.atributos.carisma.base or 0) +
                      (sheet.atributos.carisma.racaClasse or 0) +
                      (sheet.atributos.carisma.treinamento or 0) +
                      (sheet.atributos.carisma.habilidade or 0)
                    )
            
                    if "carisma" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.carisma.total * 3)
                    end
        end, obj);

    obj._e_event21 = obj.button5:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
                      local ficha = ndb.getRoot(sheet);
            
                      mesa.activeChat:rolarDados(
                        "01d20 + " .. sheet.atributos.energia.total,
                        "Teste de Energia"
                      )
        end, obj);

    obj._e_event22 = obj.dataLink17:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.energia.total = (
                      (sheet.atributos.energia.base or 0) +
                      (sheet.atributos.energia.racaClasse or 0) +
                      (sheet.atributos.energia.treinamento or 0) +
                      (sheet.atributos.energia.habilidade or 0)
                    )
            
                    if "energia" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.energia.total * 3)
                    end
        end, obj);

    obj._e_event23 = obj.dataLink18:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.energia.total = (
                      (sheet.atributos.energia.base or 0) +
                      (sheet.atributos.energia.racaClasse or 0) +
                      (sheet.atributos.energia.treinamento or 0) +
                      (sheet.atributos.energia.habilidade or 0)
                    )
            
                    if "energia" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.energia.total * 3)
                    end
        end, obj);

    obj._e_event24 = obj.dataLink19:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.energia.total = (
                      (sheet.atributos.energia.base or 0) +
                      (sheet.atributos.energia.racaClasse or 0) +
                      (sheet.atributos.energia.treinamento or 0) +
                      (sheet.atributos.energia.habilidade or 0)
                    )
            
                    if "energia" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.energia.total * 3)
                    end
        end, obj);

    obj._e_event25 = obj.dataLink20:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.energia.total = (
                      (sheet.atributos.energia.base or 0) +
                      (sheet.atributos.energia.racaClasse or 0) +
                      (sheet.atributos.energia.treinamento or 0) +
                      (sheet.atributos.energia.habilidade or 0)
                    )
            
                    if "energia" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.energia.total * 3)
                    end
        end, obj);

    obj._e_event26 = obj.button6:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
                      local ficha = ndb.getRoot(sheet);
            
                      mesa.activeChat:rolarDados(
                        "01d20 + " .. sheet.atributos.corpo.total,
                        "Teste de Corpo"
                      )
        end, obj);

    obj._e_event27 = obj.dataLink21:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.corpo.total = (
                      (sheet.atributos.corpo.base or 0) +
                      (sheet.atributos.corpo.racaClasse or 0) +
                      (sheet.atributos.corpo.treinamento or 0) +
                      (sheet.atributos.corpo.habilidade or 0)
                    )
            
                    if "corpo" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.corpo.total * 3)
                    end
        end, obj);

    obj._e_event28 = obj.dataLink22:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.corpo.total = (
                      (sheet.atributos.corpo.base or 0) +
                      (sheet.atributos.corpo.racaClasse or 0) +
                      (sheet.atributos.corpo.treinamento or 0) +
                      (sheet.atributos.corpo.habilidade or 0)
                    )
            
                    if "corpo" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.corpo.total * 3)
                    end
        end, obj);

    obj._e_event29 = obj.dataLink23:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.corpo.total = (
                      (sheet.atributos.corpo.base or 0) +
                      (sheet.atributos.corpo.racaClasse or 0) +
                      (sheet.atributos.corpo.treinamento or 0) +
                      (sheet.atributos.corpo.habilidade or 0)
                    )
            
                    if "corpo" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.corpo.total * 3)
                    end
        end, obj);

    obj._e_event30 = obj.dataLink24:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.corpo.total = (
                      (sheet.atributos.corpo.base or 0) +
                      (sheet.atributos.corpo.racaClasse or 0) +
                      (sheet.atributos.corpo.treinamento or 0) +
                      (sheet.atributos.corpo.habilidade or 0)
                    )
            
                    if "corpo" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.corpo.total * 3)
                    end
        end, obj);

    obj._e_event31 = obj.button7:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
                      local ficha = ndb.getRoot(sheet);
            
                      mesa.activeChat:rolarDados(
                        "01d20 + " .. sheet.atributos.resistencia.total,
                        "Teste de Resistência"
                      )
        end, obj);

    obj._e_event32 = obj.dataLink25:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.resistencia.total = (
                      (sheet.atributos.resistencia.base or 0) +
                      (sheet.atributos.resistencia.racaClasse or 0) +
                      (sheet.atributos.resistencia.treinamento or 0) +
                      (sheet.atributos.resistencia.habilidade or 0)
                    )
            
                    if "resistencia" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.resistencia.total * 3)
                    end
        end, obj);

    obj._e_event33 = obj.dataLink26:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.resistencia.total = (
                      (sheet.atributos.resistencia.base or 0) +
                      (sheet.atributos.resistencia.racaClasse or 0) +
                      (sheet.atributos.resistencia.treinamento or 0) +
                      (sheet.atributos.resistencia.habilidade or 0)
                    )
            
                    if "resistencia" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.resistencia.total * 3)
                    end
        end, obj);

    obj._e_event34 = obj.dataLink27:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.resistencia.total = (
                      (sheet.atributos.resistencia.base or 0) +
                      (sheet.atributos.resistencia.racaClasse or 0) +
                      (sheet.atributos.resistencia.treinamento or 0) +
                      (sheet.atributos.resistencia.habilidade or 0)
                    )
            
                    if "resistencia" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.resistencia.total * 3)
                    end
        end, obj);

    obj._e_event35 = obj.dataLink28:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.resistencia.total = (
                      (sheet.atributos.resistencia.base or 0) +
                      (sheet.atributos.resistencia.racaClasse or 0) +
                      (sheet.atributos.resistencia.treinamento or 0) +
                      (sheet.atributos.resistencia.habilidade or 0)
                    )
            
                    if "resistencia" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.resistencia.total * 3)
                    end
        end, obj);

    obj._e_event36 = obj.button8:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
                      local ficha = ndb.getRoot(sheet);
            
                      mesa.activeChat:rolarDados(
                        "01d20 + " .. sheet.atributos.velocidade.total,
                        "Teste de Velocidade"
                      )
        end, obj);

    obj._e_event37 = obj.dataLink29:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.velocidade.total = (
                      (sheet.atributos.velocidade.base or 0) +
                      (sheet.atributos.velocidade.racaClasse or 0) +
                      (sheet.atributos.velocidade.treinamento or 0) +
                      (sheet.atributos.velocidade.habilidade or 0)
                    )
            
                    if "velocidade" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.velocidade.total * 3)
                    end
        end, obj);

    obj._e_event38 = obj.dataLink30:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.velocidade.total = (
                      (sheet.atributos.velocidade.base or 0) +
                      (sheet.atributos.velocidade.racaClasse or 0) +
                      (sheet.atributos.velocidade.treinamento or 0) +
                      (sheet.atributos.velocidade.habilidade or 0)
                    )
            
                    if "velocidade" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.velocidade.total * 3)
                    end
        end, obj);

    obj._e_event39 = obj.dataLink31:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.velocidade.total = (
                      (sheet.atributos.velocidade.base or 0) +
                      (sheet.atributos.velocidade.racaClasse or 0) +
                      (sheet.atributos.velocidade.treinamento or 0) +
                      (sheet.atributos.velocidade.habilidade or 0)
                    )
            
                    if "velocidade" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.velocidade.total * 3)
                    end
        end, obj);

    obj._e_event40 = obj.dataLink32:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.velocidade.total = (
                      (sheet.atributos.velocidade.base or 0) +
                      (sheet.atributos.velocidade.racaClasse or 0) +
                      (sheet.atributos.velocidade.treinamento or 0) +
                      (sheet.atributos.velocidade.habilidade or 0)
                    )
            
                    if "velocidade" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.velocidade.total * 3)
                    end
        end, obj);

    obj._e_event41 = obj.button9:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
                      local ficha = ndb.getRoot(sheet);
            
                      mesa.activeChat:rolarDados(
                        "01d20 + " .. sheet.atributos.agilidade.total,
                        "Teste de Agilidade"
                      )
        end, obj);

    obj._e_event42 = obj.dataLink33:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.agilidade.total = (
                      (sheet.atributos.agilidade.base or 0) +
                      (sheet.atributos.agilidade.racaClasse or 0) +
                      (sheet.atributos.agilidade.treinamento or 0) +
                      (sheet.atributos.agilidade.habilidade or 0)
                    )
            
                    if "agilidade" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.agilidade.total * 3)
                    end
        end, obj);

    obj._e_event43 = obj.dataLink34:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.agilidade.total = (
                      (sheet.atributos.agilidade.base or 0) +
                      (sheet.atributos.agilidade.racaClasse or 0) +
                      (sheet.atributos.agilidade.treinamento or 0) +
                      (sheet.atributos.agilidade.habilidade or 0)
                    )
            
                    if "agilidade" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.agilidade.total * 3)
                    end
        end, obj);

    obj._e_event44 = obj.dataLink35:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.agilidade.total = (
                      (sheet.atributos.agilidade.base or 0) +
                      (sheet.atributos.agilidade.racaClasse or 0) +
                      (sheet.atributos.agilidade.treinamento or 0) +
                      (sheet.atributos.agilidade.habilidade or 0)
                    )
            
                    if "agilidade" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.agilidade.total * 3)
                    end
        end, obj);

    obj._e_event45 = obj.dataLink36:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.agilidade.total = (
                      (sheet.atributos.agilidade.base or 0) +
                      (sheet.atributos.agilidade.racaClasse or 0) +
                      (sheet.atributos.agilidade.treinamento or 0) +
                      (sheet.atributos.agilidade.habilidade or 0)
                    )
            
                    if "agilidade" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.agilidade.total * 3)
                    end
        end, obj);

    obj._e_event46 = obj.button10:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
                      local ficha = ndb.getRoot(sheet);
            
                      mesa.activeChat:rolarDados(
                        "01d20 + " .. sheet.atributos.destreza.total,
                        "Teste de Destreza"
                      )
        end, obj);

    obj._e_event47 = obj.dataLink37:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.destreza.total = (
                      (sheet.atributos.destreza.base or 0) +
                      (sheet.atributos.destreza.racaClasse or 0) +
                      (sheet.atributos.destreza.treinamento or 0) +
                      (sheet.atributos.destreza.habilidade or 0)
                    )
            
                    if "destreza" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.destreza.total * 3)
                    end
        end, obj);

    obj._e_event48 = obj.dataLink38:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.destreza.total = (
                      (sheet.atributos.destreza.base or 0) +
                      (sheet.atributos.destreza.racaClasse or 0) +
                      (sheet.atributos.destreza.treinamento or 0) +
                      (sheet.atributos.destreza.habilidade or 0)
                    )
            
                    if "destreza" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.destreza.total * 3)
                    end
        end, obj);

    obj._e_event49 = obj.dataLink39:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.destreza.total = (
                      (sheet.atributos.destreza.base or 0) +
                      (sheet.atributos.destreza.racaClasse or 0) +
                      (sheet.atributos.destreza.treinamento or 0) +
                      (sheet.atributos.destreza.habilidade or 0)
                    )
            
                    if "destreza" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.destreza.total * 3)
                    end
        end, obj);

    obj._e_event50 = obj.dataLink40:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.destreza.total = (
                      (sheet.atributos.destreza.base or 0) +
                      (sheet.atributos.destreza.racaClasse or 0) +
                      (sheet.atributos.destreza.treinamento or 0) +
                      (sheet.atributos.destreza.habilidade or 0)
                    )
            
                    if "destreza" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.destreza.total * 3)
                    end
        end, obj);

    obj._e_event51 = obj.button11:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
                      local ficha = ndb.getRoot(sheet);
            
                      mesa.activeChat:rolarDados(
                        "01d20 + " .. sheet.atributos.forca.total,
                        "Teste de Força"
                      )
        end, obj);

    obj._e_event52 = obj.dataLink41:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.forca.total = (
                      (sheet.atributos.forca.base or 0) +
                      (sheet.atributos.forca.racaClasse or 0) +
                      (sheet.atributos.forca.treinamento or 0) +
                      (sheet.atributos.forca.habilidade or 0)
                    )
            
                    if "forca" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.forca.total * 3)
                    end
        end, obj);

    obj._e_event53 = obj.dataLink42:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.forca.total = (
                      (sheet.atributos.forca.base or 0) +
                      (sheet.atributos.forca.racaClasse or 0) +
                      (sheet.atributos.forca.treinamento or 0) +
                      (sheet.atributos.forca.habilidade or 0)
                    )
            
                    if "forca" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.forca.total * 3)
                    end
        end, obj);

    obj._e_event54 = obj.dataLink43:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.forca.total = (
                      (sheet.atributos.forca.base or 0) +
                      (sheet.atributos.forca.racaClasse or 0) +
                      (sheet.atributos.forca.treinamento or 0) +
                      (sheet.atributos.forca.habilidade or 0)
                    )
            
                    if "forca" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.forca.total * 3)
                    end
        end, obj);

    obj._e_event55 = obj.dataLink44:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.forca.total = (
                      (sheet.atributos.forca.base or 0) +
                      (sheet.atributos.forca.racaClasse or 0) +
                      (sheet.atributos.forca.treinamento or 0) +
                      (sheet.atributos.forca.habilidade or 0)
                    )
            
                    if "forca" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.forca.total * 3)
                    end
        end, obj);

    obj._e_event56 = obj.button12:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
                      local ficha = ndb.getRoot(sheet);
            
                      mesa.activeChat:rolarDados(
                        "01d20 + " .. sheet.atributos.vigor.total,
                        "Teste de Vigor"
                      )
        end, obj);

    obj._e_event57 = obj.dataLink45:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.vigor.total = (
                      (sheet.atributos.vigor.base or 0) +
                      (sheet.atributos.vigor.racaClasse or 0) +
                      (sheet.atributos.vigor.treinamento or 0) +
                      (sheet.atributos.vigor.habilidade or 0)
                    )
            
                    if "vigor" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.vigor.total * 3)
                    end
        end, obj);

    obj._e_event58 = obj.dataLink46:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.vigor.total = (
                      (sheet.atributos.vigor.base or 0) +
                      (sheet.atributos.vigor.racaClasse or 0) +
                      (sheet.atributos.vigor.treinamento or 0) +
                      (sheet.atributos.vigor.habilidade or 0)
                    )
            
                    if "vigor" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.vigor.total * 3)
                    end
        end, obj);

    obj._e_event59 = obj.dataLink47:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.vigor.total = (
                      (sheet.atributos.vigor.base or 0) +
                      (sheet.atributos.vigor.racaClasse or 0) +
                      (sheet.atributos.vigor.treinamento or 0) +
                      (sheet.atributos.vigor.habilidade or 0)
                    )
            
                    if "vigor" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.vigor.total * 3)
                    end
        end, obj);

    obj._e_event60 = obj.dataLink48:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.atributos.vigor.total = (
                      (sheet.atributos.vigor.base or 0) +
                      (sheet.atributos.vigor.racaClasse or 0) +
                      (sheet.atributos.vigor.treinamento or 0) +
                      (sheet.atributos.vigor.habilidade or 0)
                    )
            
                    if "vigor" == "corpo" then
                      self.textTotalSentidos.text = "PONTOS: (CORPO * 3) = " .. (sheet.atributos.vigor.total * 3)
                    end
        end, obj);

    obj._e_event61 = obj.button13:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
                      local ficha = ndb.getRoot(sheet);
            
                      mesa.activeChat:rolarDados(
                        "01d20 + " .. sheet.sentidos.sextoSentido.total,
                        "Teste de Sexto Sentido"
                      )
        end, obj);

    obj._e_event62 = obj.dataLink49:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.sentidos.sextoSentido = sheet.sentidos.sextoSentido or {}
                    sheet.sentidos.sextoSentido.total = (
                      (sheet.sentidos.sextoSentido.base or 0) +
                      (sheet.sentidos.sextoSentido.racaClasse or 0) +
                      (sheet.sentidos.sextoSentido.treinamento or 0) +
                      (sheet.sentidos.sextoSentido.habilidade or 0)
                    )
        end, obj);

    obj._e_event63 = obj.dataLink50:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.sentidos.sextoSentido = sheet.sentidos.sextoSentido or {}
                    sheet.sentidos.sextoSentido.total = (
                      (sheet.sentidos.sextoSentido.base or 0) +
                      (sheet.sentidos.sextoSentido.racaClasse or 0) +
                      (sheet.sentidos.sextoSentido.treinamento or 0) +
                      (sheet.sentidos.sextoSentido.habilidade or 0)
                    )
        end, obj);

    obj._e_event64 = obj.dataLink51:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.sentidos.sextoSentido = sheet.sentidos.sextoSentido or {}
                    sheet.sentidos.sextoSentido.total = (
                      (sheet.sentidos.sextoSentido.base or 0) +
                      (sheet.sentidos.sextoSentido.racaClasse or 0) +
                      (sheet.sentidos.sextoSentido.treinamento or 0) +
                      (sheet.sentidos.sextoSentido.habilidade or 0)
                    )
        end, obj);

    obj._e_event65 = obj.dataLink52:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.sentidos.sextoSentido = sheet.sentidos.sextoSentido or {}
                    sheet.sentidos.sextoSentido.total = (
                      (sheet.sentidos.sextoSentido.base or 0) +
                      (sheet.sentidos.sextoSentido.racaClasse or 0) +
                      (sheet.sentidos.sextoSentido.treinamento or 0) +
                      (sheet.sentidos.sextoSentido.habilidade or 0)
                    )
        end, obj);

    obj._e_event66 = obj.button14:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
                      local ficha = ndb.getRoot(sheet);
            
                      mesa.activeChat:rolarDados(
                        "01d20 + " .. sheet.sentidos.audicao.total,
                        "Teste de Audição"
                      )
        end, obj);

    obj._e_event67 = obj.dataLink53:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.sentidos.audicao = sheet.sentidos.audicao or {}
                    sheet.sentidos.audicao.total = (
                      (sheet.sentidos.audicao.base or 0) +
                      (sheet.sentidos.audicao.racaClasse or 0) +
                      (sheet.sentidos.audicao.treinamento or 0) +
                      (sheet.sentidos.audicao.habilidade or 0)
                    )
        end, obj);

    obj._e_event68 = obj.dataLink54:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.sentidos.audicao = sheet.sentidos.audicao or {}
                    sheet.sentidos.audicao.total = (
                      (sheet.sentidos.audicao.base or 0) +
                      (sheet.sentidos.audicao.racaClasse or 0) +
                      (sheet.sentidos.audicao.treinamento or 0) +
                      (sheet.sentidos.audicao.habilidade or 0)
                    )
        end, obj);

    obj._e_event69 = obj.dataLink55:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.sentidos.audicao = sheet.sentidos.audicao or {}
                    sheet.sentidos.audicao.total = (
                      (sheet.sentidos.audicao.base or 0) +
                      (sheet.sentidos.audicao.racaClasse or 0) +
                      (sheet.sentidos.audicao.treinamento or 0) +
                      (sheet.sentidos.audicao.habilidade or 0)
                    )
        end, obj);

    obj._e_event70 = obj.dataLink56:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.sentidos.audicao = sheet.sentidos.audicao or {}
                    sheet.sentidos.audicao.total = (
                      (sheet.sentidos.audicao.base or 0) +
                      (sheet.sentidos.audicao.racaClasse or 0) +
                      (sheet.sentidos.audicao.treinamento or 0) +
                      (sheet.sentidos.audicao.habilidade or 0)
                    )
        end, obj);

    obj._e_event71 = obj.button15:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
                      local ficha = ndb.getRoot(sheet);
            
                      mesa.activeChat:rolarDados(
                        "01d20 + " .. sheet.sentidos.paladar.total,
                        "Teste de Paladar"
                      )
        end, obj);

    obj._e_event72 = obj.dataLink57:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.sentidos.paladar = sheet.sentidos.paladar or {}
                    sheet.sentidos.paladar.total = (
                      (sheet.sentidos.paladar.base or 0) +
                      (sheet.sentidos.paladar.racaClasse or 0) +
                      (sheet.sentidos.paladar.treinamento or 0) +
                      (sheet.sentidos.paladar.habilidade or 0)
                    )
        end, obj);

    obj._e_event73 = obj.dataLink58:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.sentidos.paladar = sheet.sentidos.paladar or {}
                    sheet.sentidos.paladar.total = (
                      (sheet.sentidos.paladar.base or 0) +
                      (sheet.sentidos.paladar.racaClasse or 0) +
                      (sheet.sentidos.paladar.treinamento or 0) +
                      (sheet.sentidos.paladar.habilidade or 0)
                    )
        end, obj);

    obj._e_event74 = obj.dataLink59:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.sentidos.paladar = sheet.sentidos.paladar or {}
                    sheet.sentidos.paladar.total = (
                      (sheet.sentidos.paladar.base or 0) +
                      (sheet.sentidos.paladar.racaClasse or 0) +
                      (sheet.sentidos.paladar.treinamento or 0) +
                      (sheet.sentidos.paladar.habilidade or 0)
                    )
        end, obj);

    obj._e_event75 = obj.dataLink60:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.sentidos.paladar = sheet.sentidos.paladar or {}
                    sheet.sentidos.paladar.total = (
                      (sheet.sentidos.paladar.base or 0) +
                      (sheet.sentidos.paladar.racaClasse or 0) +
                      (sheet.sentidos.paladar.treinamento or 0) +
                      (sheet.sentidos.paladar.habilidade or 0)
                    )
        end, obj);

    obj._e_event76 = obj.button16:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
                      local ficha = ndb.getRoot(sheet);
            
                      mesa.activeChat:rolarDados(
                        "01d20 + " .. sheet.sentidos.olfato.total,
                        "Teste de Olfato"
                      )
        end, obj);

    obj._e_event77 = obj.dataLink61:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.sentidos.olfato = sheet.sentidos.olfato or {}
                    sheet.sentidos.olfato.total = (
                      (sheet.sentidos.olfato.base or 0) +
                      (sheet.sentidos.olfato.racaClasse or 0) +
                      (sheet.sentidos.olfato.treinamento or 0) +
                      (sheet.sentidos.olfato.habilidade or 0)
                    )
        end, obj);

    obj._e_event78 = obj.dataLink62:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.sentidos.olfato = sheet.sentidos.olfato or {}
                    sheet.sentidos.olfato.total = (
                      (sheet.sentidos.olfato.base or 0) +
                      (sheet.sentidos.olfato.racaClasse or 0) +
                      (sheet.sentidos.olfato.treinamento or 0) +
                      (sheet.sentidos.olfato.habilidade or 0)
                    )
        end, obj);

    obj._e_event79 = obj.dataLink63:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.sentidos.olfato = sheet.sentidos.olfato or {}
                    sheet.sentidos.olfato.total = (
                      (sheet.sentidos.olfato.base or 0) +
                      (sheet.sentidos.olfato.racaClasse or 0) +
                      (sheet.sentidos.olfato.treinamento or 0) +
                      (sheet.sentidos.olfato.habilidade or 0)
                    )
        end, obj);

    obj._e_event80 = obj.dataLink64:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.sentidos.olfato = sheet.sentidos.olfato or {}
                    sheet.sentidos.olfato.total = (
                      (sheet.sentidos.olfato.base or 0) +
                      (sheet.sentidos.olfato.racaClasse or 0) +
                      (sheet.sentidos.olfato.treinamento or 0) +
                      (sheet.sentidos.olfato.habilidade or 0)
                    )
        end, obj);

    obj._e_event81 = obj.button17:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
                      local ficha = ndb.getRoot(sheet);
            
                      mesa.activeChat:rolarDados(
                        "01d20 + " .. sheet.sentidos.visao.total,
                        "Teste de Visão"
                      )
        end, obj);

    obj._e_event82 = obj.dataLink65:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.sentidos.visao = sheet.sentidos.visao or {}
                    sheet.sentidos.visao.total = (
                      (sheet.sentidos.visao.base or 0) +
                      (sheet.sentidos.visao.racaClasse or 0) +
                      (sheet.sentidos.visao.treinamento or 0) +
                      (sheet.sentidos.visao.habilidade or 0)
                    )
        end, obj);

    obj._e_event83 = obj.dataLink66:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.sentidos.visao = sheet.sentidos.visao or {}
                    sheet.sentidos.visao.total = (
                      (sheet.sentidos.visao.base or 0) +
                      (sheet.sentidos.visao.racaClasse or 0) +
                      (sheet.sentidos.visao.treinamento or 0) +
                      (sheet.sentidos.visao.habilidade or 0)
                    )
        end, obj);

    obj._e_event84 = obj.dataLink67:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.sentidos.visao = sheet.sentidos.visao or {}
                    sheet.sentidos.visao.total = (
                      (sheet.sentidos.visao.base or 0) +
                      (sheet.sentidos.visao.racaClasse or 0) +
                      (sheet.sentidos.visao.treinamento or 0) +
                      (sheet.sentidos.visao.habilidade or 0)
                    )
        end, obj);

    obj._e_event85 = obj.dataLink68:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.sentidos.visao = sheet.sentidos.visao or {}
                    sheet.sentidos.visao.total = (
                      (sheet.sentidos.visao.base or 0) +
                      (sheet.sentidos.visao.racaClasse or 0) +
                      (sheet.sentidos.visao.treinamento or 0) +
                      (sheet.sentidos.visao.habilidade or 0)
                    )
        end, obj);

    obj._e_event86 = obj.button18:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
                      local ficha = ndb.getRoot(sheet);
            
                      mesa.activeChat:rolarDados(
                        "01d20 + " .. sheet.sentidos.tato.total,
                        "Teste de Tato"
                      )
        end, obj);

    obj._e_event87 = obj.dataLink69:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.sentidos.tato = sheet.sentidos.tato or {}
                    sheet.sentidos.tato.total = (
                      (sheet.sentidos.tato.base or 0) +
                      (sheet.sentidos.tato.racaClasse or 0) +
                      (sheet.sentidos.tato.treinamento or 0) +
                      (sheet.sentidos.tato.habilidade or 0)
                    )
        end, obj);

    obj._e_event88 = obj.dataLink70:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.sentidos.tato = sheet.sentidos.tato or {}
                    sheet.sentidos.tato.total = (
                      (sheet.sentidos.tato.base or 0) +
                      (sheet.sentidos.tato.racaClasse or 0) +
                      (sheet.sentidos.tato.treinamento or 0) +
                      (sheet.sentidos.tato.habilidade or 0)
                    )
        end, obj);

    obj._e_event89 = obj.dataLink71:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.sentidos.tato = sheet.sentidos.tato or {}
                    sheet.sentidos.tato.total = (
                      (sheet.sentidos.tato.base or 0) +
                      (sheet.sentidos.tato.racaClasse or 0) +
                      (sheet.sentidos.tato.treinamento or 0) +
                      (sheet.sentidos.tato.habilidade or 0)
                    )
        end, obj);

    obj._e_event90 = obj.dataLink72:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.sentidos.tato = sheet.sentidos.tato or {}
                    sheet.sentidos.tato.total = (
                      (sheet.sentidos.tato.base or 0) +
                      (sheet.sentidos.tato.racaClasse or 0) +
                      (sheet.sentidos.tato.treinamento or 0) +
                      (sheet.sentidos.tato.habilidade or 0)
                    )
        end, obj);

    obj._e_event91 = obj.button19:addEventListener("onClick",
        function (self)
            self.pericias:append()
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event91);
        __o_rrpgObjs.removeEventListenerById(self._e_event90);
        __o_rrpgObjs.removeEventListenerById(self._e_event89);
        __o_rrpgObjs.removeEventListenerById(self._e_event88);
        __o_rrpgObjs.removeEventListenerById(self._e_event87);
        __o_rrpgObjs.removeEventListenerById(self._e_event86);
        __o_rrpgObjs.removeEventListenerById(self._e_event85);
        __o_rrpgObjs.removeEventListenerById(self._e_event84);
        __o_rrpgObjs.removeEventListenerById(self._e_event83);
        __o_rrpgObjs.removeEventListenerById(self._e_event82);
        __o_rrpgObjs.removeEventListenerById(self._e_event81);
        __o_rrpgObjs.removeEventListenerById(self._e_event80);
        __o_rrpgObjs.removeEventListenerById(self._e_event79);
        __o_rrpgObjs.removeEventListenerById(self._e_event78);
        __o_rrpgObjs.removeEventListenerById(self._e_event77);
        __o_rrpgObjs.removeEventListenerById(self._e_event76);
        __o_rrpgObjs.removeEventListenerById(self._e_event75);
        __o_rrpgObjs.removeEventListenerById(self._e_event74);
        __o_rrpgObjs.removeEventListenerById(self._e_event73);
        __o_rrpgObjs.removeEventListenerById(self._e_event72);
        __o_rrpgObjs.removeEventListenerById(self._e_event71);
        __o_rrpgObjs.removeEventListenerById(self._e_event70);
        __o_rrpgObjs.removeEventListenerById(self._e_event69);
        __o_rrpgObjs.removeEventListenerById(self._e_event68);
        __o_rrpgObjs.removeEventListenerById(self._e_event67);
        __o_rrpgObjs.removeEventListenerById(self._e_event66);
        __o_rrpgObjs.removeEventListenerById(self._e_event65);
        __o_rrpgObjs.removeEventListenerById(self._e_event64);
        __o_rrpgObjs.removeEventListenerById(self._e_event63);
        __o_rrpgObjs.removeEventListenerById(self._e_event62);
        __o_rrpgObjs.removeEventListenerById(self._e_event61);
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
        if self.dataLink71 ~= nil then self.dataLink71:destroy(); self.dataLink71 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.dataLink62 ~= nil then self.dataLink62:destroy(); self.dataLink62 = nil; end;
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
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.dataLink68 ~= nil then self.dataLink68:destroy(); self.dataLink68 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.dataLink53 ~= nil then self.dataLink53:destroy(); self.dataLink53 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.dataLink63 ~= nil then self.dataLink63:destroy(); self.dataLink63 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink72 ~= nil then self.dataLink72:destroy(); self.dataLink72 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.tab9 ~= nil then self.tab9:destroy(); self.tab9 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.dataLink49 ~= nil then self.dataLink49:destroy(); self.dataLink49 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
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
        if self.dataLink56 ~= nil then self.dataLink56:destroy(); self.dataLink56 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.image18 ~= nil then self.image18:destroy(); self.image18 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.dataLink58 ~= nil then self.dataLink58:destroy(); self.dataLink58 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.image19 ~= nil then self.image19:destroy(); self.image19 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.dataLink55 ~= nil then self.dataLink55:destroy(); self.dataLink55 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.image14 ~= nil then self.image14:destroy(); self.image14 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.dataLink59 ~= nil then self.dataLink59:destroy(); self.dataLink59 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.richEdit4 ~= nil then self.richEdit4:destroy(); self.richEdit4 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.dataLink65 ~= nil then self.dataLink65:destroy(); self.dataLink65 = nil; end;
        if self.pericias ~= nil then self.pericias:destroy(); self.pericias = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.dataLink60 ~= nil then self.dataLink60:destroy(); self.dataLink60 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.image16 ~= nil then self.image16:destroy(); self.image16 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.dataLink64 ~= nil then self.dataLink64:destroy(); self.dataLink64 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.dataLink54 ~= nil then self.dataLink54:destroy(); self.dataLink54 = nil; end;
        if self.dataLink66 ~= nil then self.dataLink66:destroy(); self.dataLink66 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.dataLink69 ~= nil then self.dataLink69:destroy(); self.dataLink69 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.dataLink52 ~= nil then self.dataLink52:destroy(); self.dataLink52 = nil; end;
        if self.dataLink70 ~= nil then self.dataLink70:destroy(); self.dataLink70 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.dataLink61 ~= nil then self.dataLink61:destroy(); self.dataLink61 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.image17 ~= nil then self.image17:destroy(); self.image17 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.dataLink67 ~= nil then self.dataLink67:destroy(); self.dataLink67 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.dataLink57 ~= nil then self.dataLink57:destroy(); self.dataLink57 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.dataLink51 ~= nil then self.dataLink51:destroy(); self.dataLink51 = nil; end;
        if self.image15 ~= nil then self.image15:destroy(); self.image15 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.richEdit5 ~= nil then self.richEdit5:destroy(); self.richEdit5 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.dataLink50 ~= nil then self.dataLink50:destroy(); self.dataLink50 = nil; end;
        if self.textTotalSentidos ~= nil then self.textTotalSentidos:destroy(); self.textTotalSentidos = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
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
    title = "Ficha do Personagem - GTK (v0.5.3)", 
    description=""};

frmFichaDoPersonagem = _frmFichaDoPersonagem;
rrpg.registrarForm(_frmFichaDoPersonagem);
rrpg.registrarDataType(_frmFichaDoPersonagem);

return _frmFichaDoPersonagem;
