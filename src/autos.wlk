import wollok.game.*

object autoRojo {
	var choques = 0
	var posicion = game.at(2, 2)
	var imagen = "Autos/auto rojo.png"

	method position() = posicion

	method image() = imagen
	
	method moverseA(nuevaPosicion) {
		posicion = nuevaPosicion
	}
	
	method destruirse() {
		choques = choques + 1
		if (choques == 1) {
			imagen = "Car_1_Main_Positions/Car_1_02.png"
		}else if (choques == 2){
			imagen = "Car_1_Main_Positions/Car_1_03.png"
		}else if (choques == 3){
			imagen = "Car_1_Main_Positions/Car_1_04.png"
		}else if (choques == 4){
			imagen = "Car_1_Main_Positions/Car_1_05.png"
		//game.say(self,"Perdiste")
		game.schedule(5000, { game.stop()})
		}
		
	
	}

}

