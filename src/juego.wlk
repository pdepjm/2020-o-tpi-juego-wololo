import wollok.game.*
import autos.*
import obstaculos.*
import escenario.*

const obstaculosPosibles = [new Piedra(position = game.at(5.randomUpTo(14), 19),nombre = "piedra"),new Planta(position = game.at(5.randomUpTo(14), 19),nombre = "Tree")]

object juego {
	const listaObstaculos = []
	method iniciar() {
		self.configurarJuego()
		game.boardGround("assets/Fondo/pasto.jpg")
		self.agregarPista()
		self.agregarObstaculos()
		self.agregarAutos()
		self.configurarTeclas()
		self.configurarAcciones()
		
		game.start()
	}

	method configurarJuego() {
		game.title("Nombre juego")
		game.width(20)
		game.height(20)
	}

	method agregarAutos() {
		//game.addVisual(autoRojo)
	}
	method agregarPista()
	{
		game.addVisual(pista)
	}
 	method agregarObstaculos() {
		//game.addVisual(piedra)
		//game.addVisual(planta)
		game.addVisual(bloque)
		/*game.addVisual(comienzo)
		game.addVisual(aceite)
		game.addVisual(barril)*/
		
	}

	method configurarTeclas() {
		//keyboard.up().onPressDo({ autoRojo.moverseA(autoRojo.position().up(1)) })
		//keyboard.down().onPressDo({ autoRojo.moverseA(autoRojo.position().down(1))})
		//keyboard.left().onPressDo({ autoRojo.moverseA(autoRojo.position().left(1))})
		//keyboard.right().onPressDo({ autoRojo.moverseA(autoRojo.position().right(1))})
		keyboard.up().onPressDo({ bloque.moverseA(bloque.position().up(1)) })
		keyboard.down().onPressDo({ bloque.moverseA(bloque.position().down(1))})
		keyboard.left().onPressDo({ bloque.moverseA(bloque.position().left(1))})
		keyboard.right().onPressDo({ bloque.moverseA(bloque.position().right(1))})
		
	}
	
	method configurarAcciones() {
		//game.onCollideDo(autoRojo, { visualColisionado => visualColisionado.choque(autoRojo)})
		game.onTick(1000, "movimiento pista", {pista.position(pista.position().down(1))})
		game.onTick(5000, "crear obstaculo", {
		  	/*var obstaculo = obstaculosPosibles.get(1)
		  	listaObstaculos.add(obstaculo)
		  	game.addVisual(obstaculo)*/
			var piedra = new Piedra(position = game.at(5.randomUpTo(14), 19),nombre="piedra")
			listaObstaculos.add(piedra)
			game.addVisual(piedra)
		})
		game.onTick(1000, "Mover obstaculos", {
			listaObstaculos.forEach({objeto => objeto.position(objeto.position().down(1))})
		})
	}
}

