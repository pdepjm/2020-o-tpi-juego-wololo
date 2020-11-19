import wollok.game.*
import autos.*
import obstaculos.*
import escenario.*
import creadoresObstaculos.*


object juego {
	const meta =creadorMeta.crearMeta()
	const colisionesMeta=[]
	var vehiculo 
	method iniciar() {
		self.configurarJuego()
		game.boardGround("assets/Fondo/pasto.jpg")
		self.agregarPista()
		self.agregarMeta(10)
		self.agregarAutos()
		self.configurarTeclas()
		self.configurarAcciones()
		//game.start()
	}

	method configurarJuego() {
		game.title("Racing")
		game.width(20)
		game.height(20)
	}

	method agregarAutos() {
		//vehiculo.configurar()
		game.addVisual(vehiculo)
		colision.asignarVehiculo(vehiculo)
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
	
	method asignarVehiculo(nuevoVehiculo)
	{
		vehiculo=nuevoVehiculo
	}

	method configurarTeclas() {
		keyboard.left().onPressDo({ vehiculo.moverseA(vehiculo.position().left(1)) colision.moverseA(colision.position().left(1))})
		keyboard.right().onPressDo({ vehiculo.moverseA(vehiculo.position().right(1)) colision.moverseA(colision.position().right(1)) })
		
	}

	method configurarAcciones() {
		game.onTick(100, "movimiento pista", {pista.position(pista.position().down(1))
			meta.position(meta.position().down(1))
			colisionesMeta.forEach({colisionMet=>colisionMet.position(colisionMet.position().down(1))})
		} )
		game.onTick(1000, "crear obstaculo", {
			if(not(meta.visible()))
				pista.crearObstaculo()	
			
		
		})
		game.onTick(100, "Mover obstaculos", {pista.moverObstaculos()})	
		game.onCollideDo(colision, {objeto=>objeto.choque(vehiculo) pista.obstaculos().remove(objeto) game.removeVisual(objeto)})

	}
}

