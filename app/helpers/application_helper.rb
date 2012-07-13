module ApplicationHelper

def Full_title(title)
	base_title = "Deloitte Report Generator"
	if title.empty?
		base_title
	else
		"#{base_title} | #{title}"
	end
end



end