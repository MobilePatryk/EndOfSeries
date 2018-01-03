require 'net/http'
require 'json'
class ApplicationRecord < ActiveRecord::Base
    require 'google/apis/analytics_v3'
  self.abstract_class = true
end
