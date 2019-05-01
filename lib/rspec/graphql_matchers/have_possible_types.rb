module RSpec
  module GraphqlMatchers
    class HavePossibleTypes
      attr_reader :sample, :expected, :possible_types

      def initialize(*expected)
        @expected = expected.flatten
      end

      def matches?(actual_sample)
        @sample = actual_sample
        return false if @sample.nil?
        @possible_types = @sample.possible_types
        @possible_types.all? { |type| @expected.include?(type) }
      end

      def failure_message
        if sample.present?
          "expected to have possible types '#{expected}', " \
          "but it was '#{orhan_types}'"
        else
          "expected to have possible types '#{expected}', " \
          "but was nil"
        end
      end

      def description
        "have possible types '#{expected}'"
      end

      private

      def field_name(field)
        field.respond_to?(:name) && field.name || field.inspect
      end
    end
  end
end
