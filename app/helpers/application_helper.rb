module ApplicationHelper

 def full_name(user)
   "#{user.first_name.capitalize} #{user.last_name.capitalize}"
 end

 def current_user?(user)
   @current_user == user
 end

end
