require 'active_record'

class Weapon < ActiveRecord::Base
  validates :name, :type, presence: true
end

class Enemy < ActiveRecord::Base
  validates :name, :species, presence: true
end

class Configuration < ActiveRecord::Base
  has_many :weapons
  has_many :names, through: :weapons
  has_many :enemies
  has_many :names, through: :enemies
end
