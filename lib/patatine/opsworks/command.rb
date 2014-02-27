module Patatine
  module Opsworks
    class Command
      private

      def connection
        @connection ||= Connection.new
      end
    end
  end
end
