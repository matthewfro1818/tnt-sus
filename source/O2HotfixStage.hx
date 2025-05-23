package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import Note;
import PlayState;
import config.*;

class O2HotfixStage extends MusicBeatState {
    public var background:FlxSprite;
    public var switchSprite:FlxSprite;
    public var fans:FlxSprite;
    public var squid:FlxSprite;
    public var jads:FlxSprite;
    public var parry:FlxSprite;
    public var healthHit:FlxSprite;
    public var healthHit2:FlxSprite;
    var defaultCamZoom:Float = 1.05;

    override public function create() {
        super.create();
 
        defaultCamZoom = 0.9;

        background = new FlxSprite(-1030, -90).loadGraphic(Paths.image("limegreen/O2Background"));
        add(background);

        switchSprite = new FlxSprite(-885, 420).loadGraphic(Paths.image("limegreen/switch"));
        add(switchSprite);

        fans = new FlxSprite(-596, 178);
        fans.frames = Paths.getSparrowAtlas("limegreen/fansss");
        fans.animation.addByPrefix("main", "fansss instance 1", 24, true);
        fans.animation.play("main");
        add(fans);

        parry = new FlxSprite(-640, 400);
        parry.frames = Paths.getSparrowAtlas("taunt");
        parry.animation.addByPrefix("checkthisout", "taunt instância", 24, false);
        add(parry);
        parry.visible = false;

        squid = new FlxSprite(-1800, 700);
        squid.frames = Paths.getSparrowAtlas("characters/SquidBoy84");
        squid.animation.addByPrefix("squidbop", "idle", 24, true);
        squid.animation.play("squidbop");
        add(squid);

        jads = new FlxSprite(-500, 550);
        jads.frames = Paths.getSparrowAtlas("characters/LIME_GRTEEN");
        jads.animation.addByPrefix("jadsbop", "Idle", 24, true);
        jads.visible = false;
        add(jads);

        healthHit = new FlxSprite(0, 0).loadGraphic(Paths.image("ow"));
        healthHit.scrollFactor.set(0, 0);
        add(healthHit);
        healthHit.visible = false;	
	healthHit.y = PlayState.healthBarBG.y + PlayState.healthBarBG.height / 2 - (PlayState.iconP2.height / 2);

        healthHit2 = new FlxSprite(500, 10).loadGraphic(Paths.image("owdown"));
        healthHit2.scrollFactor.set(0, 0);
        add(healthHit2);
        healthHit2.visible = false;
	healthHit2.y = PlayState.healthBarBG.y + PlayState.healthBarBG.height / 2 - (PlayState.iconP2.height / 2);

    }

    override public function stepHit():Void {
    super.stepHit();

    switch (curStep) {        
        case 113:
            FlxTween.tween(squid, {x: -500}, 0.9, {ease: FlxEase.quadIn});
            FlxTween.tween(squid, {y: 500}, 0.9, {ease: FlxEase.quadIn});
        
        case 124:
            parry.visible = true;
            parry.animation.play("checkthisout", true);
            squid.visible = false;
            jads.visible = true;

            FlxTween.tween(jads, {x: 1500, y: 400}, 0.9, {ease: FlxEase.quadOut});

            if (!Config.downscroll) {
                healthHit2.visible = true;
                FlxTween.tween(healthHit2, {x: 1500, y: 800}, 0.9, {ease: FlxEase.quadOut});
            } else {
                healthHit.visible = true;
                FlxTween.tween(healthHit, {x: 1500, y: 400}, 0.9, {ease: FlxEase.quadOut});
            }

        case 131:
            parry.visible = false;
    }
}

}
