module RSpec
  module GraphqlMatchers
    class HaveDescription
      attr_reader :sample, :expected

      def initialize(expected)
        @expected = expected
      end

      def matches?(actual_sample)
        @sample = actual_sample.description
        return false if @sample.nil?
        @sample == @expected.to_s
      end

      def failure_message
        if sample.present?
          "expected field '#{field_name(sample)}' have description '#{expected}', " \
          "but it was '#{sample}'"
        else
          "expected field to have description '#{expected}', " \
          "but the field was nil"
        end
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
