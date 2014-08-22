package com.allmusic


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * SongController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class SongController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Song.list(params), model:[songInstanceCount: Song.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Song.list(params), model:[songInstanceCount: Song.count()]
    }

    def show(Song songInstance) {
        respond songInstance
    }

    def create() {
        respond new Song(params)
    }

    @Transactional
    def save(Song songInstance) {
        if (songInstance == null) {
            notFound()
            return
        }

        if (songInstance.hasErrors()) {
            respond songInstance.errors, view:'create'
            return
        }

        songInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'songInstance.label', default: 'Song'), songInstance.id])
                redirect songInstance
            }
            '*' { respond songInstance, [status: CREATED] }
        }
    }

    def edit(Song songInstance) {
        respond songInstance
    }

    @Transactional
    def update(Song songInstance) {
        if (songInstance == null) {
            notFound()
            return
        }

        if (songInstance.hasErrors()) {
            respond songInstance.errors, view:'edit'
            return
        }

        songInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Song.label', default: 'Song'), songInstance.id])
                redirect songInstance
            }
            '*'{ respond songInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Song songInstance) {

        if (songInstance == null) {
            notFound()
            return
        }

        songInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Song.label', default: 'Song'), songInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'songInstance.label', default: 'Song'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
