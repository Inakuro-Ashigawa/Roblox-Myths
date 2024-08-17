import flixel.text.FlxTextBorderStyle;

var peeps = ['clown', 'john doe', 'scarey', 'obama', 'scary2', 'err', 'scpguy','zasjwl909','inakuro'];
var users = ['sigma','john doe','sigma','janc_k','sigma','hotline','ROBLOX34', 'zasjwl909','inakuro'];
var random:Float =  FlxG.random.float(0, 1);
var noob:FlxSprite;
var Hitbox,Hitbox2,Hitbox3,Hitbox4:FlxSprite;

function create() {
    bg = new FlxSprite().loadGraphic(Paths.image('menus/main/bg'));
    bg.antialiasing = true;
    bg.screenCenter();
    add(bg);

    bg2 = new FlxSprite().loadGraphic(Paths.image('menus/main/topbar'));
    add(bg2);

    games = new FlxSprite(-100,0).loadGraphic(Paths.image('menus/main/games'));
    games.antialiasing = true;
    add(games);

    Hitbox = new FlxSprite(60,0);
    Hitbox.makeGraphic(140, 70, 0xFFFF0000);
    Hitbox.scrollFactor;
    Hitbox.visible = false;
    add(Hitbox);

    shop = new FlxSprite(-70,0).loadGraphic(Paths.image('menus/main/shop'));
    shop.antialiasing = true;
    add(shop);

    Hitbox2 = new FlxSprite(290,0);
    Hitbox2.makeGraphic(140, 70, 0xFFFF0000);
    Hitbox2.scrollFactor;
    Hitbox2.visible = false;
    add(Hitbox2);
  
    create = new FlxSprite(-40,0).loadGraphic(Paths.image('menus/main/create'));
    create.antialiasing = true;
    add(create);

    Hitbox3 = new FlxSprite(500,0);
    Hitbox3.makeGraphic(140, 70, 0xFFFF0000);
    Hitbox3.scrollFactor;
    Hitbox3.visible = false;
    add(Hitbox3);

    trade = new FlxSprite(-30,0).loadGraphic(Paths.image('menus/main/trade'));
    trade.antialiasing = true;
    add(trade);

    Hitbox4 = new FlxSprite(650,0);
    Hitbox4.makeGraphic(140, 70, 0xFFFF0000);
    Hitbox4.scrollFactor;
    Hitbox4.visible = false;
    add(Hitbox4);

    if (random < 0.01){
        //scary
        noob = new FlxSprite(-500, -460).loadGraphic(Paths.image('menus/main/noob-scary1'));
        noob.scale.set(.15, .15);
        add(noob);
    }else{
        //normal
        noob = new FlxSprite(-500, -460).loadGraphic(Paths.image('menus/main/noob'));
        noob.scale.set(.15, .15);
        add(noob);
    }

    for (i in 0...peeps.length) {
        pep = new FlxSprite(-500 + (140 * i), -260).loadGraphic(Paths.image('menus/main/' + peeps[i]));
        pep.scale.set(.08, .08);
        add(pep);

        var userText = new FlxText(pep.x + 600, 440);
        userText.setFormat(Paths.font("RBFONT.ttf"), 14, FlxColor.WHITE, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, "center");
        userText.borderSize = 2;
        userText.text = users[i];
        add(userText);
    }

    Friend = new FlxText(70, 280);
    Friend.setFormat(Paths.font("RBFONT.ttf"), 24, FlxColor.WHITE, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, "center");
    Friend.borderSize = 3;
    add(Friend);
    Friend.text = "Friends (" + peeps.length + ")";
}
function update(elapsed){
    if (FlxG.mouse.overlaps(Hitbox)) {
        games.color = FlxColor.BLUE;
    } else {
        games.color = FlxColor.WHITE;
    }
    if (FlxG.mouse.overlaps(Hitbox2)) {
        shop.color = FlxColor.BLUE;
    } else {
        shop.color = FlxColor.WHITE;
    }
    if (FlxG.mouse.overlaps(Hitbox3)) {
        create.color = FlxColor.BLUE;
    } else {
        create.color = FlxColor.WHITE;
    }
    if (FlxG.mouse.overlaps(Hitbox4)) {
        trade.color = FlxColor.BLUE;
    } else {
        trade.color = FlxColor.WHITE;
    }
}
function mouseOverlapStuffs(){
}