module Patatine
  module CLI
    class Console < Thor
      desc "ssh APP ENV", "Loggs into ssh"

      def ssh(app, env)
        Opsworks::Console.new(app, env, "ssh").connect!
      end
    end
  end
end
