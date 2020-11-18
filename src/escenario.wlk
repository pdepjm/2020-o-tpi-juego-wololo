import creadoresObstaculos.*
import wollok.game.*
import obstaculos.*
import autos.*

object pista {
	const obstaculos = []
	var distanciaRecorrida = 0
	var limiteDer = 5
	var limiteIz = 13
	var property position= game.origin()
	const puntosCriticosDeAchicamiento = [44,46,48,104,106,108,172,174,176]
	const puntosCriticosDeEnsanchamiento = [53,55,57,116,118,120,183,185,187]
	const obstaculosPosibles = [creadorPlanta,creadorPiedra,creadorBarril,creadorAceite,creadorVida]
	
	method limiteDer() = limiteDer
	method limiteIz() = limiteIz
	method aumentarLimiteDer(){
		limiteDer++
		}
	method aumentarLimiteIz(){
		limiteIz++
		}
	method reducirLimiteDer(){
		limiteDer--
		}
	method reducirLimiteIz(){
		limiteIz--
		}
	method obstaculos() = obstaculos
	
	method position() {
		return position
	}
	method position(nuevaPosicion) {
		position= nuevaPosicion
		distanciaRecorrida++
		if(puntosCriticosDeAchicamiento.contains(distanciaRecorrida)){
		 	self.aumentarLimiteDer()
		 	self.reducirLimiteIz()
		}else if(puntosCriticosDeEnsanchamiento.contains(distanciaRecorrida)){
		 	self.reducirLimiteDer()
		 	self.aumentarLimiteIz()
		} 
	}
    
	method image() {
		return "assets/Pistas/Pista_2.png"
	}
	method choque(unAuto) {
	}

	method crearObstaculo(){
		const creador = obstaculosPosibles.get(0.randomUpTo(5))
		creador.crear()
	}
	
	method moverObstaculos(){
			obstaculos.forEach({objeto => objeto.moverse()})
	}
	
}
