import wollok.game.*
import carteles.*
class Estado
{
	method destruirse(vehiculo)
	{
		
	}
	method explotar(vehiculo){
		vehiculo.cambiarEstado(rotoAuto)
		vehiculo.image("assets/"+vehiculo.nombre()+"/Roto.png")
		game.addVisual(loser)
	    game.schedule(5000, { game.stop()})
	}
	
	method reparar(vehiculo)
	{

	}
}
object nuevoAuto inherits Estado
{
	override method destruirse(vehiculo) {	
		vehiculo.cambiarEstado(primerChoqueAuto)
		vehiculo.image("assets/"+vehiculo.nombre()+"/PrimerChoque.png")
	}
	
	
}
object primerChoqueAuto inherits Estado
{
        override method destruirse(vehiculo) {	
		vehiculo.cambiarEstado(chocadoAuto)
		vehiculo.image("assets/"+vehiculo.nombre()+"/Chocado.png")
	}
	override method reparar(vehiculo)
	{
	vehiculo.cambiarEstado(nuevoAuto)
		vehiculo.image("assets/"+vehiculo.nombre()+"/Nuevo.png")
	}
}

object chocadoAuto inherits Estado
{
	   override method destruirse(vehiculo) {	
		vehiculo.cambiarEstado(destruidoAuto)
		vehiculo.image("assets/"+vehiculo.nombre()+"/Destruido.png")
	}
	override method reparar(vehiculo)
	{
	vehiculo.cambiarEstado(primerChoqueAuto)
		vehiculo.image("assets/"+vehiculo.nombre()+"/PrimerChoque.png")
	}
}

object destruidoAuto inherits Estado
{
	override method destruirse(vehiculo) {	
		vehiculo.cambiarEstado(rotoAuto)
		self.explotar(vehiculo)
	}
	override method reparar(vehiculo)
	{
	vehiculo.cambiarEstado(chocadoAuto)
		vehiculo.image("assets/"+vehiculo.nombre()+"/Chocado.png")
	}
}

object rotoAuto inherits Estado
{
	override method destruirse(vehiculo) {	
		
		self.explotar(vehiculo)
	    
	}
}


object nuevoCamion inherits Estado
{
	override method explotar(vehiculo) {	
		vehiculo.cambiarEstado(primerChoqueCamion)
		vehiculo.image("assets/"+vehiculo.nombre()+"/PrimerChoque.png")
	}
	
	
}
object primerChoqueCamion inherits Estado
{
        override method explotar(vehiculo) {	
		vehiculo.cambiarEstado(chocadoCamion)
		vehiculo.image("assets/"+vehiculo.nombre()+"/Chocado.png")
	}
	
}

object chocadoCamion inherits Estado
{
	   override method explotar(vehiculo) {	
		vehiculo.cambiarEstado(destruidoCamion)
		vehiculo.image("assets/"+vehiculo.nombre()+"/Destruido.png")
	}
	
}

object destruidoCamion inherits Estado
{
	override method explotar(vehiculo) {	
		vehiculo.cambiarEstado(rotoCamion)
		vehiculo.estado().explotar(vehiculo)
	}
	
}

object rotoCamion inherits Estado
{
	 override method explotar(vehiculo){
		
		vehiculo.image("assets/"+vehiculo.nombre()+"/Roto.png")
		game.addVisual(loser)
	    game.schedule(5000, { game.stop()})
	}
	
}