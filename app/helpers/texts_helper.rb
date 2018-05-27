module TextsHelper
  def status_label(text)
  	if Time.now - text.created_at < 60*60*24*7
  	  content_tag(:span, 'NEW', class: "label label-warning")
  	elsif Time.now - text.updated_at < 60*60*24*7
  	  content_tag(:span, 'UPDATE', class: "label label-info")
    end
  end
end
