import funkin.editors.EditorPicker;
import flixel.text.FlxTextBorderStyle;

var peeps = ['clown', 'john doe', 'scarey', 'obama', 'scary2', 'err', 'scpguy','zasjwl909','inakuro'];
var users = ['sigma','john doe','sigma','janc_k','sigma','hotline','ROBLOX34', 'zasjwl909','inakuro'];
var songs = ['John','666'];
var random:Float =  FlxG.random.float(0, 1);
var noob:FlxSprite;
var Hitbox,Hitbox2,Hitbox3,Hitbox4,Hitbox5,Hitbox6,HitboxSong1,HitboxSong2,icon:FlxSprite;
var peoples:FlxSpriteGroup;
var users2:FlxSpriteGroup;
var scrollSpeed:Float = 5.0;
var minX:Float = -500;
var maxX:Float = -500 + (140 * (peeps.length - 1));
var isDragging:Bool = false;
var lastMouseX:Float = 0;
var userText:FlxText;

function create() {
    peoples = new FlxSpriteGroup();
    users2 = new FlxSpriteGroup();

    bg = new FlxSprite().loadGraphic(Paths.image('menus/main/bg'));
    bg.antialiasing = true;
    bg.screenCenter();
    add(bg);

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
        add(peoples);
        peoples.add(pep);

        userText = new FlxText(pep.x + 600, 440);
        userText.setFormat(Paths.font("RBFONT.ttf"), 14, FlxColor.WHITE, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, "center");
        userText.borderSize = 2;
        userText.text = users[i];
        add(users2);
        users2.add(userText);
    }

    Friend = new FlxText(70, 280);
    Friend.setFormat(Paths.font("RBFONT.ttf"), 24, FlxColor.WHITE, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, "center");
    Friend.borderSize = 3;
    add(Friend);
    Friend.text = "Friends (" + peeps.length + ")";

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

    Hitbox5 = new FlxSprite(100,320);
    Hitbox5.makeGraphic(1200, 150, 0xFFFF0000);
    Hitbox5.scrollFactor;
    Hitbox5.visible = false;
    add(Hitbox5);

    icon = new FlxSprite(-100,0).loadGraphic(Paths.image('menus/main/icon'));
    icon.antialiasing = true;
    add(icon);

    Hitbox6 = new FlxSprite();
    Hitbox6.makeGraphic(70, 70, 0xFFFF0000);
    Hitbox6.scrollFactor;
    Hitbox6.visible = false;
    add(Hitbox6);

    random = new FlxSprite(-300,0).loadGraphic(Paths.image('menus/main/random'));
    random.antialiasing = true;
    add(random);

    Experiences = new FlxText(70, 470);
    Experiences.setFormat(Paths.font("RBFONT.ttf"), 24, FlxColor.WHITE, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, "center");
    Experiences.borderSize = 3;
    add(Experiences);
    Experiences.antialiasing = true;
    Experiences.text = "Experiences";
    
    for (i in 0...songs.length) {
        SongImage = new FlxSprite(-430 + (200 * i), -40).loadGraphic(Paths.image('menus/main/songshit/' + songs[i]));
        SongImage.scale.set(.15, .15);
        SongImage.ID = i;
        add(SongImage);
    }
    HitboxSong1 = new FlxSprite(125,510);
    HitboxSong1.makeGraphic(170, 170, 0xFFFF0000);
    HitboxSong1.scrollFactor;
    HitboxSong1.visible = false;
    add(HitboxSong1);

    HitboxSong2 = new FlxSprite(330,510);
    HitboxSong2.makeGraphic(170, 170, 0xFFFF0000);
    HitboxSong2.scrollFactor;
    HitboxSong2.visible = false;
    add(HitboxSong2);

}
function update(elapsed:Float) {
    var isOverPep:Bool = false;

    if (FlxG.mouse.overlaps(Hitbox5)) {
        isOverPep = true;
    }

    if (FlxG.mouse.pressed && isOverPep) {
        if (!isDragging) {
            isDragging = true;
            lastMouseX = FlxG.mouse.screenX;
        } else {
            // Calculate how much the mouse moved
            var deltaX = FlxG.mouse.screenX - lastMouseX;
            lastMouseX = FlxG.mouse.screenX;

            // Move the group by the delta
            peoples.x += deltaX;
            users2.x += deltaX;
        }
    } else {
        isDragging = false;
        for (i in 0...peeps.length) {
            peoples.setPosition(-1100 + (140 * i), 0);
        }
        users2.setPosition(pep.x - 610, 0);
    }
    if (FlxG.keys.justPressed.SEVEN) {
		openSubState(new EditorPicker());
		persistentUpdate = false;
		persistentDraw = true;
	}
    // Handle other interactions (Hitbox color changes)
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
    if (FlxG.mouse.overlaps(Hitbox6)){
        icon.color = 0xFF3A3A3A;
    }else {
        icon.color = 0xFFFFFFFF;
    }
    if ((FlxG.mouse.justPressed && FlxG.mouse.overlaps(HitboxSong1))) gong();
}
function gong(){
    camera.fade(FlxColor.BLACK, 0.4); // just use fade bruh
	PlayState.loadSong("i-here", 'hard');
	new FlxTimer().start(1, function(tmr:FlxTimer) {
		FlxG.switchState(new PlayState());
	});
}