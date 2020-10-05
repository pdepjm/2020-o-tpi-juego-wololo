import wollok.game.*
import autos.*
import obstaculos.*

object juego {

	method iniciar() {
		self.configurarJuego()
		self.agregarAutos()
		self.agregarObstaculos()
		self.configurarTeclas()
		self.configurarAcciones()
		game.start()
	}

	method configurarJuego() {
		game.title("Nombre juego")
		game.width(50)
		game.height(50)
	}

	method agregarAutos() {
		game.addVisual(autoRojo)
		game.addVisual(autoNegro)
	}
	
	method agregarObstaculos() {
		game.addVisual(piedra)
	}

	method configurarTeclas() {
		keyboard.up().onPressDo({ autoRojo.moverseA(autoRojo.position().up(1))})
		keyboard.down().onPressDo({ autoRojo.moverseA(autoRojo.position().down(1))})
		keyboard.left().onPressDo({ autoRojo.moverseA(autoRojo.position().left(1))})
		keyboard.right().onPressDo({ autoRojo.moverseA(autoRojo.position().right(1))})
	}
	
	method configurarAcciones() {
		game.onCollideDo(autoRojo, { visualColisionado => visualColisionado.choque(autoRojo)})
		game.onCollideDo(autoNegro, { visualColisionado => visualColisionado.choque(autoNegro)})		
	}

}

