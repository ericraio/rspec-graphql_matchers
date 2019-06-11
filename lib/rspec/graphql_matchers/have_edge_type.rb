module RSpec
  module GraphqlMatchers
    class HaveEdgeType
      attr_reader :sample, :expected, :edge_type

      def initialize(expected)
        @expected = expected
      end

      def matches?(actual_sample)
        @sample = actual_sample
        return false if @sample.nil?
        @edge_type = @sample.edge_type.to_s
        @edge_type == @expected.to_s
      end

      def failure_message
        if sample.present?
          "expected '#{field_name(sample)}' have edge_type '#{expected}', " \
          "but it was '#{edge_type}'"
        else
          "expected to have edge_type '#{expected}', " \
          "but it was nil"
        end
      end

      def edge_type
        "have edge_type '#{expected}'"
      end

      private

      def field_name(field)
        field.respond_to?(:name) && field.name || field.inspect
      end
    end
  end
end
