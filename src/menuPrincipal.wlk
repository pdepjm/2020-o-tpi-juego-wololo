import wollok.game.*
import juego.*
import autos.*
object pantallaPrincipal {
	
	method configurar()
	{
		game.boardGround("assets/Fondo/pasto.jpg")
		game.title("Racing")
		game.width(20)
		game.height(20)
		game.addVisual(menu)
		menu.seleccionar()
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
		keyboard.left().onPressDo({game.clear() juego.asignarVehiculo(autoRojo) juego.iniciar()})
		keyboard.right().onPressDo({game.clear() juego.asignarVehiculo(camion)  juego.iniciar()})
	}
}