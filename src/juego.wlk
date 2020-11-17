import wollok.game.*
import autos.*
import obstaculos.*
import escenario.*
import creadoresObstaculos.*


object juego {
	const meta =creadorMeta.crearMeta()
	const colisionesMeta=[]
	method iniciar() {
		self.configurarJuego()
		game.boardGround("assets/Fondo/pasto.jpg")
		self.agregarPista()
		self.agregarMeta(10)
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
		autoRojo.crearAuto()
		game.addVisual(autoRojo)
		game.addVisual(colision)
	
		}
	method agregarPista()
	{
		game.addVisual(pista)
	}
 	
		method agregarMeta(ancho)
	{ 
	    game.addVisual(meta)
		ancho.times({i =>
			const colisionMeta =new Meta(posicion=game.at(meta.position().x() + i ,meta.position().y()),imagen="assets/Decor/colision.png")
			colisionesMeta.add(colisionMeta)
			game.addVisual(colisionMeta)
		})
	}

	method configurarTeclas() {
		keyboard.left().onPressDo({ autoRojo.moverseA(autoRojo.position().left(1)) colision.moverseA(colision.position().left(1))})
		keyboard.right().onPressDo({ autoRojo.moverseA(autoRojo.position().right(1)) colision.moverseA(colision.position().right(1)) })
		
	}

	method configurarAcciones() {
		game.onTick(100, "movimiento pista", {pista.position(pista.position().down(1))
			meta.position(meta.position().down(1))
			colisionesMeta.forEach({colisionMet=>colisionMet.position(colisionMet.position().down(1))})
		} )
		game.onTick(1000, "crear obstaculo", {
			pista.crearObstaculo()
			
		
		})
		game.onTick(100, "Mover obstaculos", {pista.moverObstaculos()})	
		game.onCollideDo(colision, {objeto=>objeto.choque(autoRojo)})
	}
}