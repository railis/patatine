module Patatine
  module CLI
    class Cmd < Thor
      %w{deploy rollback restart update_custom_cookbooks}.each do |command|
        desc "#{command} APP ENV", "runs '#{command}' on matched instances"

        define_method command do |app, env|
          Opsworks::Command.new(app, env, command).run!
        end
      end
    end
  end
end
