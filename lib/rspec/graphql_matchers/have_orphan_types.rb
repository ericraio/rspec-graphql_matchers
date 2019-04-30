module RSpec
  module GraphqlMatchers
    class HaveOrphanTypes
      attr_reader :sample, :expected, :orphan_types

      def initialize(*expected)
        @expected = expected.flatten
      end

      def matches?(actual_sample)
        @sample = actual_sample
        return false if @sample.nil?
        @orphan_types = @sample.orphan_types
        @orphan_types.all? { |type| @expected.include?(type) }
      end

      def failure_message
        if sample.present?
          "expected to have orphan types '#{expected}', " \
          "but it was '#{orhan_types}'"
        else
          "expected to have orphan types '#{expected}', " \
          "but was nil"
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
