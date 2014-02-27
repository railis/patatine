require 'aws/ops_works'

%w{connection command}.each do |e|
  require File.dirname(__FILE__) + "/opsworks/#{e}"
end

module Patatine
  module Opsworks
  end
end
