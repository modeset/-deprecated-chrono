class User < ActiveRecord::Base
  attr_accessible :name,
                  :uid

  def self.find_or_create_from_auth_hash(auth_hash)
    User.find_or_create_by_uid(auth_hash[:uid], :name => auth_hash[:info][:name])
  end
end
