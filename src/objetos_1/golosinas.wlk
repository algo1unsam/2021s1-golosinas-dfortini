object bombon {

	var peso = 15

	method precio() {
		return 5
	}

	method peso() {
		return peso
	}

	method mordisco() {
		peso = peso * 0.8 - 1
	}

	method gusto() {
		return frutilla
	}

	method libreGluten() {
		return true
	}

}

object alfajor {

	var peso = 300

	method precio() {
		return 12
	}

	method peso() {
		return peso
	}

	method mordisco() {
		peso = peso * 0.8
	}

	method gusto() {
		return chocolate
	}

	method libreGluten() {
		return false
	}

}

object caramelo {

	var peso = 5

	method precio() {
		return 1
	}

	method peso() {
		return peso
	}

	method mordisco() {
		peso = peso - 1
	}

	method gusto() {
		return frutilla
	}

	method libreGluten() {
		return true
	}

}

object chupetin {

	var peso = 7

	method precio() = 2

	method peso() = peso

	method mordisco() {
		peso = if (peso > 2) peso * 0.9 else peso
	}

	method gusto() = naranja

	method libreGluten() = true

}

object oblea {

	var peso = 250

	method precio() = 5

	method peso() = peso

	method mordisco() {
		peso = if (peso > 70) peso * 0.5 else peso * 0.75
	}

	method gusto() = vainilla

	method libreGluten() = false

}

object chocolatin {

	// hay que acordarse de *dos* cosas, el peso inicial y el peso actual
	// el precio se calcula a partir del precio inicial
	// el mordisco afecta al peso actual
	var pesoInicial
	var pesoActual

	/* al principio, el peso actual coincide con el inicial */
	method pesoInicial(cuanto) {
		pesoInicial = cuanto
		pesoActual = cuanto
	}

	method peso() = pesoActual

	method precio() = pesoInicial * 0.5

	method gusto() = chocolate

	method libreGluten() = false

	method mordisco() {
		pesoActual -= 2
	}

}

object golosinaBaniada {

	var golosinaBase
	var pesoBanio = 4

	method baniaA(unaGolosina) {
		golosinaBase = unaGolosina
	}

	method precio() = golosinaBase.precio() + 2

	method peso() = golosinaBase.peso() + pesoBanio

	method mordisco() {
		golosinaBase.mordisco()
		if (pesoBanio > 0) {
			pesoBanio -= 2
		}
	// otra forma de hacer la cuenta: pesoBanio = (pesoBanio - 2).max(0) 
	}

	method gusto() = golosinaBase.gusto()

	method libreGluten() = golosinaBase.libreGluten()

}

object tuttifrutti {

	var property libreGluten = true
	var gusto = frutilla

	method precio() = if (libreGluten) 7 else 10

	method peso() = 5

	method mordisco() {
		gusto = gusto.siguiente()
	}

	method gusto() = gusto
}

object frutilla {

	method siguiente() {
		return chocolate
	}

}

object chocolate {

	method siguiente() {
		return naranja
	}

}

object naranja {

	method siguiente() {
		return frutilla
	}

}

object vainilla {

	method siguiente() {
		return frutilla
	}

}

