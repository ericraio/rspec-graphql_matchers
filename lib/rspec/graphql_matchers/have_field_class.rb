module RSpec
  module GraphqlMatchers
    class HaveFieldClass
      attr_reader :sample, :expected, :field_class

      def initialize(expected)
        @expected = expected
      end

      def matches?(actual_sample)
        @sample = actual_sample
        return false if @sample.nil?
        @field_class = @sample.field_class.to_s
        @field_class == @expected.to_s
      end

      def failure_message
        if sample.present?
          "expected '#{sample}' to have field class '#{expected}', " \
          "but it was '#{field_class}'"
        else
          "expected to have field class '#{expected}', " \
          "but it was nil"
        end
      end

      private

      def field_name(field)
        field.respond_to?(:name) && field.name || field.inspect
      end
    end
  end
end
