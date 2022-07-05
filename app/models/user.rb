class User < ApplicationRecord

include Bcrypt
validates :email, presence: true, uniqueness: { case_sensitive: false }

#se puede utilizar "has_secure_password, el cual realiza desde la linea 7 hasta la 27"
#para ejecutar, se reemplaza la linea numero 3
validate :password_present?

    def password=(new_password)
        @password = Password.create(new_password)
        self.password_digest = @password
    end

    def password
        return nil unless password_digest.present?

        @password ||= Password.new(password_digest)
    end

    def authenticate(unencrypte_password)
        self.password.is_password?(unencrypte_password) && self
    end

    def password_present?
        errors.add(:password, :blank) unless password_present?
    end

end