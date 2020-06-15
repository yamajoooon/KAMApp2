class User < ApplicationRecord
    validates :name,{presence:true}

    validates :email,{uniqueness: true}

    #validates :password,{presence:true}

    #validates :user_id,[presence:true]

    def posts
        return Post.where(user_id: self.id)
    end
end
