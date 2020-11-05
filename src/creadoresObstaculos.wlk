import wollok.game.*
import obstaculos.*
import obstaculos.*

object creadorPiedra {
	method crear() {
		return new Piedra(position = game.at(5.randomUpTo(14), 19),nombre = "piedra")		
	}
}

object creadorPlanta {
	method crear() {
		return new Planta(position = game.at(5.randomUpTo(14), 19),nombre = "Tree")
	}
}

object creadorBarril {
	method crear() {
		return new Barril(position = game.at(5.randomUpTo(14), 19),nombre = "Barril")
	}	
}

object creadorAceite {
	method crear() {
		return new Aceite(position = game.at(5.randomUpTo(14), 19),nombre = "Aceite")
	}
}
object creadorVida {
	method crear() {
		return new Vida(position = game.at(5.randomUpTo(14), 19),nombre = "vida")
	}
}
object creadorMeta{
	const meta =  new Meta(posicion=game.at(4, 440),imagen="assets/Decor/Finish_3.png")
	method crearMeta() = meta
}