package kgl

import grails.converters.JSON
import org.scribe.model.Token

class FacebookController {

    def oauthService
    def grailsApplication
    def springSecurityService

    private final static String FACEBOOK_API_URL = "https://graph.facebook.com/me"

    /**
     * allow admin permissions for these email accounts
     */
    private final static ADMIN_EMAILS = ['lyhcode@gmail.com']

    def success() {

        Token token = (Token) session[oauthService.findSessionKeyForAccessToken('facebook')]

        def response = oauthService.getFacebookResource(token, FACEBOOK_API_URL)
        def resource = JSON.parse(response.body)

        // Sample
        log.info(resource)

        User user = User.findByAuthTypeAndFacebookId("FACEBOOK", resource.id)

        if (!user) {
            log.info("Create a new user domain class from facebook account data")

            def roleUser = Role.findOrSaveByAuthority('ROLE_USER')
            def roleAdmin = Role.findOrSaveByAuthority('ROLE_ADMIN')

            user = new User(
                    fullName: resource.name,
                    email: resource.email,
                    username: resource.username?:"facebook_${resource.id}",
                    password: new Date().time,
                    authType: 'FACEBOOK',
                    facebookId: resource.id,
                    facebookUrl: resource.link,
                    enabled: true
            )
            user.save(failOnError: true, flush: true)

            UserRole.create(user, roleUser)

            // todo: also for existing user entities
            if (ADMIN_EMAILS.contains(resource.email)) {
                UserRole.create(user, roleAdmin)
            }
        }

        // Update geolocation
//        def location = session['geolocation']
//        if (location && location.lon && location.lat) {
//            if (!user.location) {
//                user.location = new GeoPoint()
//            }
//
//            user.location.lat = location.lat?.toDouble()
//            user.location.lon = location.lon?.toDouble()
//
//            log.info "Update Geo Location for ${user.username} with lat = ${location.lat}, lon = ${location.lon}"
//
//            user.location.save(flush: true)
//            user.save(flush: true)
//        }

        // Update sso token for user
        if (session['sso_token']) {
            user.ssoToken = session['sso_token']

            user.save flush: true
        }

        springSecurityService.reauthenticate user.username
		
		def agent = request.getHeader("User-Agent")
		def loginLog = new LoginLog(
			userId: springSecurityService.currentUser.id,
			loginType: 'login',
			loginMethod: 'facebook',
			timestamp: new Date(),
			userAgent: agent,
			sessionId: session? session.id: null
		)

		loginLog.save flush: true

        log.info loginLog.errors
		
//		// if redirect to...
//        if (session['sso_redirect']) {
//            def uri = session['sso_redirect']
//
//            session['sso_redirect'] = null
//
//            //log.info "${session['redirect2']}"
//
//            if ("${uri}".indexOf('[SSO_FB_TOKEN]') >= 0) {
//                uri = "${uri}".replace('[SSO_FB_TOKEN]', session['facebook:oasAccessToken']?.token)
//            }
//
//            log.info "sso redirect to ${uri}"
//
//            redirect uri: uri
//        }
//		else if (session['redirect_logged']) {
//
//            def uri = session['redirect_logged']
//
//            log.info "redirect to ${uri}"
//
//			session['redirect_logged'] = null
//
//            redirect uri: uri
//		}
//        else {
//          redirect uri: "/"
//		}


        redirect uri: "/explore"
    }
}
