import wollok.game.*
import juego.*
object pantallaPrincipal {
	
	method configurar()
	{
		game.boardGround("assets/Fondo/pasto.jpg")
		game.title("Race")
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
		keyboard.left().onPressDo({game.clear() juego.iniciar()})
	}
}