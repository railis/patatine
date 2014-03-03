module Patatine
  module Opsworks
    class Command
      attr_reader :app, :env, :command

      def initialize(app, env, command)
        @app = app
        @env = env
        @command = command
      end

      def run!
        stack = Opsworks::Stack.new(app, env, connection).get
        application = Opsworks::Application.new(stack, connection).get
        Deployment.new(stack, application, connection, command).run!
      end

      private

      def connection
        @connection ||= Connection.new
      end
    end
  end
end
