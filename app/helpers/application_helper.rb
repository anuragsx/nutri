module ApplicationHelper
	def selected_menu(controller, page)
		if (controller.controller_name == "home" && controller.action_name == 'about' && page == 'about')
        	return "selected"
        elsif (controller.controller_name == "home" && controller.action_name == 'index' && page == 'home')
        	return "selected"
        elsif (controller.controller_name == "home" && controller.action_name == 'nutritionist_online' && page == 'online')
        	return "selected"	
        elsif (controller.controller_name == "home" && controller.action_name == 'services' && page == 'services')
        	return "selected"
        elsif (controller.controller_name == "home" && controller.action_name == 'blog' && page == 'blog')
                return "selected"                
        elsif (controller.controller_name == "home" && controller.action_name == 'service_details' && page == 'services')
        	return "selected"		
		end				
	end	
end