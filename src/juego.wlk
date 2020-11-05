import wollok.game.*
import autos.*
import obstaculos.*
import escenario.*
import creadoresObstaculos.*


object juego {
	const meta =creadorMeta.crearMeta()
	const colisionMeta0= new Meta(posicion=game.at(5, 440),imagen="assets/Decor/colision.png")
	const colisionMeta1= new Meta(posicion=game.at(6, 440),imagen="assets/Decor/colision.png")
	const colisionMeta2= new Meta(posicion=game.at(7, 440),imagen="assets/Decor/colision.png")
	const colisionMeta3= new Meta(posicion=game.at(8, 440),imagen="assets/Decor/colision.png")
	const colisionMeta4= new Meta(posicion=game.at(9, 440),imagen="assets/Decor/colision.png")
	const colisionMeta5= new Meta(posicion=game.at(10, 440),imagen="assets/Decor/colision.png")
	const colisionMeta6= new Meta(posicion=game.at(11, 440),imagen="assets/Decor/colision.png")
	const colisionMeta7= new Meta(posicion=game.at(12, 440),imagen="assets/Decor/colision.png")
	const colisionMeta8= new Meta(posicion=game.at(13, 440),imagen="assets/Decor/colision.png")
	const colisionMeta9= new Meta(posicion=game.at(13, 440),imagen="assets/Decor/colision.png")
	
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
		autoRojo.crearAuto()
		game.addVisual(autoRojo)
		colision.crearColision(autoRojo,1,4)
		game.addVisual(colision)
		
		
		//game.addVisual(camion)
		}
	method agregarPista()
	{
		game.addVisual(pista)
	}
 	method agregarObstaculos() {
 		game.addVisual(meta)
		game.addVisual(colisionMeta0)
		game.addVisual(colisionMeta1)
		game.addVisual(colisionMeta2)
		game.addVisual(colisionMeta3)
		game.addVisual(colisionMeta4)
		game.addVisual(colisionMeta5)
		game.addVisual(colisionMeta6)
		game.addVisual(colisionMeta7)
		game.addVisual(colisionMeta8)
		game.addVisual(colisionMeta9)
		
	}

	method configurarTeclas() {
		//keyboard.up().onPressDo({ autoRojo.moverseA(autoRojo.position().up(1)) })
		//keyboard.down().onPressDo({ autoRojo.moverseA(autoRojo.position().down(1))})
		keyboard.left().onPressDo({ autoRojo.moverseA(autoRojo.position().left(1)) colision.moverseA(colision.position().left(1))})
		keyboard.right().onPressDo({ autoRojo.moverseA(autoRojo.position().right(1)) colision.moverseA(colision.position().right(1)) })
		/*keyboard.up().onPressDo({ bloque.moverseA(bloque.position().up(1)) })
		keyboard.down().onPressDo({ bloque.moverseA(bloque.position().down(1))})
		keyboard.left().onPressDo({ bloque.moverseA(bloque.position().left(1))})
		keyboard.right().onPressDo({ bloque.moverseA(bloque.position().right(1))})*/
		
	}

	method configurarAcciones() {
		//game.onCollideDo(autoRojo, { visualColisionado => visualColisionado.choque(autoRojo)})
		//game.onCollideDo(camion, { visualColisionado2 => visualColisionado2.choque(camion)})
		game.onTick(100, "movimiento pista", {pista.position(pista.position().down(1))
			meta.position(meta.position().down(1))colisionMeta0.position(colisionMeta0.position().down(1)) 
			colisionMeta1.position(colisionMeta1.position().down(1)) colisionMeta2.position(colisionMeta2.position().down(1))
			colisionMeta3.position(colisionMeta3.position().down(1)) colisionMeta4.position(colisionMeta4.position().down(1))
			colisionMeta5.position(colisionMeta5.position().down(1)) colisionMeta6.position(colisionMeta6.position().down(1))
			colisionMeta7.position(colisionMeta7.position().down(1)) colisionMeta8.position(colisionMeta8.position().down(1)) 
			colisionMeta9.position(colisionMeta9.position().down(1)) 
		} )
		game.onTick(1000, "crear obstaculo", {
			pista.crearObstaculo()
			
		
		})
		game.onTick(100, "Mover obstaculos", {pista.moverObstaculos()})	
		game.onCollideDo(colision, {objeto=>objeto.choque(autoRojo)})
	}
}

