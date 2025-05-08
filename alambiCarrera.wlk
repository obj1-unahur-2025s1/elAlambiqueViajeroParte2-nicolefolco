
object carrera {
    const inscriptos = []
    const rechazados = []
    var  ciudad = carreraBuenosAires

    method inscriptos() = inscriptos

    method definirCiudad(ciudadADesignar){
       ciudad = ciudadADesignar
    }

    method inscribir(vehiculo){
        if(ciudad.puedeCompetir(vehiculo)){
            inscriptos.add(vehiculo)
        }
        else {
            rechazados.add(vehiculo)
        }
    }
   
    method cambiarCiudadDestino(ciudadNueva){
     ciudad = ciudadNueva
     const nueva = rechazados + inscriptos
     inscriptos.clear()
     rechazados.clear()
     nueva.forEach({a => self.inscribir(a)})
    }

    method viajar(vehiculo){
      if(ciudad.puedeCompetir(vehiculo)){
        vehiculo.desgaste()
      }
    }
     
     method definirGanador(){
         return inscriptos.max({participantes => participantes.velocidad()})
     }


}

object carreraBuenosAires {
     method puedeCompetir(vehiculo) = vehiculo.esRapido() && vehiculo.tieneCombustible()
     
}

object carreraParis {
   method puedeCompetir(vehiculo) = vehiculo.puedeCircular()  && vehiculo.tieneCombustible()
}

object carreraBagdad {
    method puedeCompetir(vehiculo) = vehiculo.tieneCombustible()
}

object antiguallaBlindada {
       const puedeCircular = true
       var gangsters = #{"Giorno", "Mista", "Naranccia", "Bucciaratti", "Abbacchio", "Diavolo", "Trish"}
       var velocidad = gangsters.sum({gangsters => gangsters.length()})
       var combustible = 200
       var consumoPorCarrera = 150
       var esRapido = true

       method puedeCircular() = puedeCircular

       method rapido() = esRapido
   
       method tieneCombustible(){
        return combustible >= 200
       }

       method velocidad() = velocidad
       
       method salirDelVehiculo(gangster){
        gangsters.remove(gangster)
      }

       method entrarAlVehiculo(gangster){
        gangster.add(gangster)
       }
   
      method desgaste(){
        combustible = combustible - consumoPorCarrera
      }


}

object tortugaDePierre{
   var velocidad = 70
   var combustible = 250
   var consumoPorCarrera = 100
   var esRapido = true
   const puedeCircular = true
   
   method puedeCircular() = puedeCircular

   method rapido() = esRapido

    method velocidad() = velocidad

    method chariotAtaca(){
        // polnareff le da un pinchazo al ojo del conductor de la derecha
        self.reducirVelocidad(30)
    }
   
    method lanzarSillaDeRuedas(){
        // polnareff le lanza su silla de ruedas al contrincante de la izquierda
        self.reducirVelocidad(35)
    }

    method reducirVelocidad(cantidad){
      velocidad = velocidad - cantidad
    }

    
       method tieneCombustible(){
        return combustible >= 200
       }

     method desgaste(){
        combustible = combustible - consumoPorCarrera
      }

 
 }
