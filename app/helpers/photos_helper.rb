module PhotosHelper

 def tags(photo)
   raw photo.tag_list.map { |t| link_to t, tag_path(t) }.join(", ")
 end

 def tags?(photo)
  photo.tags.count > 0
 end
end
