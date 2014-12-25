class User < ActiveRecord::Base
  def self.create_from_auth_hash(hash)
    create!(AuthHash.new(hash).user_info)
  end

  def assign_from_auth_hash(hash)
    # do not update the email address in case the user has updated their
    # email prefs and used a new email
    ignored_fields = %i(email name blog location)
    update_attributes(AuthHash.new(hash).user_info.except(*ignored_fields))
  end

  def self.find_by_auth_hash(hash)
    conditions = AuthHash.new(hash).user_info.slice(:provider, :uid)
    where(conditions).first
  end
end
