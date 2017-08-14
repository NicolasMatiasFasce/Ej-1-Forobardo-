
object horacioPagani {
	var nivelDeEnojo

	method elevarVoz() {
		self.aumentarNivelDeEnojo(10)
	}

	method tomarAgua() {
		self.disminuirNivelDeEnojo(nivelDeEnojo * 0.1)
	}

	method calmarse(unosMinutos) {
		if (! self.estaCaliente()) {
			nivelDeEnojo = 0
		}
	}

	method estaCaliente() {
		return nivelDeEnojo > 20
	}

	method disminuirNivelDeEnojo(unaCantidad) {
		nivelDeEnojo = 0.max(nivelDeEnojo - unaCantidad)
	}

	method aumentarNivelDeEnojo(unaCantidad) {
		nivelDeEnojo += unaCantidad
	}

	method nivelDeEnojo(unValor) {
		nivelDeEnojo = unValor
	}
}

object totiPasman {
	var soberbia = 10
	var tieneSed = false

	method elevarVoz() {
		self.aumentarSoberbia(10)
		tieneSed = true
	}

	method tomarAgua() {
		tieneSed = false
	}

	method calmarse(unosMinutos) {
		self.disminuirSoberbia(unosMinutos * 2)
	}

	method disminuirSoberbia(unaCantidad) {
		soberbia -= unaCantidad
	}

	method aumentarSoberbia(unaCantidad) {
		soberbia += unaCantidad
	}
}

object lizzyTagliani {
	var humor = 10

	method elevarVoz() {
	}

	method tomarAgua() {
		humor *= 2
	}

	method calmarse(minutos) {
		if (self.estaDeMalhumor()) {
			self.aumentarHumor(minutos * 2)
		}
	}

	method aumentarHumor(cantidad) {
		humor += cantidad
	}

	method estaDeMalhumor() {
		return humor < 0
	}
}

describe "lizzyTagliani" {

	test "Lizzy Tagliani comienza con 10 de humor"{
		assert.equals( 10 , lizzyTagliani.humor() )
	}

	test "Lizzy Tagliani eleva la voz y no se modifica nada"{
		assert.equals( lizzyTagliani , lizzyTagliani.elevarVoz() )
	}

	test "Lizzy Tagliani toma agua y su humor queda en 20"{
		assert.equals( 20 , lizzyTagliani.tomarAgua() )
	}

	test "Lizzy Tagliani se calma 15 minutos estando con un mal humor de -20 y aumenta su humor en 30 quedando en 10"{
		lizzyTagliani.humor(-20)
		lizzyTagliani.calmarse(15)
		assert.equals( 10 , lizzyTagliani.humor() )
	}

	test "Lizzy Tagliani se calma 10 minutos estando de buen humor y no pasa nada"{
		lizzyTagliani.calmarse(10)
		assert.equals( 10 , lizzyTagliani.humor() )
	}

}
