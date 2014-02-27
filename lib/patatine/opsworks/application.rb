module Patatine
  module Opsworks
    class Application
      class NoMatchedApplicationError < StandardError; end

      attr_reader :app, :env, :stack, :connection

      def initialize(app, env, stack, connection)
        @app = app
        @env = env
        @stack = stack
        @connection = connection
      end

      def get
        puts "Getting application ... \n"
        all_apps = get_applications_from_api
        if all_apps.size == 1
          result = all_apps.first
        elsif all_apps.size == 0
          raise NoMatchedApplicationError, "No matched applications found"
        else
          result = pick_one(all_apps)
        end
        puts "Using '#{result[:name]}' application with id #{result[:app_id]}"
        result
      end

      private

      def pick_one(apps)
        Dialog.new(
          "Multiple matching applications detected.",
          apps.collect {|e| [e[:name], e]}
        ).ask
      end

      def get_applications_from_api
        connection.client.describe_apps(:stack_id => stack[:stack_id])[:apps]
      end
    end
  end
end
