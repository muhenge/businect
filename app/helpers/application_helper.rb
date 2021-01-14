module ApplicationHelper
    def user_avatar(user, size=40)
        if user.avatar.attached?
            user.avatar.variant(resize: "#{size}x#{size}")
        else
            gravatar_image_url(user.username, size: size)
        end
    end
end
