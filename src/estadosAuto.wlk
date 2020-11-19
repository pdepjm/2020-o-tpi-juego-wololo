import wollok.game.*
import carteles.*
object nuevo {
	method afectar(vehiculo)
	{
<<<<<<< HEAD
		vehiculo.cambiarEstado(primerChoque)
		vehiculo.image("assets/"+vehiculo.nombre()+"/PrimerCoque.png")
=======
		vehiculo.cambiarEstado(proximoEstado)
		vehiculo.image("assets/"+vehiculo+"/PrimerChoque.png")
>>>>>>> branch 'master' of https://github.com/pdepjm/2020-o-tpi-juego-wololo.git
	}
	
	method desafectar(vehiculo){}
}

object primerChoque {
<<<<<<< HEAD
=======
	const imagen = "assets/AutoRojo/PrimerChoque.png"
	const estadoAnterior = nuevo
	const proximoEstado = chocado
	method imagen() = imagen
>>>>>>> branch 'master' of https://github.com/pdepjm/2020-o-tpi-juego-wololo.git
	method afectar(vehiculo)
	{
<<<<<<< HEAD
		vehiculo.cambiarEstado(chocado)
=======
		vehiculo.cambiarEstado(proximoEstado)
>>>>>>> branch 'master' of https://github.com/pdepjm/2020-o-tpi-juego-wololo.git
		vehiculo.image("assets/"+vehiculo.nombre()+"/Chocado.png")
	}
	method desafectar(vehiculo)
	{
<<<<<<< HEAD
	 	vehiculo.cambiarEstado(nuevo)
=======
	 	vehiculo.cambiarEstado(estadoAnterior)
>>>>>>> branch 'master' of https://github.com/pdepjm/2020-o-tpi-juego-wololo.git
		vehiculo.image("assets/"+vehiculo.nombre()+"/Nuevo.png")
	}
}

object chocado {
	method afectar(vehiculo)
	{
<<<<<<< HEAD
		vehiculo.cambiarEstado(destruido)
=======
		vehiculo.cambiarEstado(proximoEstado)
>>>>>>> branch 'master' of https://github.com/pdepjm/2020-o-tpi-juego-wololo.git
		vehiculo.image("assets/"+vehiculo.nombre()+"/Destruido.png")
	}
	method desafectar(vehiculo)
	{
<<<<<<< HEAD
	 	vehiculo.cambiarEstado(primerChoque)
		vehiculo.image("assets/"+vehiculo.nombre()+"/PrimerCoque.png")
=======
	 	vehiculo.cambiarEstado(estadoAnterior)
		vehiculo.image("assets/"+vehiculo.nombre()+"/PrimerChoque.png")
>>>>>>> branch 'master' of https://github.com/pdepjm/2020-o-tpi-juego-wololo.git
	}
}

object destruido {
	method afectar(vehiculo)
	{
		vehiculo.cambiarEstado(roto)
		vehiculo.estado().afectar(vehiculo)
	}
	method desafectar(vehiculo)
	{
<<<<<<< HEAD
	 	vehiculo.cambiarEstado(chocado)
=======
	 	vehiculo.cambiarEstado(estadoAnterior)
>>>>>>> branch 'master' of https://github.com/pdepjm/2020-o-tpi-juego-wololo.git
		vehiculo.image("assets/"+vehiculo.nombre()+"/Chocado.png")
	}
}

object roto {
	method afectar(vehiculo)
	{
		vehiculo.image("assets/"+vehiculo.nombre()+"/Roto.png")
<<<<<<< HEAD
	    game.schedule(1500, { game.stop()})	
	    game.addVisual(loser)
=======
		game.say(vehiculo,"Perdiste")
	    game.schedule(5000, { game.stop()})
		
>>>>>>> branch 'master' of https://github.com/pdepjm/2020-o-tpi-juego-wololo.git
	}
	
	method desafectar(vehiculo){}

}