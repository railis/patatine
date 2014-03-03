module Patatine
  module Opsworks
    class Console
      attr_reader :app, :env, :option

      def initialize(app, env, option)
        @app = app
        @env = env
        @option = option
      end

      def connect!
        instances = get_instances
        if instances.size > 1
          execute_ssh(pick_one(instances))
        elsif instances.size == 1
          execute_ssh(instances.first)
        else
          raise "No matched instances found"
        end
      end

      private

      def execute_ssh(instance)
        puts "Execute on this #{instance[:public_dns]}"
        system("ssh -i ~/ticckle-application.pem ubuntu@#{instance[:public_dns]}")
      end

      def pick_one(instances)
        Dialog::Options.new("Multiple instances detected",
          instances.collect {|i| [i[:public_dns], i]}
        ).ask
      end

      def get_instances
        Instance.new(app, env).list
      end

      def connection
        @connection ||= Connection.new
      end
    end
  end
end
