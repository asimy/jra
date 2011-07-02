module ApplicationHelper
  # def title
  #   base_title = "Juvenile Risk Assessment"
  #   if @title.nil?
  #     base_title
  #   else
  #     "#{base_title} | #{@title}"
  #   end
  # end
  def title(page_title)
    content_for(:title) {page_title}
  end
  
  def logo
    image_tag("logo.png", :alt => "Sample App", :class => "round")
  end
end
