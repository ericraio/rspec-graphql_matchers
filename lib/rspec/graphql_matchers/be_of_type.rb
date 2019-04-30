module RSpec
  module GraphqlMatchers
    class BeOfType
      attr_reader :sample, :expected

      def initialize(expected)
        @expected = expected
      end

      def matches?(actual_sample)
        @sample = actual_sample
        return false if @sample.nil?
        @type = case @sample.type.class.to_s
        when "GraphQL::Schema::NonNull"
          if @sample.type.of_type.class.to_s == "GraphQL::Schema::List"
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
        else
          @sample.type
        end

        @expected = @expected.is_a?(Array) ? @expected[0] : @expected
        @expected = @expected.to_s.split("GraphQL::Types::")[-1]
        @type = @type.to_s.split("GraphQL::Types::")[-1]
        @type == @expected
      end

      def failure_message
        if sample.present?
          "expected field '#{field_name(sample)}' to be of type '#{expected}', " \
          "but it was '#{sample.type}'"
        else
          "expected field to be of type '#{expected}', " \
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
