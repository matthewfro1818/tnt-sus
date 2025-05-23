package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import Note;
import PlayState;

class O2Stage extends MusicBeatState {
    public var background:FlxSprite;
    public var switchSprite:FlxSprite;
    public var fans:FlxSprite;
    var defaultCamZoom:Float = 1.05;

    override public function create() {
        super.create();

	defaultCamZoom = 0.9;


        // Background
        background = new FlxSprite(-1030, -90).loadGraphic(Paths.image("limegreen/O2Background"));
        add(background);

        // Switch
        switchSprite = new FlxSprite(-885, 420).loadGraphic(Paths.image("limegreen/switch"));
        add(switchSprite);

        // Fans (animated)
        fans = new FlxSprite(-596, 178);
        fans.frames = Paths.getSparrowAtlas("limegreen/fansss");
        fans.animation.addByPrefix("main", "fansss instance 1", 24, true);
        fans.animation.play("main");
        add(fans);
    }
}
