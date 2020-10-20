import wollok.game.*
import obstaculos.*
const obstaculosPosibles = ["destructivo","pacifico","explosivo","manipilador"]
object pista {
	const obstaculos = []
	var contador = 0
	var limiteDer = 5
	var limiteIz = 13
	var obstaculo 
	var property position= game.origin()
	
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
		contador++
		if(contador == 44 or contador == 46 or contador == 48){
		 	self.aumentarLimiteDer()
		 	self.reducirLimiteIz()
		}else if(contador == 53 or contador == 55 or contador == 57){
		 	self.reducirLimiteDer()
		 	self.aumentarLimiteIz()
		} 
	}

	method image() {
		return "assets/Pistas/Pista_2.png"
	}
	method choque(unAuto) {
	}
	method obstaculoAElegir(tipo){
		if(tipo == "destructivo"){
			obstaculo = new Piedra(position = game.at(5.randomUpTo(14), 19),nombre = "piedra")
		}else if(tipo == "pacifico"){
			obstaculo = new Planta(position = game.at(5.randomUpTo(14), 19),nombre = "Tree")
		}else if(tipo == "explosivo"){
			obstaculo = new Barril(position = game.at(5.randomUpTo(14), 19),nombre = "Barril")
		}else if(tipo == "manipulador"){
			obstaculo = new Aceite(position = game.at(5.randomUpTo(14), 19),nombre = "Aceite")
		}	
	}
	method crearObstaculo(){
		self.obstaculoAElegir(obstaculosPosibles.get(0.randomUpTo(4)))
		obstaculos.add(obstaculo)
		game.addVisual(obstaculo)
	}
	method moverObstaculos(){
		if(obstaculos.any({objeto => objeto.estaFuera()})){
			const obstaculoAEliminar = obstaculos.filter({objeto => objeto.estaFuera()}).first()
			obstaculos.remove(obstaculoAEliminar)
			game.removeVisual(obstaculoAEliminar)
		}else{
			obstaculos.forEach({objeto => objeto.position(objeto.position().down(1))})
		}
	}
}
