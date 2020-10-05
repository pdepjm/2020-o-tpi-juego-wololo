import wollok.game.*

object piedra {

	var posicion = game.at(6, 7)
	const imagen = "Decor/Rock.png"

	method position() = posicion

	method image() = imagen
	
	method choque(unAuto) {
		//frenar
		unAuto.destruirse()
	}

}
