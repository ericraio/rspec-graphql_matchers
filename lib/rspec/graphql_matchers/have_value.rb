module RSpec
  module GraphqlMatchers
    class HaveValue
      attr_reader :sample, :expected

      def initialize(expected)
        @expected = expected
      end

      def matches?(actual_sample)
        @sample = actual_sample
        !@sample.values[expected].nil?
      end

      def failure_message
        "expected enum '#{@sample}' to have value '#{expected}'"
      end

      def description
        "have value '#{expected}'"
      end

    end
  end
end
