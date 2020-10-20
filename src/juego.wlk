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
		//game.addVisual(piedra)
		//game.addVisual(planta)
		//game.addVisual(bloque)
		/*game.addVisual(comienzo)
		game.addVisual(aceite)
		game.addVisual(barril)*/
		
	}

	method configurarTeclas() {
		keyboard.up().onPressDo({ autoRojo.moverseA(autoRojo.position().up(1)) })
		keyboard.down().onPressDo({ autoRojo.moverseA(autoRojo.position().down(1))})
		keyboard.left().onPressDo({ autoRojo.moverseA(autoRojo.position().left(1))})
		keyboard.right().onPressDo({ autoRojo.moverseA(autoRojo.position().right(1))})
		/*keyboard.up().onPressDo({ bloque.moverseA(bloque.position().up(1)) })
		keyboard.down().onPressDo({ bloque.moverseA(bloque.position().down(1))})
		keyboard.left().onPressDo({ bloque.moverseA(bloque.position().left(1))})
		keyboard.right().onPressDo({ bloque.moverseA(bloque.position().right(1))})*/
		
	}
	
	method configurarAcciones() {
		//game.onCollideDo(autoRojo, { visualColisionado => visualColisionado.choque(autoRojo)})
		game.onTick(100, "movimiento pista", {pista.position(pista.position().down(1))})
		game.onTick(1000, "crear obstaculo", {
			pista.crearObstaculo()
		})
		game.onTick(100, "Mover obstaculos", {
			pista.moverObstaculos()
			
		})	
		game.whenCollideDo(autoRojo, {objeto=>objeto.choque(autoRojo)
			pista.obstaculos().remove(objeto)
		})
	}
}

