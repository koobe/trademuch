package kgl

import org.springframework.security.core.Authentication
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler

class LogoutController {
	
	def grailsApplication
	
	def springSecurityService

    def index() {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth) {
			
			def agent = request.getHeader("User-Agent")

			if (springSecurityService.currentUser) {
				log.info "User logout: ${springSecurityService.currentUser.id}, user agent: ${agent}"

				def loginLog = new LoginLog(
						userId: springSecurityService.currentUser.id,
						loginType: 'logout',
						timestamp: new Date(),
						userAgent: agent,
						sessionId: session? session.id: null
				)

				loginLog.save flush: true
				log.info loginLog.errors
			}

			new SecurityContextLogoutHandler().logout(request, response, auth)
		}

		SecurityContextHolder.getContext().setAuthentication(null)
		
		redirect uri: "/"
	}
}
