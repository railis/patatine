module Patatine
  module Dialog
    class Options
      attr_reader :notice, :options

      def initialize(notice, options)
        if invalid_options?(options)
          raise InvalidOptionsError, "Invalid format of options"
        end
        @notice = notice
        @options = options
      end

      def ask
        print_notice
        print_options

        input = get_input_number

        if available_answers.include?(input)
          options[input - 1].last
        else
          raise WrongInputError, "Given option does not match the list"
        end
      end

      private

      def get_input_number
        STDIN.gets.chomp.to_i
      end

      def print_notice
        puts "\n#{notice} Pick one of options below:\n\n"
      end

      def print_options
        num = 1
        options.each do |option|
          puts "#{num}. #{option.first}"
          num += 1
        end
        puts
      end

      def available_answers
        (1..(options.size))
      end

      def invalid_options?(options)
        return true if options.class != Array
        options.each do |option|
          return true unless option.size == 2
        end
        false
      end
    end
  end
end
