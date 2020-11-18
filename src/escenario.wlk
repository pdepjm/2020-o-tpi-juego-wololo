import creadoresObstaculos.*
import wollok.game.*
import obstaculos.*
import autos.*

object pista {
	const property obstaculos = []
	var distanciaRecorrida = 0
	var limiteDer = 5
	var limiteIz = 13
	var property position= game.origin()
	const puntosCriticosDeAchicamiento = [44,46,48,104,106,108,172,174,176]
	const puntosCriticosDeEnsanchamiento = [53,55,57,116,118,120,183,185,187]
	const property obstaculosPosibles = [creadorPlanta,creadorPiedra,creadorBarril,creadorAceite,creadorVida]
	
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
<<<<<<< HEAD
=======
	method obstaculos() = obstaculos
>>>>>>> branch 'master' of https://github.com/pdepjm/2020-o-tpi-juego-wololo.git
	
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
<<<<<<< HEAD
	
	
=======

>>>>>>> branch 'master' of https://github.com/pdepjm/2020-o-tpi-juego-wololo.git
	method crearObstaculo(){
		const creador = obstaculosPosibles.get(0.randomUpTo(5))
<<<<<<< HEAD
		const obstaculo = creador.crear()
		if(not obstaculos.contains(obstaculo)){
			obstaculos.add(obstaculo)
			game.addVisual(obstaculo)
		}
=======
		creador.crear()
>>>>>>> branch 'master' of https://github.com/pdepjm/2020-o-tpi-juego-wololo.git
	}
	
	method moverObstaculos(){
<<<<<<< HEAD
		obstaculos.forEach({objeto => objeto.position(objeto.position().down(1))})
		
=======
			obstaculos.forEach({objeto => objeto.moverse()})
>>>>>>> branch 'master' of https://github.com/pdepjm/2020-o-tpi-juego-wololo.git
	}
	
}
