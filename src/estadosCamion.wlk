import wollok.game.*
import carteles.*
import autos.*

object nuevo {
	
		method afectar()
	{
		camion.cambiarEstado(destruido)
		camion.image("assets/"+camion.nombre()+"/PrimerCoque.png")
	}
	
}

object destruido{
		method afectar(vehiculo)
	{
		game.addVisual(loser)
	    game.schedule(1200, { game.stop()})	
	    
	}
}
