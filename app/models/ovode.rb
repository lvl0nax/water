class Ovode < ActiveRecord::Base
  def to_param
  	url
  end
end
