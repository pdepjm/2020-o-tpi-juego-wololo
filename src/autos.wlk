import wollok.game.*
import escenario.*
import estadosAuto.*

class Vehiculo{
	var posicion
	var estado = autoNuevo
	var imagen = estado.imagen()
	method position() = posicion
	method image() = imagen
	
	method moverseA(nuevaPosicion) {
		const x = nuevaPosicion.x()
		if(x >= pista.limiteDer() and x <= pista.limiteIz()){
			posicion = nuevaPosicion
		}
	}
}

object autoRojo inherits Vehiculo {
	var choques = 0
	var count =0
	
	
	override method image() = estado.imagen()
	
	method crearAuto(){
	posicion = game.at(10, 2)
	imagen = estado.imagen()
	}

	method cambiarEstado(nuevoEstado) {
		estado = nuevoEstado
	}
	/*method position() = posicion

	method image() = imagen
	
	method moverseA(nuevaPosicion) {
		const x = nuevaPosicion.x()
		if(x >= pista.limiteDer() and x <= pista.limiteIz()){
			posicion = nuevaPosicion
		}
	}*/
	
	method choques() = choques
	
	method destruirse() {
		
		self.cambiarEstado(estado.proximoEstado())	
		self.controlChoques()
		

	}
	
	method explotar(){
        
        self.cambiarEstado(autoRoto)
        self.controlChoques()
  
	}
	method reparar()
	{
		self.cambiarEstado(estado.estadoAnterior())
		self.controlChoques()
	}
	
	method gana(){
		game.say(self,"¡¡Ganaste!!")
		game.schedule(500, { game.stop()})
	}
	
	method controlChoques(){

		if (estado == autoRoto) 
		{
			//game.say(self,"Te queda 1 vidas")
			game.say(self,"Perdiste")
			game.schedule(5000, { game.stop()})
		}
	} 
	method detenerse(){
		
	}
	method noAfectar(){}
	
}

object colision inherits Vehiculo{
	method crearColision(vehiculo,x,y){
	posicion = game.at(vehiculo.position().x()+x, vehiculo.position().y()+y)
	imagen = "assets/Decor/colision.png"		
	}
	override method moverseA(nuevaPosicion) {
		const x = nuevaPosicion.x()
		if(x >= pista.limiteDer()+1 and x <= pista.limiteIz()+1){
			posicion = nuevaPosicion
		}
	}
}

object camion inherits Vehiculo {
	var explosiones = 0

	/*var posicion = game.at(10, 2)
	const imagen = "camion.png"
	var explosiones = 0
	method position() = posicion

	method image() = imagen

	method moverseA(nuevaPosicion) {
		const x = nuevaPosicion.x()
		if(x >= pista.limiteDer() and x <= pista.limiteIz()){
			posicion = nuevaPosicion
		}
	}*/
	method crearCamion(){
		posicion = game.at(10, 2)
		imagen = "camion.png"
	}


	method destruirse() {
	}
	
	method noAfectar(){}
	
	method detenerse(){}
	
	method explotar(){
		explosiones = explosiones + 1
		if(explosiones == 2){
			game.say(self,"Perdiste")
			game.schedule(5000, { game.stop()})	
		} 
	}
	
}



