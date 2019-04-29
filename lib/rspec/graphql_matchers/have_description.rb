module RSpec
  module GraphqlMatchers
    class HaveFieldDescription
      attr_reader :sample, :expected

      def initialize(expected)
        @expected = expected
      end

      def matches?(actual_sample)
        @sample = actual_sample.description
        @sample == @expected.to_s
      end

      def failure_message
        "expected field '#{field_name(sample)}' have description '#{expected}', " \
        "but it was '#{sample}'"
      end

      def description
        "be of type '#{expected}'"
      end

      private

      def field_name(field)
        field.respond_to?(:name) && field.name || field.inspect
      end
    end
  end
end
