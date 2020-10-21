import wollok.game.*
import autos.*
import obstaculos.*
import escenario.*

object juego {

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
		game.addVisual(autoRojo)
	}
	method agregarPista()
	{
		game.addVisual(pista)
	}
 	method agregarObstaculos() {
 		//const piedra = new Destructivo(imagen ="Decor/piedra.png", position = game.at(6, 7))
		game.addVisual(piedra.crear())
		/*game.addVisual(planta)
		game.addVisual(comienzo)
		game.addVisual(aceite)
		*/
	}

	method configurarTeclas() {
		keyboard.up().onPressDo({ autoRojo.moverseA(autoRojo.position().up(1)) pista.position(pista.position().down(1))})
		keyboard.down().onPressDo({ autoRojo.moverseA(autoRojo.position().down(1)) pista.position(pista.position().up(1))})
		keyboard.left().onPressDo({ autoRojo.moverseA(autoRojo.position().left(1))})
		keyboard.right().onPressDo({ autoRojo.moverseA(autoRojo.position().right(1))})
		
	}
	
	method configurarAcciones() {
		game.whenCollideDo(autoRojo, { visualColisionado => visualColisionado.choque(autoRojo)})
	}

}

