module Patatine
  module CLI
    class PT < Thor
      desc "cmd COMMAND_NAME", "Runs command"
      subcommand "cmd", Cmd
    end
  end
end
