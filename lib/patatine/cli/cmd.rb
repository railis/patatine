module Patatine
  module CLI
    class Cmd < Thor
      desc "deploy APP ENV", "runs command on opsworks"

      def deploy(app, env)
        Patatine::Dialog.new("Multiple things discovered", [["First option", "sad"], ["Another", "bad"], ["Aaaand another", "cad"]]).ask
        puts "Running deploy on #{app} #{env}"
      end

      desc "update_custom_cookbooks APP ENV", "runs command on opsworks"

      def update_custom_cookbooks(app, env)
        puts "Updating custom cookbooks on #{app} #{env}"
      end
    end
  end
end
