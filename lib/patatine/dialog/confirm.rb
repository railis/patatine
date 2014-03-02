module Patatine
  module Dialog
    class Confirm
      attr_reader :notice

      def initialize(notice)
        @notice = notice
      end

      def ask
        print_notice
        input = get_input
        if input == "y"
          true
        elsif input == "n"
          false
        else
          raise WrongInputError, "Wrong input given"
        end
      end

      private

      def print_notice
        print "\n#{notice} (y/n)   "
      end

      def get_input
        STDIN.gets.chomp
      end
    end
  end
end
