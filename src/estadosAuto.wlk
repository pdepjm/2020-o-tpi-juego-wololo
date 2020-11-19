import wollok.game.*
import carteles.*
class Estado{
	method afectar(vehiculo){
		if(not vehiculo.esAuto()){
			self.afectarDistinto(vehiculo)
		}else{
			self.afecta(vehiculo)
		}
	}
	method afecta(vehiculo){}
	method afectarDistinto(vehiculo){}
	
	method desafectar(vehiculo){
		if(vehiculo.esAuto()){
			self.desafecta(vehiculo)
		}
	}
	method desafecta(vehiculo){}
}

object nuevo inherits Estado{
	override method afecta(vehiculo)
	{
		vehiculo.cambiarEstado(primerChoque)
		vehiculo.image("assets/"+vehiculo.nombre()+"/PrimerCoque.png")
	}
	
}

object primerChoque inherits Estado{
	override method afecta(vehiculo)
	{
		vehiculo.cambiarEstado(chocado)
		vehiculo.image("assets/"+vehiculo.nombre()+"/Chocado.png")
	}
	override method desafecta(vehiculo)
	{
	 	vehiculo.cambiarEstado(nuevo)
		vehiculo.image("assets/"+vehiculo.nombre()+"/Nuevo.png")
	}
}

object chocado inherits Estado{
	override method afecta(vehiculo)
	{

		vehiculo.cambiarEstado(destruido)
		vehiculo.image("assets/"+vehiculo.nombre()+"/Destruido.png")
	}
	override method desafecta(vehiculo)
	{
	 	vehiculo.cambiarEstado(primerChoque)
		vehiculo.image("assets/"+vehiculo.nombre()+"/PrimerCoque.png")

	}
}

object destruido inherits Estado{
	override method afecta(vehiculo)
	{
		vehiculo.cambiarEstado(roto)
		vehiculo.estado().afecta(vehiculo)
		game.addVisual(loser)
	    game.schedule(1200, { game.stop()})	
	    
	}

}

object roto inherits Estado{
	override method afecta(vehiculo)
	{
		vehiculo.image("assets/"+vehiculo.nombre()+"/Roto.png")
		vehiculo.cambiarEstado(destruido)
	}
	
		override method desafecta(vehiculo)
	{
	 	vehiculo.cambiarEstado(chocado)
		vehiculo.image("assets/"+vehiculo.nombre()+"/Chocado.png")
	}
	

}