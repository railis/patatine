module Patatine
  module CLI
    class Cmd < Thor
      desc "deploy APP ENV", "runs command on opsworks"

      def deploy(app, env)
        Opsworks::Command.new(app, env, "deploy").run!
      end

      desc "update_custom_cookbooks APP ENV", "runs command on opsworks"

      def update_custom_cookbooks(app, env)
        Opsworks::Command.new(app, env, "update_custom_cookbooks").run!
      end
    end
  end
end
