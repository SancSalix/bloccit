module UsersHelper
    def user_has_posts?
        current_user.posts.count > 0
    end
    
    def user_has_comments?
        current_user.comments.count > 0
    end
    
    def user_favorites
        current_user.favorites.collect(&:post_id)
    end

end
