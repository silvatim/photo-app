module UsersHelper

 def has_followers?(user)
   user.followers.count > 0
 end

 def is_following?(user)
   user.following.count > 0
 end

end
