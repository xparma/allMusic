import com.allmusic.*
import com.allmusic.auth.*

class BootStrap {

    
    def springSecurityService
    def init = { servletContext ->
//        def artist = new Artist(name:'Metallica')
//        def album = artist.addToAlbums(new Album(name:'Black Album'))
//        artist.save()

//        def artist = new Artist(name:'Metallica').addToAlbums(new Album(name:'Black Album').addToSongs(name:'Enter Sadman')).save()

        def userRole = new Role(authority: 'ROLE_USER').save()
            userRole = new Role(authority: 'ROLE_ADMIN').save()

        def user = new User(username: 'admin', fullname: 'administrador', password: 'admin', enabled: true).save(failOnError: true)
            UserRole.create user, userRole, true
            
        def recurso = new Recursos (url:'/favorites/**',configAttribute:'ROLE_USER,ROLE_ADMIN').save()
        
        for (String url in [
            '/**/create',
            '/**/save','/**/save.*',
            '/**/edit',
            '/**/update','/**/update.*']) {
            recurso = new Recursos (url:url,configAttribute:'ROLE_ADMIN').save()
        }
            springSecurityService.clearCachedRequestmaps()
        def person = new Person(firstName:'Marcel', lastName:'Parma', address:'Los Caobos', email:'xparma@gmail.com', dateBirth:'23/09/1977', sex:'M')
            person.save(failOnError:true)
            
            new Person(firstName:'Gilberto', lastName:'Hernandez', address:'Los Caobos', email:'ghpant@gmail.com', dateBirth:'02/06/1975', sex:'M').save()
            new Person(firstName:'Rafael', lastName:'Esquivel', address:'The Big Sticks', email:'rafael.esquivel@gmail.com', dateBirth:'20/07/1976', sex:'F').save()
            
        def genre_rp = new Genre(name:'Rock Progressive').save()
        def genre_tm = new Genre(name:'Trash Metal').save()
            
        def artist = new Artist(name:'Metallica')

        def album = artist.addToAlbums(new Album(name:'Black Album',release:new Date('8/12/1990'),genre:genre_tm.id,label:'Elektra')
            .addToSongs(track:1,name:'Enter Sadman')
            .addToSongs(track:2,name:'Sad But True')
            .addToSongs(track:3,name:'Holier Than Thou')
            .addToSongs(track:4,name:'The Unforgiven')
            .addToSongs(track:5,name:'Wherever I May Roam')
            .addToSongs(track:6,name:'Don\'t Tread on Me')
            .addToSongs(track:7,name:'Through the Never')
            .addToSongs(track:8,name:'Nothing Else Matters')
            .addToSongs(track:9,name:'Of Wolf and Man')
            .addToSongs(track:10,name:'The God That Failed')
            .addToSongs(track:11,name:'My Friend of Misery')
            .addToSongs(track:12,name:'The Struggle Within')
        ).addToAlbums(new Album(name:'...And Justice For All',genre:genre_tm.id,label:'Elektra')
            .addToSongs(track:1,name:'Blackend')
        )
        artist.save()
        
        new Favorites(artist:artist.id,person:person.id,stars:4).save()
        
        artist = new Artist(name:'Tool')
        album = artist.addToAlbums(new Album(name:'Ænima',release:new Date('10/01/1996'),genre:genre_rp.id)
            .addToSongs(track:1,name:'Die Eier Von Satan')
            .addToSongs(track:2,name:'Cesaro Summability')
            .addToSongs(track:3,name:'Stinkfist')
            .addToSongs(track:4,name:'Ænima')
        )
        artist.save()
        

            
    }
    def destroy = {
    }
}
