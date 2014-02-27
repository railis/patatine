module Patatine
  module Opsworks
    class Deployment
      attr_reader :stack, :app, :connection

      def initialize(stack, app, connection)
        @stack = stack
        @app = app
        @connection = connection
      end

      def run
        print "Running deployment "
        dep_id = create_deployment
        deployment = wait_until_done(dep_id)
        puts " Deployment done. Duration: #{get_duration_in_seconds(deployment)} seconds"
      end

      private

      def get_duration_in_seconds(dep)
        Time.parse(dep[:completed_at]) - Time.parse(dep[:created_at])
      end

      def wait_until_done(dep_id)
        @running = true
        deployment = nil
        while @running == true
          sleep 5
          print "."
          deployment = get_deployment(dep_id)
          status = deployment[:status]
          @running = false if status != "pending"
        end
        deployment
      end

      def get_deployment(deployment_id)
        cmd = connection.client.describe_commands(
          :deployment_id => deployment_id
        )
        cmd[:commands].first
      end

      def create_deployment
        connection.client.create_deployment(
          :stack_id => stack[:stack_id],
          :command => {:name => "deploy"}, 
          :app_id => app[:app_id]
        )[:deployment_id]
      end
    end
  end
end
