module SurveyorControllerCustomMethods
  require 'devise'
  def self.included(base)
    base.send :before_filter, :authenticate_user!
    # load_and_authorize_resource #devise
    
    # base.send :before_filter, :require_user   # AuthLogic
    # base.send :before_filter, :login_required  # Restful Authentication
    # base.send :layout, 'surveyor_custom'
  end

  # Actions
  def new
    super
    # @title = "You can take these surveys"
  end
  def create
    super
  end
  def show
    super
  end
  def edit
    super
  end
  def update
    super
  end
  
  # Paths
  def surveyor_index
    # most of the above actions redirect to this method
    super # available_surveys_path
  end
  def surveyor_finish
    # the update action redirects to this method if given params[:finish]
    super # available_surveys_path
  end
end
class SurveyorController < ApplicationController
<<<<<<< HEAD
  
=======
>>>>>>> parent of 08588aa... Adding users, clients and completely non-functional screening tools
  include Surveyor::SurveyorControllerMethods
  include SurveyorControllerCustomMethods
end
