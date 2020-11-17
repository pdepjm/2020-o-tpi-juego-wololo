object autoNuevo {
	const imagen = "assets/AutoRojo/AutoNuevo.png"
	const estadoAnterior = self
	const proximoEstado = autoPrimerChoque
	method imagen() = imagen
	method estadoAnterior() = estadoAnterior
	method proximoEstado() = proximoEstado
}

object autoPrimerChoque {
	const imagen = "assets/AutoRojo/AutoPrimerCoque.png"
	const estadoAnterior = autoNuevo
	const proximoEstado = autoChocado
	method imagen() = imagen
	method estadoAnterior() = estadoAnterior
	method proximoEstado() = proximoEstado
}

object autoChocado {
	
	const estadoAnterior = autoPrimerChoque
	const proximoEstado = autoDestruido
	method imagen() = "assets/AutoRojo/AutoChocado.png"
	method estadoAnterior() = estadoAnterior
	method proximoEstado() = proximoEstado
}

object autoDestruido {
	const imagen = "assets/AutoRojo/AutoDestruido.png"
	const estadoAnterior = autoChocado
	const proximoEstado = autoRoto
	method imagen() = imagen
	method estadoAnterior() = estadoAnterior
	method proximoEstado() = proximoEstado
}

object autoRoto {
	const imagen = "assets/AutoRojo/AutoRoto.png"
	const estadoAnterior = self
	const proximoEstado = self
	method imagen() = imagen
	method estadoAnterior() = estadoAnterior
	method proximoEstado() = proximoEstado
}