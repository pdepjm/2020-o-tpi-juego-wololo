import wollok.game.*

object win {
	const property position= game.at(5,10)
	var imagen = "assets/You_Win/Header.png" 
	method image() = imagen
}
object loser {
	const property position = game.at(5,10)
	var imagen = "assets/You_Lose/Header.png"
	method image() = imagen
}
