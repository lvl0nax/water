class Restriction < ActiveRecord::Base
  attr_accessible :title, :name ,:days
  validate :title, presence: true
end
