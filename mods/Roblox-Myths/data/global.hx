static var initialized:Bool = false;
public static var isEncoreMode:Bool = false;

static var redirectStates:Map<FlxState, String> = [
	TitleState => 'Myths/MythsTitle',
	MainMenuState => 'Myths/MythsMain',
];

function preStateSwitch() {
	if (!initialized) {
		initialized = true;
		//lets add a startup state
	}
		for (redirectState in redirectStates.keys())
			if (FlxG.game._requestedState is redirectState)
				FlxG.game._requestedState = new ModState(redirectStates.get(redirectState));
}