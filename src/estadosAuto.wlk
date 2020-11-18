import wollok.game.*
object nuevo {
	const imagen = "assets/AutoRojo/AutoNuevo.png"
	const estadoAnterior = self
	const proximoEstado = primerChoque
	method imagen() = imagen
	method afectar(vehiculo)
	{
		vehiculo.cambiarEstado(proximoEstado)
		vehiculo.image("assets/"+vehiculo+"/AutoPrimerCoque.png")
	}
	method desafectar(vehiculo)
	{
		
	}
}

object primerChoque {
	const imagen = "assets/AutoRojo/AutoPrimerCoque.png"
	const estadoAnterior = nuevo
	const proximoEstado = chocado
	method imagen() = imagen
	method afectar(vehiculo)
	{
		vehiculo.cambiarEstado(proximoEstado)
		vehiculo.image("assets/"+vehiculo.nombre()+"/AutoChocado.png")
	}
	method desafectar(vehiculo)
	{
	 	vehiculo.cambiarEstado(estadoAnterior)
		vehiculo.image("assets/"+vehiculo.nombre()+"/AutoNuevo.png")
	}
}

object chocado {
	
	const estadoAnterior = primerChoque
	const proximoEstado = destruido
	method imagen() = "assets/AutoRojo/AutoChocado.png"
	method afectar(vehiculo)
	{
		vehiculo.cambiarEstado(proximoEstado)
		vehiculo.image("assets/"+vehiculo.nombre()+"/AutoDestruido.png")
	}
	method desafectar(vehiculo)
	{
	 	vehiculo.cambiarEstado(estadoAnterior)
		vehiculo.image("assets/"+vehiculo.nombre()+"/AutoPrimerCoque.png")
	}
}

object destruido {
	const imagen = "assets/AutoRojo/AutoDestruido.png"
	const estadoAnterior = chocado
	const proximoEstado = roto
	method imagen() = imagen
	method afectar(vehiculo)
	{
		vehiculo.cambiarEstado(proximoEstado)
		vehiculo.estado().afectar(vehiculo)
	}
	method desafectar(vehiculo)
	{
	 	vehiculo.cambiarEstado(estadoAnterior)
		vehiculo.image("assets/"+vehiculo.nombre()+"/AutoChocado.png")
	}
}

object roto {
	const imagen = "assets/AutoRojo/AutoRoto.png"
	const estadoAnterior = self
	const proximoEstado = self
	method imagen() = imagen
	method afectar(vehiculo)
	{
		vehiculo.image("assets/"+vehiculo.nombre()+"/AutoRoto.png")
		game.say(vehiculo,"Perdiste")
	    game.schedule(5000, { game.stop()})
		
	}
	method desafectar(vehiculo)
	{
		
	}
}