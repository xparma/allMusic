package com.allmusic

class Artist {
    
    String name
    
    static hasMany = [albums: Album]

    static constraints = {
    }
    
    /**
    *  Esto es porque Hibernate no carga en memoria los objetos Album de un Artist
    *  hasta que explicitamente naveguemos por la colección (carga perezosa).
    */
    static mapping = {
      //albums fetch:"join"
      id generator:'sequence', params:[sequence:'seq_artist_id']
    }
    
    public String toString(){
        return "${name}"
    }
}
