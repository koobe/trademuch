package kgl

import grails.converters.JSON

class StatusController {

    def index() {

        def result = ['ok']

        render result as JSON
    }
}
