import wollok.game.*
import escenario.*
import estadosAuto.*
import carteles.*

class Vehiculo{
	var posicion
	var estado 
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
	
	method gana(){
		game.addVisual(win)
		game.schedule(500, { game.stop()})
	}
	
	method perderControl() {
		const posiciones = [pista.limiteIz(),pista.limiteDer()]
		const nuevaPosicion = posiciones.get(0.randomUpTo(2))
		posicion = game.at(nuevaPosicion, 2)
	}
	
	
	method destruirse() {	
		estado.afectar(self)
	}
	
	method explotar(){
		self.cambiarEstado(roto)
        estado.afectar(self)
	}
	method reparar()
	{
		estado.desafectar(self)
	}
}

object autoRojo1 inherits Vehiculo {
		
	method configurar(){
	posicion = game.at(10, 2)
	imagen = "assets/AutoRojo/Nuevo.png"
	nombre = "AutoRojo"
	estado= nuevo
	}
	
	
	
	
}

object colision {

	var posicion
	var vehiculo
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

class Camion inherits Vehiculo {
	method configurar(){
		posicion = game.at(10, 2)
		imagen = "assets/Camion/Nuevo.png"
		nombre="Camion"
		estado=nuevo
	}


	 override method destruirse() {
	}
	
	
	override method explotar(){
        estado.afectar(self)
	}
	override method reparar(){
	}
	
	
}



