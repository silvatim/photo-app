module ApplicationHelper

 def full_name(user)
   "#{user.first_name.capitalize} #{user.last_name.capitalize}"
 end

 def current_user?(user)
   @current_user == user
 end

 def gallery_photos?(gallery)
    gallery.photos.count > 0
 end

end
