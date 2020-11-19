import wollok.game.*
import carteles.*

object nuevo {
	
		method afectar(vehiculo)
	{
		vehiculo.cambiarEstado(destruido)
		vehiculo.image("assets/"+vehiculo.nombre()+"/PrimerCoque.png")
	}
	
}

object destruido{
		method afectar(vehiculo)
	{
		vehiculo.cambiarEstado(nuevo)
		vehiculo.estado().afecta(vehiculo)
		game.addVisual(loser)
	    game.schedule(1200, { game.stop()})	
	    
	}
}
