module RSpec
  module GraphqlMatchers
    class HaveDescription
      attr_reader :sample, :expected, :description

      def initialize(expected)
        @expected = expected
      end

      def matches?(actual_sample)
        @sample = actual_sample
        return false if @sample.nil?
        @description = @sample.description
        @description == @expected.to_s
      end

      def failure_message
        if sample.present?
          "expected '#{field_name(sample)}' have description '#{expected}', " \
          "but it was '#{description}'"
        else
          "expected to have description '#{expected}', " \
          "but it was nil"
        end
      end

      def description
        "have description '#{expected}'"
      end

      private

      def field_name(field)
        field.respond_to?(:name) && field.name || field.inspect
      end
    end
  end
end
