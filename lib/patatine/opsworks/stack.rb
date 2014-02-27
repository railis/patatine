module Patatine
  module Opsworks
    class Stack
      attr_reader :app, :env, :connection

      def initialize(app, env, connection)
        @app = app
        @env = env
        @connection = connection
      end

      def get
        puts "Getting stack ... \n"
        all_stacks = get_stacks_from_api
        matched_stacks = all_stacks.select do |stack|
          matched?(stack)
        end
        if matched_stacks.size == 1
          result = matched_stacks.first
        elsif matched_stacks.size == 0
          print "No matched stacks found. Would you like to chose from all stacks? (y/n)  "
          answer = STDIN.gets.chomp
          if answer == 'y'
            result = pick_one(all_stacks)
          else
            exit 1
          end
        else
          result = pick_one(matched_stacks)
        end
        puts "Using '#{result[:name]}' stack with id #{result[:stack_id]}"
        result
      end

      private

      def pick_one(stacks)
        Dialog.new(
          "Multiple matching stacks detected.",
          stacks.collect {|e| [e[:name], e]}
        ).ask
      end

      def matched?(stack)
        name = stack[:name].downcase
        !!(name.match(/#{app}/) or name.match(/#{env}/))
      end

      def get_stacks_from_api
        connection.client.describe_stacks[:stacks]
      end
    end
  end
end
