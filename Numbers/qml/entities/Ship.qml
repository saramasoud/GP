import QtQuick 2.0
import Felgo 3.0

EntityBase {
    entityType: "ship"
    width: sprite.width
    height: sprite.height

    MultiResolutionImage {
        id: sprite
        source: "../../assets/img/hot-air-balloon_2_50x50.png"
    }

    CircleCollider {
        radius: sprite.width/2
        // restitution is bounciness, airships are quite bouncy
        fixture.restitution: 0.5
    }

    MouseArea {
        anchors.fill: sprite
        onPressed: {
            // if you touch a airships and the game is running, it will pop
            if(airshipScene.gameRunning) {
                airshipScene.airships--
                airshipScene.count++
                if(airshipScene.count===1){
                    numSound1.play()
                }else if(airshipScene.count===2){
                    numSound2.play()
                }else if(airshipScene.count===3){
                    numSound3.play()
                }else if(airshipScene.count===4){
                    numSound4.play()
                }else if(airshipScene.count===5){
                    numSound5.play()
                }else if(airshipScene.count===6){
                    numSound6.play()
                }else if(airshipScene.count===7){
                    numSound7.play()
                }else if(airshipScene.count===8){
                    numSound8.play()
                }else if(airshipScene.count===9){
                    numSound9.play()
                }else if(airshipScene.count===10){
                    numSound10.play()
                }else if(airshipScene.count===11){
                    numSound11.play()
                }else if(airshipScene.count===12){
                    numSound12.play()
                }else if(airshipScene.count===13){
                    numSound13.play()
                }else if(airshipScene.count===14){
                    numSound14.play()
                }else if(airshipScene.count===15){
                    numSound15.play()
                }else if(airshipScene.count===16){
                    numSound16.play()
                }else if(airshipScene.count===17){
                    numSound17.play()
                }else if(airshipScene.count===18){
                    numSound18.play()
                }else if(airshipScene.count===19){
                    numSound19.play()
                }else if(airshipScene.count===20){
                    numSound20.play()
                }
                removeEntity()
            }
        }
    }

    // gives the airship a random position when created
    Component.onCompleted: {
        x = utils.generateRandomValueBetween(0,airshipScene.width-sprite.width)
        y = airshipScene.height
    }
}
