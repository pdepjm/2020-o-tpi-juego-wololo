object autoNuevo {
	const imagen = "assets/AutoRojo/AutoNuevo.png"
	const estadoAnterior = self
	const proximoEstado = autoPrimerChoque
	method image() = imagen
	method estadoAnterior() = estadoAnterior
	method proximoEstado() = proximoEstado
}

object autoPrimerChoque {
	const imagen = "assets/AutoRojo/AutoPrimerChoque.png"
	const estadoAnterior = autoNuevo
	const proximoEstado = autoChocado
	method image() = imagen
	method estadoAnterior() = estadoAnterior
	method proximoEstado() = proximoEstado
}

object autoChocado {
	const imagen = "assets/AutoRojo/AutoChocado.png"
	const estadoAnterior = autoPrimerChoque
	const proximoEstado = autoDestruido
	method image() = imagen
	method estadoAnterior() = estadoAnterior
	method proximoEstado() = proximoEstado
}

object autoDestruido {
	const imagen = "assets/AutoRojo/AutoDestruido.png"
	const estadoAnterior = autoChocado
	const proximoEstado = autoRoto
	method image() = imagen
	method estadoAnterior() = estadoAnterior
	method proximoEstado() = proximoEstado
}

object autoRoto {
	const imagen = "assets/AutoRojo/AutoRoto.png"
	const estadoAnterior = autoDestruido
	const proximoEstado = self
	method image() = imagen
	method estadoAnterior() = estadoAnterior
	method proximoEstado() = proximoEstado
}