object mariano {
	const bolsaDeGolosinas = [] 
	
	method comprar(golosina) {
		bolsaDeGolosinas.add(golosina)
	}
	
	method desechar(golosina) {
		bolsaDeGolosinas.remove(golosina)
	}
	
	method cantidadDeGolosinas() = bolsaDeGolosinas.size()
	
	method tieneLaGolosina(golosina) = bolsaDeGolosinas.contains(golosina)
	
	method golosinas() = bolsaDeGolosinas
	
	method probarGolosinas() { 
		bolsaDeGolosinas.forEach({ golosina => golosina.mordisco() })
	}
	
	method preciosCuidados() = bolsaDeGolosinas.all({ golosina => golosina.precio() <= 10 })
}

