package com.allmusic

class Album {

    String name
    Date release
    Integer getYear(){
        def c = Calendar.instance
        if (release){
          c.time = release
          c.get(Calendar.YEAR)  
        }else{
          null
        }
    }
    String label
    
    Genre genre
    Artist artist
    
    static transients = ['year']
    
    static belongsTo = [Artist]
    static hasMany = [songs:Song]

    static constraints = {
       artist nullable:false
       name nullable:false, blank:false
       release nullable:true,  max : new Date()
       label nullable:true
       genre nullable:true
    }
    
    static mapping = {
        id generator:'sequence', params:[sequence:'seq_album_id']
    }

    
    public String toString(){
        return "${artist.name} - ${name}"
    }
}
