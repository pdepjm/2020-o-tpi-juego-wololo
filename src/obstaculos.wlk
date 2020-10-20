import wollok.game.*
import autos.*

class Piedra inherits Obstaculo{
	method choque(unAuto) {
		game.removeVisual(self)
		unAuto.destruirse()
	}
	method destruccion(){
		
	}

}
class Obstaculo {
	var position
	const nombre 
	method position() = position
	method position(nuevaPosicion){
		position = nuevaPosicion
	}
	method image() = "Decor/" + nombre +".png"
	method estaFuera() = self.position().y() < 5 // aca seria si es <= 0 para borrarlo y liberar memoria (no lo tengo muy en claro)
	
}
class Planta inherits Obstaculo{
	method choque(unAuto) {
		//frenar
		//unAuto.destruirse()
	}
}

class Aceite inherits Obstaculo{
	
	method choque(unAuto) {
		//unAuto.destruirse()
	}

}
class Barril inherits Obstaculo{
	
	method choque(unAuto) {
		//unAuto.destruirse()
	}

}
/*object piedra {

	const posicion = game.at(6, 7)
	const imagen = "Decor/piedra.png"

	method position() = posicion

	method image() = imagen
	
	method choque(unAuto) {
		//frenar
		unAuto.destruirse()
	}

} */
/*object planta {
	const posicion = game.at(7, 15)
	const imagen = "Decor/Tree.png"

	method position() = posicion

	method image() = imagen
	
	method choque(unAuto) {
		unAuto.destruirse()
	}
}*/
/*

object barril {
	const posicion = game.at(5, 30)
	const imagen = "Game_Props_Items/Barrel_01.png"

	method position() = posicion

	method image() = imagen
	
	method choque(unAuto) {
		unAuto.destruirse()
	}

	
}

object comienzo{
	const posicion = game.at(5, 5)
	const imagen = "Decor/Start.png"

	method position() = posicion

	method image() = imagen
	
	method choque(unAuto) {
	}

}

object aceite {

	const posicion = game.at(20, 10)
	const imagen = "Game_Props_Items/Oil.png"

	method position() = posicion

	method image() = imagen
	
	method choque(unAuto) {
		unAuto.destruirse()
	}

}*/ 