module RSpec
  module GraphqlMatchers
    class BeOfType
      attr_reader :sample, :expected

      def initialize(expected)
        @expected = expected
      end

      def matches?(actual_sample)
        @sample = actual_sample
        @type = case @sample.type.class.to_s
        when "GraphQL::Schema::NonNull"
          if @sample.type.of_type.class.to_s == "GraphQL::Schema::List"
            @expected = @expected[0]
            if @sample.type.of_type.of_type.class.to_s == "GraphQL::Schema::NonNull"
              @sample.type.of_type.of_type.of_type
            else
              @sample.type.of_type.of_type
            end
          else
            @sample.type.of_type
          end
        when "GraphQL::Schema::List"
          @sample.type.of_type.of_type
          @expected = @expected[0]
        else
          @sample.type
        end

        @type = @type.to_s.split("GraphQL::Types::")[-1]
        @expected = @expected.to_s.split("GraphQL::Types::")[-1]
        @type == @expected
      end

      def failure_message
        "expected field '#{field_name(sample)}' to be of type '#{expected}', " \
        "but it was '#{sample.type}'"
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
