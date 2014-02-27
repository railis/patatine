require 'pry'
%w{opsworks cli dialog}.each do |e|
  require File.dirname(__FILE__) + "/patatine/#{e}"
end

module Patatine
end
