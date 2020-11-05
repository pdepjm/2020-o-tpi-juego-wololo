import wollok.game.*
import escenario.*
import juego.*

object cartel{
	var imagen 
	var position = game.origin() 
	method imagen() = imagen
	method position() = position
 	method imagen(unaImagen) {
		imagen = unaImagen
	}
	
	method position(unaPosicion){
		position = unaPosicion
	}
	
}

object menu{
	
	method iniciar(){
		cartel.imagen("assets/Setting/WindowNueva.png")
		game.addVisual(cartel)
		keyboard.space().onPressDo({
			game.clear()
			play.iniciar()
		})
	}
}

object play {
	method iniciar(){
		cartel.imagen("assets/Level_Menu/Play_Nuevo.png")
		cartel.position( game.at(15, 2))
		game.addVisual(cartel)
		keyboard.enter().onPressDo({
			game.clear()
			seleccionarVehiculo.iniciar()
		})
	}
		
}

object seleccionarVehiculo{
	
	method iniciar(){
		
	}
}
