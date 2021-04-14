import golosinas.*

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
		bolsaDeGolosinas.forEach({ golosina => golosina.mordisco()})
	}

	method hayGolosinaSinTACC() {
		bolsaDeGolosinas.any({ golosina => golosina.libreGluten()})
	}

	method preciosCuidados() = bolsaDeGolosinas.all({ golosina => golosina.precio() <= 10 })

	method golosinaDeSabor(unSabor) {
		return bolsaDeGolosinas.find({ golosina => golosina.gusto().equals(unSabor) })
	}

	method golosinasDeSabor(unSabor) {
		return bolsaDeGolosinas.filter{ golosina => golosina.gusto().equals(unSabor) }
	}

	method sabores() {
		return bolsaDeGolosinas.map{ golosina => golosina.gusto() }.asSet()
	}

	method golosinaMasCara() {
		return bolsaDeGolosinas.max{ golosina => golosina.precio() }
	}

	method pesoGolosinas() {
		return bolsaDeGolosinas.sum{ golosina => golosina.peso() }
	}

	method golosinasFaltantes(golosinasDeseadas) {
		return golosinasDeseadas.filter({ golosinaDeseada => not bolsaDeGolosinas.contains(golosinaDeseada) })
	}

	method gustosFaltantes(gustosDeseados) {
		return gustosDeseados.asSet().difference(self.sabores())
//		return gustosDeseados.filter{ gusto => not self.sabores().contains(gusto)}
	}

	method gastoEn(sabor) {
		self.golosinasDeSabor(sabor).sum{ golosina => golosina.precio()}
	}

	/*
	 * saborMasPopular(): del que tiene más golosinas.
	 * Acá sí que se complica.
	 * Pista: puede tener sentido agregar un método auxiliar, que devuelva la cantidad de golosinas de un sabor.
	 */
	method saborMasPopular() { // Devuelve el sabor que mas hay entre todas las golosinas.
		const sabores = bolsaDeGolosinas.map({ golosina => golosina.gusto() })
		return sabores.max({ sabor => self.cantidadGolosinas(sabor) })
	}

	method saborMasPesado() { // Hacer tests
		const sabores = bolsaDeGolosinas.map({ golosina => golosina.gusto() })
		return sabores.max{ sabor => self.pesoTotal(sabor) }
	}

	// Pista: puede tener sentido agregar un método auxiliar, que devuelva la cantidad de golosinas de un sabor.
	// ¿cuántas golosinas tengo de un sabor dado??
	method cantidadGolosinas(unSabor) {
		return self.golosinasDeSabor(unSabor).size()
	}

	method pesoTotal(unSabor) {
		return self.golosinasDeSabor(unSabor).sum{ golosina => golosina.peso() }
	}

}

