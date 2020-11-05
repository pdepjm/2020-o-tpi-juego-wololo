import creadoresObstaculos.*
import wollok.game.*
import obstaculos.*
import autos.*
const obstaculosPosibles = [creadorPlanta,creadorPiedra,creadorBarril,creadorAceite,creadorVida]

object pista {
	const obstaculos = []
	var contador = 0
	var limiteDer = 5
	var limiteIz = 13
	var obstaculo
	var property position= game.origin()
	const puntosCriticosDeAchicamiento = [44,46,48,104,106,108,172,174,176]
	const puntosCriticosDeEnsanchamiento = [53,55,57,116,118,120,183,185,187]
	
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
	method obstaculo() = obstaculo
	
	method position() {
		return position
	}
	method position(nuevaPosicion) {
		position= nuevaPosicion
		contador++
		if(puntosCriticosDeAchicamiento.contains(contador)){
		 	self.aumentarLimiteDer()
		 	self.reducirLimiteIz()
		}else if(puntosCriticosDeEnsanchamiento.contains(contador)){
		 	self.reducirLimiteDer()
		 	self.aumentarLimiteIz()
		} 
	}
    
	method image() {
		return "assets/Pistas/Pista_2.png"
	}
	method choque(unAuto) {
	}
	method obstaculoAElegir(unCreador){
		obstaculo = unCreador.crear()
	}
	method crearObstaculo(){
		self.obstaculoAElegir(obstaculosPosibles.get(0.randomUpTo(5)))
		if(not obstaculos.contains(obstaculo)){
			obstaculos.add(obstaculo)
			game.addVisual(obstaculo)
		}
	}
	method eliminarObstaculo(){
		if(obstaculos.any({objeto=> objeto.estaFuera()})){
			const obstaculoAEliminar = obstaculos.filter({objeto => objeto.estaFuera()}).first()
		    obstaculos.remove(obstaculoAEliminar)
			game.removeVisual(obstaculoAEliminar)
	}
	
	}
	/*method moverObstaculos(){
		if(obstaculos.any({objeto => objeto.estaFuera()}) ){
			const obstaculoAEliminar = obstaculos.filter({objeto => objeto.estaFuera()}).first()
			obstaculos.remove(obstaculoAEliminar)
			game.removeVisual(obstaculoAEliminar)
		}else{
			obstaculos.forEach({objeto => objeto.position(objeto.position().down(1))})
		}
	}*/
	
}
