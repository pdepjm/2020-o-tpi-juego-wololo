import wollok.game.*
object pista {
	
	var property position= game.origin()

	method position() {
		return position
	}
	method position(nuevaPosicion) {
		 position= nuevaPosicion
	}

	method image() {
		return "assets/Pistas/Pista_2.png"
	}
	method choque(unAuto) {
	}
}
