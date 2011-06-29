class ResponseSet < ActiveRecord::Base
  include Surveyor::Models::SurveyMethods
  def title
    "Custom #{super}"
  end
  
end