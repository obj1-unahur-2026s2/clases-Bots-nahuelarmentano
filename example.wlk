object benito {
  const listaNegra = ["bomba", "robar", "matar"] 

  method responder(usuario, tweet) {
    if (tweet.texto().any({palabra => listaNegra.contains(palabra)})){
      policia.registrar(usuario,tweet)
    }
  }
 }

object policia {
  const registros = []
  
  method registrar(usuario, tweet) {
    registros.add([usuario, tweet])
  }
  method registros() = registros
}

class BotDePublicidad {
  const palabraClave
  const mensaje
  const link
  const imagen = sinImagen

  method responder (usuario, tweet){
    if(tweet.texto().contains(palabraClave)){
    pdpwitter.agregarTweet(new Tweet(texto = [mensaje, link, "@" + usuario], imagen = imagen))
  }
 }
}

class BotRecolector {
  const datos = []
  method responder (usuario, tweet){datos.add([usuario, tweet])}
  method datos() = datos
}

object pdpwitter {
  const bots = []
  const tweets = [] 

  method tweets() = tweets
  method agregarTweet(tweet) { tweets.add(tweet) }
  method agregarBot(bot) {bots.add(bot)}

  method twittear (usuario, tweet) {
    if(tweet.texto().size() > 15){
    throw new Exception(message = "El tweet no puede contener mas de 15 palabras")
    }
    self.agregarTweet(tweet)
    bots.forEach({bot => bot.responder(usuario, tweet)})
  }
  method home(usuario) = tweets.filter({t => t.texto().contains("@" + usuario)})
  method tweetsALaNada() = tweets.filter({t => !t.texto().any({palabra => palabra.startsWith("@")})})
}

class Imagen {
  const nombre
  const bytes

  method nombre() = nombre
  method bytes() = bytes
}

object sinImagen {
  method nombre() = ""
  method bytes() = 0
}

class Tweet {
  const texto
  const imagen = sinImagen

  method texto() = texto
  method imagen() = imagen
  method pesoImagen() = imagen.bytes()
}

