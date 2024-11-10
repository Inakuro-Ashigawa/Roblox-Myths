var vhs = new CustomShader('crt');
var monitor = new CustomShader('monitor');

function create(){
    FlxG.camera.addShader(vhs);
    //FlxG.camera.addShader(monitor);
}
var shits = 0;
function update(elapsed){
    shits += elapsed;
    vhs.data.time.value = [shits,shits];
}
function postCreate(){
    for (i in [iconP1,iconP2,healthBar,healthBarBG,missesTxt, accuracyTxt, scoreTxt]) {
        i.visible = false;
    }
}
function onNoteCreation(event) {
	event.cancel();

	var note = event.note;
	if (event.note.isSustainNote) {
		note.loadGraphic(Paths.image('notes/pixel/shitno_ends1'), true, 7, 6);
		note.animation.add("hold", [event.strumID]);
		note.animation.add("holdend", [4 + event.strumID]);
	} else {
		note.loadGraphic(Paths.image('notes/pixel/shitno_arrows1'), true, 19, 19);
		note.animation.add("scroll", [4 + event.strumID]);
	}
	note.scale.set(6, 6);
	note.updateHitbox();
}

function onPostNoteCreation(event) {
	var splashes = event.note;
    splashes.splash = "pixel-default";
}

function onStrumCreation(event) {
	event.cancel();

	var strum = event.strum;
	strum.loadGraphic(Paths.image('notes/pixel/shitno_arrows1'), true, 19, 19);
	strum.animation.add("static", [event.strumID]);
	strum.animation.add("pressed", [4 + event.strumID, 8 + event.strumID], 12, false);
	strum.animation.add("confirm", [12 + event.strumID, 16 + event.strumID], 24, false);

	strum.scale.set(6, 6);
	strum.updateHitbox();
}