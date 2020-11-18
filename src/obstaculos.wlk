import wollok.game.*
import autos.*


class Obstaculo {
	var position
	const nombre 
	method position() = position
	method position(nuevaPosicion){
		position = nuevaPosicion
	}
	method image() = "Decor/" + nombre +".png"
	method estaFuera() = self.position().y() < 0
	
	method controlarObstaculo(){
		if(self.estaFuera()){
			game.removeVisual(self)
			game.clear()
			}
	}
	
 
}
class Piedra inherits Obstaculo{
		method choque(unAuto) {
		unAuto.destruirse()
	}


}
class Planta inherits Obstaculo{
	method choque(unAuto) {
		
	}
}

class Aceite inherits Obstaculo{
	
	method choque(unAuto) {
		unAuto.detenerse()
	}

}
class Barril inherits Obstaculo{
	
	method choque(unAuto) {
		unAuto.explotar()
	}

}

class Vida inherits Obstaculo{
	
	method choque(unAuto) {
		unAuto.reparar()
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
