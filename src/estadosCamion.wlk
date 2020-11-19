import wollok.game.*
import carteles.*
import autos.*


object impecable{
	
		method afectar()
	{
		camion.cambiarEstado(chocado)
	}
	method desafectar(){}

}

object chocado {
		method afectar()
	{
		game.addVisual(loser)
	    game.schedule(1200, { game.stop()})	
	    
	}
	method desafectar(){}

}
