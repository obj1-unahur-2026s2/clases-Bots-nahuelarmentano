object benito {
  const listaNegra = ["bomba", "robar", "matar"] 

  method responder(usuario, tweet) {
    if (tweet.any({palabra => listaNegra.contains(palabra)})){
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

  method responder (usuario, tweet){
    if(tweet.contains(palabraClave))
    pdpwitter.agregarTweet([mensaje, link, "@" + usuario])
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

  method twittear (usuario, tweet) {
  
  }
}