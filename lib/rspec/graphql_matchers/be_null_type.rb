module RSpec
  module GraphqlMatchers
    class BeNullType
      attr_reader :sample

      def matches?(actual_sample)
        @sample = actual_sample
        @sample.type.class.to_s != "GraphQL::Schema::NonNull" && @subject.class.to_s == "GraphQL::Schema::Field"
      end

      def failure_message
        "expected field '#{field_name(sample)}' to be of type '#{expected}', " \
        "but it was '#{sample.type}'"
      end

      def description
        "be null type"
      end

      private

      def field_name(field)
        field.respond_to?(:name) && field.name || field.inspect
      end
    end
  end
end
