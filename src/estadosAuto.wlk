import wollok.game.*
import carteles.*
import autos.*

object nuevo{
	method afectar()
	{
		autoRojo.cambiarEstado(primerChoque)
		autoRojo.image("assets/"+autoRojo.nombre()+"/PrimerCoque.png")
	}
	method desafectar(){}
}

object primerChoque{
	method afectar()
	{
		autoRojo.cambiarEstado(chocado)
		autoRojo.image("assets/"+autoRojo.nombre()+"/Chocado.png")
	}
	method desafectar()
	{
	 	autoRojo.cambiarEstado(nuevo)
		autoRojo.image("assets/"+autoRojo.nombre()+"/Nuevo.png")
	}
}

object chocado{
	method afectar()
	{
		autoRojo.cambiarEstado(roto)
		autoRojo.image("assets/"+autoRojo.nombre()+"/Destruido.png")
	}
	method desafectar()
	{
	 	autoRojo.cambiarEstado(primerChoque)
		autoRojo.image("assets/"+autoRojo.nombre()+"/PrimerCoque.png")

	}
}

object destruido {
	method afectar()
	{
		//vehiculo.cambiarEstado(roto)
		//vehiculo.estado().afecta(vehiculo)
		game.addVisual(loser)
	    game.schedule(1200, { game.stop()})	
	    
	}
	method desafectar(){}

}

object roto {
	method afectar()
	{
		autoRojo.image("assets/"+autoRojo.nombre()+"/Roto.png")
		autoRojo.cambiarEstado(destruido)
	}
	
	method desafectar()
	{
	 	autoRojo.cambiarEstado(chocado)
		autoRojo.image("assets/"+autoRojo.nombre()+"/Chocado.png")
	}
	

}