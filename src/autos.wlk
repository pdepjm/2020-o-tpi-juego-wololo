import wollok.game.*
import escenario.*
class Vehiculo{
	var posicion
	var imagen 
	method position() = posicion
	method imagen() = imagen
	
	method moverseA(nuevaPosicion) {
		const x = nuevaPosicion.x()
		if(x >= pista.limiteDer() and x <= pista.limiteIz()){
			posicion = nuevaPosicion
		}
	}
}

object autoRojo inherits Vehiculo {
	var choques = 0
	
	method crearAuto(){
	posicion = game.at(10, 2)
	imagen = "assets/Car_1_Main_Positions/Car_1_01 copia.png"
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
		choques = choques + 1
		self.controlChoques()

	}
	
	method explotar(){
        choques = choques +2
        self.controlChoques()
  
	}
	
	method gana(){
		game.say(self,"¡¡Ganaste!!")
		game.schedule(500, { game.stop()})
	}
	
	method controlChoques(){
		if (choques == 1) {
			imagen = "Car_1_Main_Positions/Car_1_02.png"
		}else if (choques == 2){
			imagen = "Car_1_Main_Positions/Car_1_03.png"
			//game.say(self,"Te quedan 3 vidas")
		}else if (choques == 3){
			imagen = "Car_1_Main_Positions/Car_1_04.png"
			//game.say(self,"Te quedan 2 vidas")
		}else if (choques == 4){
			//game.say(self,"Te queda 1 vidas")
			imagen = "Car_1_Main_Positions/Car_1_05.png"
			game.say(self,"Perdiste")
			game.schedule(5000, { game.stop()})
			}
	} 
	method detenerse(){}
	method noAfectar(){}
	
}

object colision inherits Vehiculo{
	method crearColision(vehiculo,x,y){
	posicion = game.at(vehiculo.position().x()+x, vehiculo.position().y()+y)
	imagen = "assets/Decor/colision.png"		
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



