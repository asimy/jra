module ApplicationHelper

  def title
    base_title = "Juvenile Risk Assessment"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def logo
    logo = image_tag("jra-logo.png", :alt => "Juvenile Risk Assessment", :class => "round")
  end

end
