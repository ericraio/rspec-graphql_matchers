module RSpec
  module GraphqlMatchers
    class HaveMutation
      attr_reader :sample, :expected, :mutation

      def initialize(expected)
        @expected = expected
      end

      def matches?(actual_sample)
        @sample = actual_sample
        return false if @sample.nil?
        @mutation = @sample.mutation
        @mutation == @expected.to_s
      end

      def failure_message
        if sample.present?
          "expected '#{field_name(sample)}' to have mutation '#{expected}', " \
          "but it was '#{mutation}'"
        else
          "expected to have mutation '#{expected}', " \
          "but it was nil"
        end
      end

      def mutation
        "have mutation '#{expected}'"
      end

      private

      def field_name(field)
        field.respond_to?(:name) && field.name || field.inspect
      end
    end
  end
end
