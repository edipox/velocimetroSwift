//: Playground - noun: a place where people can play


/*
 Crea un playground que contenga los elementos para representar un velocímetro de un automóvil. Recuerda que estamos practicando la programación orientada a objetos y primero debes diseñar la clase, enumeraciones o estructuras para llevarlas a un aplicación móvil. ¿Qué debes de realizar?
 
 Declara la enumeración: Velocidades, sus valores serán de tipo Int.
 
 La enumeración Velocidades cuenta con los siguientes elementos y sus respectivos valores:
 
 - Apagado = 0, representa la velocidad 0.
 
 - VelocidadBaja = 20, representa una velocidad de 20km por hora.
 
 - VelocidadMedia = 50, representa una velocidad de 50km por hora
 
 - VelocidadAlta = 120, representa una velocidad de 50km por hora.
 
 - Además, debes de declarar un inicializador que recibe un velocidad:
 
 - init( velocidadInicial : Velocidades )
 
 - El inicializador se debe asignar a self el valor de velocidadInicial
*/

enum Velocidades : Int{
    case Apagado = 0,
    VelocidadBaja = 20,
    VelocidadMedia = 50,
    VelocidadAlta = 120
    init( velocidadInicial : Velocidades ){
        self = velocidadInicial
    }
    func siguienteVelocidad() -> Velocidades{
        var result : Velocidades
        switch self {
            case Apagado: result = VelocidadBaja
            case VelocidadBaja: result = VelocidadMedia
            case VelocidadMedia: result = VelocidadAlta
            case VelocidadAlta: result = VelocidadMedia
        }
        return result
    }
    
    func enCadena() -> String{
        var result : String
        switch self {
            case Apagado: result = "Apagado"
            case VelocidadBaja: result = "Velocidad baja"
            case VelocidadMedia: result = "Velocidad media"
            case VelocidadAlta: result = "Velocidad alta"
        }
        return result
    }
}


/*
 Declara la clase: Auto
 
 La clase Auto tiene los siguientes atributos:
 
 - Una variable que sea una instancia de la enumeración Velocidades, llamada: velocidad.
 
 Las funciones o métodos que define la clase Auto son las siguientes:
 
 - init( ), agrega la función inicializadora que crea una instancia de Velocidades: velocidad, debe iniciar en Apagado. Recuerda que la enumeración tiene su función inicializadora.
 
 - func cambioDeVelocidad( ) -> ( actual : Int, velocidadEnCadena: String), la función cambioDeVelocidad, cambia el valor de velocidad a la siguiente velocidad gradual, por ejemplo: Apagado cambia a VelocidadBaja, de VelocidadBaja cambia a VelocidadMedia, es decir cada ejecución cambia a la siguiente velocidad.. si llega a VelocidadAlta cambia a VelocidadMedia. Finalmente, la función debe regresar una tupla con la velocidad actual y una cadena con la leyenda de la velocidad correspondiente.
 */
class Auto {
    var velocidad : Velocidades
    init(){
        velocidad = Velocidades(velocidadInicial: Velocidades.Apagado)
    }
    func cambioDeVelocidad() -> (actual: Int, velocidadEnCadena: String){
        velocidad = velocidad.siguienteVelocidad()
        return (actual: velocidad.rawValue, velocidadEnCadena: velocidad.enCadena())
    }
}

/*
 Pruebas de la clase:
 
 - En el mismo playground prueba crea una instancia de la clase Auto, llamada auto.
 
 - Itera 20 veces usando un for, llama a la función cambioDeVelocidad e imprime los valores de la tupla en la consola.
 
 - Una salida válida con cinco iteraciones es:
 
 0 , Apagado <- Este caso en realidad nunca se imprime dado que se cambia la velocidad antes
 
 20, Velocidad baja
 
 50, Velocidad media
 
 120, Velocidad alta
 
 50, Velocidad media
 
 120, Velocidad alta
 
 50, Velocidad media
 
 120, Velocidad alta
 
 50, Velocidad media
 
 … etc.
 */

let auto : Auto = Auto()

for i in 0...20 {
    let (actual, velocidadEnCadena) = auto.cambioDeVelocidad()
    print("\(actual), \(velocidadEnCadena)")
}
