module RSpec
  module GraphqlMatchers
    class BeAConnection
      attr_reader :sample

      def matches?(actual_sample)
        @sample = actual_sample
        return false if @sample.nil?
        @sample.connection?
      end

      def failure_message
        if sample.present?
          "expected field '#{field_name(sample)}' to be a connection, " \
          "but it was not."
        else
          "expected field to be a connection, " \
          "but the field was nil"
        end
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
