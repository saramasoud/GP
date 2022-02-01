import Felgo 3.0
import QtQuick 2.0
import "entities"
import QtMultimedia 5.8

Scene {
    id: airshipScene
    // provide the pop sound public for the balloons
    property alias numSound1: numSound1
    property alias numSound2: numSound2
    property alias numSound3: numSound3
    property alias numSound4: numSound4
    property alias numSound5: numSound5
    property alias numSound6: numSound6
    property alias numSound7: numSound7
    property alias numSound8: numSound8
    property alias numSound9: numSound9
    property alias numSound10: numSound10
    property alias numSound12: numSound11
    property alias numSound13: numSound13
    property alias numSound14: numSound14
    property alias numSound15: numSound15
    property alias numSound16: numSound16
    property alias numSound17: numSound17
    property alias numSound18: numSound18
    property alias numSound19: numSound19
    property alias numSound20: numSound20


    // number of airships currently on the scene
    property int airships: 0
    // maximum number of airships
    property int airshipsMax : 20
    // duration of the game in seconds
    property int time : 100
    // indicates if game is running
    property bool gameRunning: false

    property int count : 0


    // position the scene on the top edge
    sceneAlignmentY: "top"

    // used to create airships at runtime
    EntityManager {
        id: entityManager
        entityContainer: airshipScene
    }

    // make the balloons float up gently by using a low gravity
    PhysicsWorld { gravity.y: -1; debugDrawVisible: false }

    // background image
    Image {source:"../assets/img/cloud1.png"; anchors.fill:gameWindowAnchorItem}

    // background music
    //BackgroundMusic {source:"../assets/snd/music.mp3"}


    // the pop sound used by airships entities
    // make it available to them with the id Sound
    SoundEffect {id:numSound1; source:"../assets/snd/1.wav"}
    SoundEffect {id:numSound2; source:"../assets/snd/2.wav"}
    SoundEffect {id:numSound3; source:"../assets/snd/3.wav"}
    SoundEffect {id:numSound4; source:"../assets/snd/4.wav"}
    SoundEffect {id:numSound5; source:"../assets/snd/5.wav"}
    SoundEffect {id:numSound6; source:"../assets/snd/6.wav"}
    SoundEffect {id:numSound7; source:"../assets/snd/7.wav"}
    SoundEffect {id:numSound8; source:"../assets/snd/8.wav"}
    SoundEffect {id:numSound9; source:"../assets/snd/9.wav"}
    SoundEffect {id:numSound10; source:"../assets/snd/10.wav"}
    SoundEffect {id:numSound11; source:"../assets/snd/11.wav"}
    SoundEffect {id:numSound12; source:"../assets/snd/12.wav"}
    SoundEffect {id:numSound13; source:"../assets/snd/13.wav"}
    SoundEffect {id:numSound14; source:"../assets/snd/14.wav"}
    SoundEffect {id:numSound15; source:"../assets/snd/15.wav"}
    SoundEffect {id:numSound16; source:"../assets/snd/16.wav"}
    SoundEffect {id:numSound17; source:"../assets/snd/17.wav"}
    SoundEffect {id:numSound18; source:"../assets/snd/18.wav"}
    SoundEffect {id:numSound19; source:"../assets/snd/19.wav"}
    SoundEffect {id:numSound20; source:"../assets/snd/20.wav"}


    // left wall
    Wall {height:gameWindowAnchorItem.height+50; anchors.right:gameWindowAnchorItem.left}
    // right wall
    Wall {height:gameWindowAnchorItem.height+50; anchors.left:gameWindowAnchorItem.right}
    // ceiling
    Wall {width:gameWindowAnchorItem.width; anchors { bottom:gameWindowAnchorItem.top; left: gameWindowAnchorItem.left} }

    // HUD
    Row {
        // position the HUD at the bottom of the game window
        anchors.bottom: gameWindowAnchorItem.bottom
        // make sure the HUD is always on top
        z: 2
        // info text area
        Text {id:infoText; width:200; height:40; text:"Loading airships..."}
        // display remaining time
        Text {id:timeText; height:40; text:"Time: "+airshipScene.time}
    }

    // starts the game
    function start() {
        spawnBaloons.start()
    }

    // clear all baloons and reset properties to start values
    function reset() {
        entityManager.removeEntitiesByFilter(["ship"])
        airships = 0
        count=0
        time = 100
        infoText.text = "Loading airships..."
    }

    // create balloons with short intervals in between, creating a nice animation at the start
    Timer {
        id: spawnBaloons
        interval: 100 // milliseconds
        repeat: true
        onTriggered: {
            // after every 100ms we create a new airships
            entityManager.createEntityFromUrl(Qt.resolvedUrl("entities/Ship.qml"));
            airships++
            // if the maximum number of airships is reached, we stop the timer and therefore the airships creation
            // then we start the game
            if(airships===airshipsMax) {
                running = false
                gameRunning = true
            }
        }
    }

    // game timer, default interval of Timer is 1 second
    Timer {
        id: gameTimer
        running: gameRunning // time only counts down if game is running
        repeat: true
        onTriggered: {
            time--
            // if time is over, or each airships is popped, we stop the game and give the player some feedback about his success
            if(time === 0 || airships === 0) {
                gameRunning = false
                if(airships === 0) infoText.text = "Perfect"
                restartAfterDelay.start()
            }
        }
    }

    // reset and start game 4 seconds after it is over
    Timer {
        id: restartAfterDelay
        interval: 4000
        onTriggered: {
            airshipScene.reset()
            airshipScene.start()
        }
    }
}
