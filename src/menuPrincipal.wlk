import wollok.game.*
import juego.*
import autos.*
import estadosAuto.*
object pantallaPrincipal {
	
	method configurar()
	{
		game.boardGround("assets/Fondo/pasto.jpg")
		game.title("Racing")
		game.width(20)
		game.height(20)
		game.addVisual(intro)
		intro.iniciar()
		game.start()
	}
	
}
object menu
{   const posicion= game.origin()
	const imagen= "assets/Fondo/menu.jpg"
	method position() = posicion
	method image() = imagen
	method seleccionar()
	{
		keyboard.left().onPressDo({game.clear() const autoRojo = new Vehiculo(posicion = game.at(10, 2),imagen = "assets/AutoRojo/Nuevo.png",nombre = "AutoRojo",estado= nuevoAuto) juego.asignarVehiculo(autoRojo) juego.iniciar()})
		keyboard.right().onPressDo({game.clear() const camion = new Vehiculo(posicion = game.at(10, 2),imagen = "assets/Camion/Nuevo.png",nombre = "Camion",estado= nuevoCamion) juego.asignarVehiculo(camion)  juego.iniciar()})
	}
}
object intro
{
	const posicion= game.origin()
	const imagen= "assets/Fondo/intro.jpg"
	method position() = posicion
	method image() = imagen
	method iniciar()
	{
		keyboard.enter().onPressDo({game.clear() game.addVisual(menu) menu.seleccionar() })
		
	}
}
