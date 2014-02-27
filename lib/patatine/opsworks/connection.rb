module Patatine
  module Opsworks
    class MissingCredentialsError < StandardError
    end

    class Connection
      def initialize
        @connection = AWS::OpsWorks.new(
          :access_key_id => access_key_id,
          :secret_access_key => secret_access_key
        )
        begin
          client.describe_commands
        rescue AWS::Errors::MissingCredentialsError
          raise MissingCredentialsError, 
            %q{
                Missing or incorrect AWS credentials.
                (credentials are taken from environment variables AMAZON_ACCESS_KEY_ID, AMAZON_SECRET_ACCESS_KEY
            }
        rescue
        end
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
