class Banner < ActiveRecord::Base
  mount_uploader :immage, ImmagerUploader
end
