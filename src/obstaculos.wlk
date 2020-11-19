import wollok.game.*
import autos.*
import escenario.*

class Obstaculo {
	var position
	const nombre
	var camino = pista
	method position() = position
	method position(nuevaPosicion){
		position = nuevaPosicion
	}
	method image() = "Decor/" + nombre +".png"

	method estaFuera() = self.position().y() == 0
	method moverse(){
		if(self.estaFuera()){
			camino.obstaculos().remove(self)
			game.removeVisual(self)
			
		}else{
			 self.position(self.position().down(1))
		}

  }
  method choque(){}
 
}
class Piedra inherits Obstaculo{
		method choque(unAuto) {
		unAuto.estado().afectar(unAuto)
	}


}
class Planta inherits Obstaculo{
	method choque(unAuto) {
		
	}
}

class Aceite inherits Obstaculo{
	
	method choque(unAuto) {
		unAuto.estado().afectar(unAuto)
	}

}
class Barril inherits Obstaculo{
	
	method choque(vehiculo) {
			vehiculo.estado().afectar(vehiculo)
		}
		
}


class Vida inherits Obstaculo{
	
	method choque(unAuto) {
		unAuto.estado().desafectar(unAuto)
	}
}
class Meta
{
    const imagen = "assets/Decor/Finish_3.png"
	var posicion = game.at(4, 440)
	method position(nuevaPosicion) {
		posicion= nuevaPosicion
		}
		method position () = posicion
	method image() = imagen
	
	method choque(unAuto) {
		unAuto.gana()
		
		}
}
