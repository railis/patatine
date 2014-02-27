require 'pry'
%w{opsworks cli}.each do |e|
  require File.dirname(__FILE__) + "/patatine/#{e}"
end

module Patatine
end
