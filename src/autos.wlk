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
		choques += 1
		if (choques == 1) {
			imagen = "Car_1_Main_Positions/Car_1_01.png"
		}
	}

}

object autoNegro {

	var choques = 0
	var posicion = game.at(2, 5)
	var imagen = "Autos/auto negro.png"

	method position() = posicion

	method image() = imagen
	
	method moverseA(nuevaPosicion) {
		posicion = nuevaPosicion
	}
	
	method destruirse() {
		choques += 1
		if (choques == 1) {
			imagen = "Car_1_main_Positions/Car_1_01.png"
		}
	}
}
