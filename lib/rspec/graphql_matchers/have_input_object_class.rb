module RSpec
  module GraphqlMatchers
    class HaveInputObjectClass
      attr_reader :sample, :expected, :object_class

      def initialize(expected)
        @expected = expected
      end

      def matches?(actual_sample)
        @sample = actual_sample
        return false if @sample.nil?
        @object_class = @sample.object_class.to_s
        @object_class == @expected.to_s
      end

      def failure_message
        if sample.present?
          "expected '#{sample}' to have input object class '#{expected}', " \
          "but it was '#{object_class}'"
        else
          "expected to have input object class '#{expected}', " \
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
