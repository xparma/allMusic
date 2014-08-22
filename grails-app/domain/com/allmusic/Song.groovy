package com.allmusic

class Song {

/* Default (injected) attributes of GORM */
        String name
        Integer track
	Album album
	/* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated
	
//	static	hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static	hasMany		= [albums:Album]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
        static	belongsTo	= [Album]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static	mappedBy	= []	// specifies which property should be used in a mapping 
	
    static	mapping = {
        id generator:'sequence', params:[sequence:'seq_song_id']
        track nullable:false, blank: false
        name nullable:false 
    }
    
	static	constraints = {
            track unique:"album", min:1, max: 100
            name size:1..50
    }
	
	/*
	 * Methods of the Domain Class
	 */
	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${name}";
	}
        
    	public String toTrack() {
		return "${track} ${name}";
	}
}
