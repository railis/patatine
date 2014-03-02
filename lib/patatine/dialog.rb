%w{options confirm}.each do |e|
  require File.dirname(__FILE__) + "/dialog/#{e}"
end

module Patatine
  class Module
    class WrongInputError < StandardError; end
    class InvalidOptionsError < StandardError; end
  end
end
