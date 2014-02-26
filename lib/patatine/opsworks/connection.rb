module Patatine
  module Opsworks
    class Connection
      def initialize
        @connection = AWS::OpsWorks.new(
          :access_key_id => access_key_id,
          :secret_access_key => secret_access_key
        )
      end

      def client
        @connection.client
      end

      private

      def access_key_id
        ENV['AMAZON_ACCESS_KEY_ID']
      end

      def secret_access_key
        ENV['AMAZON_SECRET_ACCESS_KEY']
      end
    end
  end
end
