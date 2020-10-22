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
}
class Piedra inherits Obstaculo{
		method choque(unAuto) {
		unAuto.destruirse()
	}


}
class Planta inherits Obstaculo{
	method choque(unAuto) {
		unAuto.noAfectar()
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
class Meta
{
	var posicion = game.at(5, 440)
	var imagen = "assets/Decor/colision.png"
	method position() = posicion
	method position(nuevaPosicion) {
		posicion= nuevaPosicion
		
		}
	method image() = imagen
	
	method choque(unAuto) {
		game.say(unAuto,"¡¡Ganaste!!")
		game.schedule(500, { game.stop()})
	}
}

