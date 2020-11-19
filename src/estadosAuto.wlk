import wollok.game.*
import carteles.*
object nuevo {

	method afectar(vehiculo)
	{
		vehiculo.cambiarEstado(primerChoque)
		vehiculo.image("assets/"+vehiculo.nombre()+"/PrimerChoque.png")
	}
	method desafectar(vehiculo)
	{
		
	}
}

object primerChoque {

	method afectar(vehiculo)
	{
		vehiculo.cambiarEstado(chocado)
		vehiculo.image("assets/"+vehiculo.nombre()+"/Chocado.png")
	}
	method desafectar(vehiculo)
	{
	 	vehiculo.cambiarEstado(nuevo)
		vehiculo.image("assets/"+vehiculo.nombre()+"/Nuevo.png")
	}
}

object chocado {
	
	method afectar(vehiculo)
	{
		vehiculo.cambiarEstado(destruido)
		vehiculo.image("assets/"+vehiculo.nombre()+"/Destruido.png")
	}
	method desafectar(vehiculo)
	{
	 	vehiculo.cambiarEstado(primerChoque)
		vehiculo.image("assets/"+vehiculo.nombre()+"/PrimerChoque.png")
	}
}

object destruido {
		method afectar(vehiculo)
	{
		vehiculo.cambiarEstado(roto)
		vehiculo.image("assets/"+vehiculo.nombre()+"/Roto.png")
	}
	method desafectar(vehiculo)
	{
	 	vehiculo.cambiarEstado(chocado)
		vehiculo.image("assets/"+vehiculo.nombre()+"/Chocado.png")
	}
	
	
}

object roto {
	
	method afectar(vehiculo)
	{
		vehiculo.image("assets/"+vehiculo.nombre()+"/Roto.png")
		vehiculo.cambiarEstado(self)
		game.addVisual(loser)
	    game.schedule(1500, { game.stop()})
		
	}
	method desafectar(vehiculo)
	{
		
	}
	
	
}