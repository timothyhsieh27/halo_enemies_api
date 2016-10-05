require 'active_record'

class Enemy < ActiveRecord::Base
  validates :name, :species, presence: true

end
