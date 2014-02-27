module Patatine
  module CLI
    class Cmd < Thor
      desc "deploy APP ENV", "runs command on opsworks"

      def deploy(app, env)
        connection = Opsworks::Connection.new
        stack = Opsworks::Stack.new(app, env, connection).get
        application = Opsworks::Application.new(stack, connection).get
        Opsworks::Deployment.new(stack, application, connection).run
      end

      desc "update_custom_cookbooks APP ENV", "runs command on opsworks"

      def update_custom_cookbooks(app, env)
        puts "Updating custom cookbooks on #{app} #{env}"
      end
    end
  end
end
