module RSpec
  module GraphqlMatchers
    class HaveNodeType
      attr_reader :sample, :expected, :node_type

      def initialize(expected)
        @expected = expected
      end

      def matches?(actual_sample)
        @sample = actual_sample
        return false if @sample.nil?
        @node_type = @sample.node_type.to_s
        @node_type == @expected.to_s
      end

      def failure_message
        if sample.present?
          "expected '#{field_name(sample)}' have node_type '#{expected}', " \
          "but it was '#{node_type}'"
        else
          "expected to have node_type '#{expected}', " \
          "but it was nil"
        end
      end

      def node_type
        "have node_type '#{expected}'"
      end

      private

      def field_name(field)
        field.respond_to?(:name) && field.name || field.inspect
      end
    end
  end
end
