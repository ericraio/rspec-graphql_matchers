module RSpec
  module GraphqlMatchers
    class BeAConnection
      attr_reader :sample

      def matches?(actual_sample)
        @sample = actual_sample
        @sample.connection?
      end

      def failure_message
        "expected field '#{field_name(sample)}' to be a connection, " \
        "but it was not."
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
