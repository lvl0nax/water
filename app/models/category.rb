class Category < ActiveRecord::Base
  has_many	:infopages

  def to_param
  	url
  end
end
