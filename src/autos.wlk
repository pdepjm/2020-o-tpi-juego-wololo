import wollok.game.*
import escenario.*
import estadosAuto.*


class Vehiculo{
	var posicion
	var estado = nuevo
	var imagen
	var nombre 
	method nombre() = nombre
	method position() = posicion
	method image() = imagen
	method image(nuevaImagen)
	{
		imagen= nuevaImagen
	}
	method estado()=estado
	method cambiarEstado(nuevoEstado) {
		estado = nuevoEstado
	}
	method moverseA(nuevaPosicion) {
		const x = nuevaPosicion.x()
		if(x >= pista.limiteDer() and x <= pista.limiteIz()){
			posicion = nuevaPosicion
		}
	}
}

object autoRojo inherits Vehiculo {
		
	method configurar(){
	posicion = game.at(10, 2)
	imagen = "assets/AutoRojo/AutoNuevo.png"
	nombre = "AutoRojo"
	estado= nuevo
	}
	
	method destruirse() {	
		estado.afectar(self)
	}
	
	method explotar(){
        roto.afectar(self)
	}
	method reparar()
	{
		estado.desafectar(self)
	}
	
	method gana(){
		game.say(self,"¡¡Ganaste!!")
		game.schedule(500, { game.stop()})
	}
	
	method detenerse(){}
	method noAfectar(){}
}

object colision {

	var posicion
	var vehiculo= autoRojo
	 method moverseA(nuevaPosicion) {
		const x = nuevaPosicion.x()
		if(x >= pista.limiteDer()+1 and x <= pista.limiteIz()+1){
			posicion = nuevaPosicion
			
		}
	}
	method asignarVehiculo(nuevoVehiculo)
	{
		vehiculo=nuevoVehiculo
	}
	method image()="assets/Decor/colision.png"
	method position()= game.at(vehiculo.position().x()+1,vehiculo.position().y()+4)  
	
}

object camion inherits Vehiculo {
	method configurar(){
		posicion = game.at(10, 2)
		imagen = "camion.png"
		nombre="Camion"
		estado=nuevo
	}


	method destruirse() {
	}
	
	
	method explotar(){
        estado.afectar(self)
	}
	method reparar(){
	}
	
	method gana(){
		game.say(self,"¡¡Ganaste!!")
		game.schedule(500, { game.stop()})
	}
	
	method detenerse(){}
	method noAfectar(){}
}



