package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import PlayState;
import Note;

class SerializedStage extends MusicBeatState {
    public var bg:FlxSprite;
    public var bgAlt:FlxSprite;
    public var gradient:FlxSprite;
    public var flash:FlxSprite;
    public var textLayer:FlxSprite;
    public var yeahh:FlxSprite;
    var defaultCamZoom:Float = 1.05;

    override public function create() {
        super.create();

	defaultCamZoom = 0.9;

        bg = new FlxSprite(-950, -50).loadGraphic(Paths.image("serialized V1 bg"));
        bg.setGraphicSize(Std.int(bg.width * 1.15));
        add(bg);

        bgAlt = new FlxSprite(-1100, -50).loadGraphic(Paths.image("serialized bg"));
        bgAlt.setGraphicSize(Std.int(bgAlt.width * 1.15));
        bgAlt.visible = false;
        add(bgAlt);

        gradient = new FlxSprite(-1100, 0).loadGraphic(Paths.image("gradient thing"));
        gradient.setGraphicSize(Std.int(gradient.width * 1.15));
        gradient.blend = ADD;
        gradient.alpha = 0.3;
        gradient.visible = false;
        add(gradient);

        flash = new FlxSprite(0, 0).makeGraphic(1280, 720, FlxColor.WHITE);
        flash.scrollFactor.set(0, 0);
        flash.alpha = 0;
        add(flash);

        yeahh = new FlxSprite(0, 0).loadGraphic(Paths.image("happy birthday"));
        yeahh.scrollFactor.set(0, 0);
        yeahh.alpha = 0;
        yeahh.antialiasing = false;
        add(yeahh);
    }

    override public function stepHit():Void {
        super.stepHit();

        switch (curStep) {
            case 2032:
                for (i in 0...8) {
                    var targetX = switch (i) {
                        case 0: 92;
                        case 1: 205;
                        case 2: 315;
                        case 3: 428;
                        case 4: 732;
                        case 5: 845;
                        case 6: 955;
                        case 7: 1068;
                        default: 0;
                    };
                    FlxTween.tween(PlayState.strumLineNotes.members[i], {x: targetX}, 1, {ease: FlxEase.sineOut});
                }

            case 2040:
                flash.alpha = 0;
                flash.visible = true;
                FlxTween.tween(flash, {alpha: 1}, 0.5, {ease: FlxEase.sineIn});

            case 2048:
                flash.visible = true;
                FlxTween.tween(flash, {alpha: 0}, 0.75, {ease: FlxEase.sineOut});

                bg.visible = false;
                bgAlt.visible = true;
                gradient.visible = true;
            case 2608:
                FlxTween.tween(yeahh, {alpha: 1}, 2, {ease: FlxEase.sineOut});
        }
    }

    override public function beatHit():Void {
        super.beatHit();
        if (curBeat % 4 == 0 && PlayState.camZooming) {
            FlxG.camera.zoom += 0.015;
        }
    }
}
