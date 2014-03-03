module Patatine
  module Opsworks
    class Instance
      attr_reader :app, :env

      def initialize(app, env)
        @app = app
        @env = env
      end

      def list
        stack = Opsworks::Stack.new(app, env, connection).get
        connection.client.describe_instances(:stack_id => stack[:stack_id])[:instances]
      end

      private

      def connection
        @connection ||= Connection.new
      end
    end
  end
end
