import wollok.game.*
import escenario.*
import estadosAuto.*
import carteles.*
import estadosCamion.*


class Vehiculo{
	var posicion
	var property estado = nuevo
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
	
		method perderControl() {
		const posiciones = [pista.limiteIz(),pista.limiteDer()]
		const nuevaPosicion = posiciones.get(0.randomUpTo(2))
		posicion = game.at(nuevaPosicion, 2)
	}
	
		method gana(){
		game.schedule(1500, { game.stop()})
		game.addVisual(win)
	}
}

object autoRojo inherits Vehiculo {
		
	method configurar(){
	posicion = game.at(10, 2)
	imagen = "assets/AutoRojo/Nuevo.png"
	nombre = "AutoRojo"
	estado= nuevo
	}
	
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
		imagen = "assets/Camion/Nuevo.png"
		nombre="Camion"
		estado = impecable
	}
 

}
