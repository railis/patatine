module Patatine
  module CLI
    class Cmd < Thor
      desc "deploy APP ENV", "runs command on opsworks"

      def deploy(app, env)
        connection = Opsworks::Connection.new
        puts connection.client.inspect
        puts "Running deploy on #{app} #{env}"
      end

      desc "update_custom_cookbooks APP ENV", "runs command on opsworks"

      def update_custom_cookbooks(app, env)
        puts "Updating custom cookbooks on #{app} #{env}"
      end
    end
  end
end
