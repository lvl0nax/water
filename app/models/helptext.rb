class Helptext < ActiveRecord::Base
  validates :name, :content, presence: true
end
