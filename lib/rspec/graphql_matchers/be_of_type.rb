module RSpec
  module GraphqlMatchers
    class BeOfType
      attr_reader :sample, :expected

      def initialize(expected)
        @expected = expected
      end

      def matches?(actual_sample)
        @sample = actual_sample
        @type = get_type(@sample.type)
        @type = @type.to_s.split("GraphQL::Types::")[-1]
        @type == @expected.to_s
      end

      def failure_message
        "expected field '#{field_name(sample)}' to be of type '#{expected}', " \
        "but it was '#{sample.type}'"
      end

      def description
        "be of type '#{expected}'"
      end

      private

      def get_type(type)
        case type.class.to_s
        when "GraphQL::Schema::NonNull"
          @sample.type.of_type
        when "GraphQL::Schema::List"
          get_type(@sample.type.of_type)
        else
          @sample.type
        end
      end

      def field_name(field)
        field.respond_to?(:name) && field.name || field.inspect
      end
    end
  end
end
