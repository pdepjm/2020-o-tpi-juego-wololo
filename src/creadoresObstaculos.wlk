import wollok.game.*
import obstaculos.*
import obstaculos.*
import escenario.*

class Creador {
	method instanciarObstaculo(unObstaculo) {
		pista.obstaculos().add(unObstaculo)
		game.addVisual(unObstaculo)
	}
}
object creadorPiedra inherits Creador {
	method crear() {
		self.instanciarObstaculo(new Piedra(position = game.at(5.randomUpTo(14), 19),nombre = "piedra"))
	}
}

object creadorPlanta inherits Creador{
	method crear() {
		self.instanciarObstaculo(new Planta(position = game.at(5.randomUpTo(14), 19),nombre = "Tree"))
	}
}

object creadorBarril inherits Creador{
	method crear() {
		self.instanciarObstaculo(new Barril(position = game.at(5.randomUpTo(14), 19),nombre = "Barril"))
	}	
}

object creadorAceite inherits Creador{
	method crear() {
		self.instanciarObstaculo(new Aceite(position = game.at(5.randomUpTo(14), 19),nombre = "Aceite"))
	}
}
object creadorVida inherits Creador{
	method crear() {
		self.instanciarObstaculo(new Vida(position = game.at(5.randomUpTo(14), 19),nombre = "vida"))
	}
}
object creadorMeta{
	const meta =  new Meta(posicion=game.at(4, 440),imagen="assets/Decor/Finish_3.png")
	method crearMeta() = meta
}
