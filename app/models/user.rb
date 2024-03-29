class User < ApplicationRecord
  
  belongs_to :school, optional: true
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

         UserTypes = [:Admin, :Moderator ,:Teacher]
         ROLES = %i[Admin Moderator Teacher]

         def roles=(roles)
          roles = [*roles].map { |r| r.to_sym }
          self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
        end
      
        def roles
          ROLES.reject do |r|
            ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
          end
        end
        def has_role?(role)
          roles.include?(role)
        end


end
