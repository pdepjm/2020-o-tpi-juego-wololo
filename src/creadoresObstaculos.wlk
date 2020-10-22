import wollok.game.*
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