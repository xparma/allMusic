package com.allmusic


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * FavoritesController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class FavoritesController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Favorites.list(params), model:[favoritesInstanceCount: Favorites.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Favorites.list(params), model:[favoritesInstanceCount: Favorites.count()]
    }

    def show() {
        //print params.id
        Favorites favoritesInstance=Favorites.find('from Favorites where person.id=? and artist.id=?',Eval.me(params.id))
        respond favoritesInstance
    }

    def create() {
        respond new Favorites(params)
    }

    @Transactional
    def save(Favorites favoritesInstance) {
        if (favoritesInstance == null) {
            notFound()
            return
        }

        if (favoritesInstance.hasErrors()) {
            respond favoritesInstance.errors, view:'create'
            return
        }

        
        try{
            favoritesInstance.save flush:true
        }catch(org.springframework.dao.DuplicateKeyException err){
            //            print favoritesInstance.errors.errorCount + " LIVING!"
            flash.error = "Ya existe el código ${favoritesInstance}"
            redirect(action:'create')//,id:favoritesInstance.id)
            //            redirect(action:'list')
            return
            //        }catch(org.hibernate.NonUniqueObjectException err){
            //            print favoritesInstance.errors.errorCount + " COLOUR!"
            //            render err
            //            flash.message = "Ya existe uno así 2"
            //            return
        }

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'favoritesInstance.label', default: 'Favorites'), ""]) //entre comillas favoritesInstance.id
                redirect favoritesInstance
            }
            '*' { respond favoritesInstance, [status: CREATED] }
        }
    }

    def edit() {
        Favorites favoritesInstance=Favorites.find('from Favorites where person.id=? and artist.id=?',Eval.me(params.id))
        respond favoritesInstance
    }

    @Transactional
    def update() {
        
        Favorites favoritesInstance=Favorites.find('from Favorites where person.id=? and artist.id=?',Eval.me(params.id))
        
        favoritesInstance.properties = params  //asigna los valores del html a la instancia
            
        if (favoritesInstance == null) {
            notFound()
            return
        }
        
        favoritesInstance.validate() //valida los constrains del dominio

        if (favoritesInstance.hasErrors()) {
            respond favoritesInstance.errors, view:'edit'
            return
        }
        //print favoritesInstance.properties
        favoritesInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Favorites.label', default: 'Favorites'), favoritesInstance])
                redirect favoritesInstance
            }
            '*'{ respond favoritesInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Favorites favoritesInstance) {

        if (favoritesInstance == null) {
            notFound()
            return
        }

        favoritesInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Favorites.label', default: 'Favorites'), favoritesInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'favoritesInstance.label', default: 'Favorites'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
