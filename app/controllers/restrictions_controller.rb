class RestrictionsController < InheritedResources::Base
  before_filter :admin_require
end
