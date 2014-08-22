package com.allmusic

/**
 * Favorites
 * A domain class describes the data object and it's mapping to the database
 */
class Favorites implements Serializable {

	/* Default (injected) attributes of GORM */
//	Long	id
//	Long	version

//        Person person
        Person person
        Artist artist
        Integer stars
	
	/* Automatic timestamping of GORM */
	Date	dateCreated
	Date	lastUpdated
	
//	static	belongsTo	= [artist:Artist]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static	hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static	hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static	mappedBy	= []	// specifies which property should be used in a mapping 
	
    static	mapping = {
//        id generator:'sequence', params:[sequence:'seq_favorites_id']
          id composite : ['person','artist']
          version false
    }
    
	static	constraints = {
//            artist unique:true
          artist nullable:false
          person nullable:false
          stars nullable:true,blank:true,range:1..5
          person unique:"artist"
    }
  
//         static def get(String id) {                
//        find 'from UsuarioRol where usuario.id=? and rol.id=?',
//        Eval.me(id)
//    }
    
        String getId(){
            "[${person?.id}L,${artist?.id}L]"
        }
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${artist.name} - ${person.firstName} ${person.lastName}";
	}
}
