import flixel.effects.FlxFlicker;
import flixel.text.FlxTextBorderStyle;

var fire,logo:FlxSprite;
var words:FlxText;
var spam:Bool = false;

function create(){
    fire = new FlxSprite(500, 200);
	fire.frames = Paths.getSparrowAtlas('menus/title/fireparticles');
	fire.animation.addByPrefix('idle', "burn", 30);
	fire.antialiasing = true;
	fire.animation.play('idle');
	fire.updateHitbox();
    fire.scale.set(5,2.5);
	add(fire);

	logo = new FlxSprite().loadGraphic(Paths.image('menus/title/logo'));
	logo.antialiasing = true;
	logo.screenCenter();
	logo.updateHitbox();
    logo.scale.set(.6,.6);
	add(logo);
	FlxTween.tween(logo, {y: -40,angle: -4}, 3, {ease: FlxEase.quadInOut, type: 4});

    lyrics = new FlxText(300,500);
    lyrics.setFormat(Paths.font("RBFONT.ttf"), 48, 0x816343 ,FlxTextBorderStyle.OUTLINE, FlxColor.BLACK , "center");
    lyrics.borderSize = 3;
    add(lyrics);
    FlxTween.tween(lyrics, {y: 430,angle: 4}, 3, {ease: FlxEase.quadInOut, type: 4});
    lyrics.text = "PRESS ENTER TO BEGIN.";
}
function update(){
	if (controls.ACCEPT && !spam){
		lyrics.color = FlxColor.WHITE;
		spam = true;
		FlxFlicker.flicker(lyrics, 1.4, 0.06, false, false, function(flick:FlxFlicker){});
		new FlxTimer().start(.5, function(tmr:FlxTimer) {
			FlxTween.tween(FlxG.camera, {y: 740}, 1, {ease: FlxEase.quadInOut});
		});
		new FlxTimer().start(2, function(tmr:FlxTimer) {
			FlxG.switchState(new MainMenuState());
		});
	}
}