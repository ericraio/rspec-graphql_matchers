module RSpec
  module GraphqlMatchers
    class BeNullable
      attr_reader :sample

      def matches?(actual_sample)
        @sample = actual_sample
        return false if @sample.nil?
        @sample.type.class.to_s != "GraphQL::Schema::NonNull" && @sample.class.to_s.match(/Field/)
      end

      def failure_message
        if sample.present?
          "expected field '#{field_name(sample)}' to be nullable, " \
          "but it was NonNull"
        else
          "expected field to be nullable, " \
          "but the field was nil"
        end
      end

      def failure_message_when_negated
        if sample.present?
          "expected field '#{field_name(sample)}' to not be nullable, " \
          "but it was nullable"
        else
          "expected field to not be nullable, " \
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
