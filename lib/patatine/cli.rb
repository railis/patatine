require 'thor'

%w{cmd console pt}.each do |e|
  require File.dirname(__FILE__) + "/cli/#{e}"
end

module Patatine
  module CLI
  end
end
