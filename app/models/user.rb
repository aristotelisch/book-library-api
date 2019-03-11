class User < ApplicationRecord
  ROLES = %w[admin author guest banned]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable,
         :validatable, :trackable,
         jwt_revocation_strategy: JWTBlacklist

  validate :role_validation
  validate :unique_role
  
  def has_role?(role)
    roles.include?(role)
  end

  def is_admin?
    has_role?('admin')
  end

  def role_validation
    if !roles.is_a?(Array) || roles.detect { |v| !ROLES.include?(v) }
      errors.add(:roles, :invalid)
    end
  end

  def unique_role
    if !roles.is_a?(Array) || roles.size != roles.uniq.size
      errors.add(:roles, "should be unique array")
    end
  end
end
