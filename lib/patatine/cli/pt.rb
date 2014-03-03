module Patatine
  module CLI
    class PT < Thor
      desc "cmd COMMAND_NAME", "Runs command"
      subcommand "cmd", Cmd

      desc "consle OPTION", "Runs console on server"
      subcommand "console", Console
    end
  end
end
