class User < ActiveRecord::Base

  attr_accessible :name,
                  :uid,
                  :github_token


  has_many :statuses, :dependent => :destroy
  has_and_belongs_to_many :organizations

  def self.find_or_create_from_auth_hash(auth_hash)
    user = User.find_or_create_by_uid(auth_hash[:uid].to_s, :name => auth_hash[:info][:name])
    user.update_attributes :github_token => auth_hash[:credentials][:token]
    gh = Ghee.access_token user.github_token
    gh.orgs.each do |o|
      Rails.logger.info o.inspect
      user.organizations << Organization.find_or_create_by_name(o['login'])
    end
    user
  end

end
