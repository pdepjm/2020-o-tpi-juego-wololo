import wollok.game.*
import autos.*

class Obstaculos{
	var position 
	var imagen

	method imagen() = imagen
	method position() = position

}

class Destructivo inherits Obstaculos{
	method choque(unAuto) {
		unAuto.destruirse()
	}
}

class Inactivo inherits Obstaculos {
	method choque(unAuto){
		
	}
}

class Desacelerador inherits Obstaculos{
	method choque(unAuto){
		unAuto.frenarse()
	}
}

class Acelerador inherits Obstaculos{
	method choque(unAuto){
		unAuto.acelerarse()
	}
} 
object piedra inherits Destructivo {
	
   method crear() =  new Destructivo(imagen ="Decor/piedra.png", position = game.at(6, 7) )
}
/* 
class Planta inherits Obstaculos {
	const planta = new Destructivos(imagen ="Decor/Tree.png" , posicion = game.at(40, 20) )
}
 
object comienzo{
	const posicion = game.at(5, 5)
	const imagen = "Decor/Start.png"

	method position() = posicion

	method image() = imagen
	
	method choque(unAuto) {
	}

}

object aceite {

	const posicion = game.at(20, 10)
	const imagen = "Game_Props_Items/Oil.png"

	method position() = posicion

	method image() = imagen
	
	method choque(unAuto) {
		unAuto.destruirse()
	}

*/