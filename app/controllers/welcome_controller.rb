# By convention all controller classes are named with 'Controller' at the end of the class name
# It does that automatically. The terminal command here was: rails g controller welcome
# Also the file name is important: it should match the class name with snake case convention.
#By default, rails controller inherits from 'ApplicationController'

class WelcomeController < ApplicationController


  # When we want to create a page or do something in our controller we define
# public methods and we call them: Actions
  def index
    #render 'welcome/index' # points to the index.html.erb file in the views - welcome map. Check it in the browser. First do: rails s in the terminal  to make the server start listening. See also the routes.rb file !! Must point to the index file.
    #Actually: Th line above is redundent in this case, because the default behavior for all controller actions is to render:
    # CONTROLLER_FOLDER/ACTION.FORMAT.TEMPLATE_SYSTEM
   # CONTROLLER_FOLDER is just the controller name without the _controller
   #                   and is located inside the `views` folder
   # ACTION            in this case is `index`
   # FORMAT            defaults to HTML (later we can use JSON, XML or others)
   # TEMPLATE_SYSTEM   defaults to ERB (others available such as SLIM & HAML)
 end

 def contact
   # by default this will render: /app/views/welcome/contact.html/erb
 end

 def submit
   # by default this will render: /app/views/welcome/submit.html/erb
   # so create that page
   # you have access to a variable called 'params' that includes all the parameters with the HTTP request. Params is a hash that i accessible with strings or symbols as keys:
   @name = params[:name]
 end

end
