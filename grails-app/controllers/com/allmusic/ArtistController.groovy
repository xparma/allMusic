package com.allmusic


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.*

/**
 * ArtistController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class ArtistController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Artist.list(params), model:[artistInstanceCount: Artist.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Artist.list(params), model:[artistInstanceCount: Artist.count()]
    }

    def show(Artist artistInstance) {
        respond artistInstance
    }

    def create() {
        respond new Artist(params)
    }

    @Transactional
    def save(Artist artistInstance) {
        if (artistInstance == null) {
            notFound()
            return
        }

        if (artistInstance.hasErrors()) {
            respond artistInstance.errors, view:'create'
            return
        }

        artistInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'artistInstance.label', default: 'Artist'), artistInstance.id])
                redirect artistInstance
            }
            '*' { respond artistInstance, [status: CREATED] }
        }
    }

    def edit(Artist artistInstance) {
        respond artistInstance
    }

    @Transactional
    def update(Artist artistInstance) {
        if (artistInstance == null) {
            notFound()
            return
        }

        if (artistInstance.hasErrors()) {
            respond artistInstance.errors, view:'edit'
            return
        }

        artistInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Artist.label', default: 'Artist'), artistInstance.id])
                redirect artistInstance
            }
            '*'{ respond artistInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Artist artistInstance) {

        if (artistInstance == null) {
            notFound()
            return
        }

        artistInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Artist.label', default: 'Artist'), artistInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'artistInstance.label', default: 'Artist'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    
    def listaXml = {
        def l = Artist.list()
        render l as XML
    }
    
    def listaJSON = {
        def l = Artist.list()
        render l as JSON
    }
}
