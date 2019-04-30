module RSpec
  module GraphqlMatchers
    class BeRequired
      attr_reader :sample

      def matches?(actual_sample)
        @sample = actual_sample
        return false if @sample.nil?
        @sample.type.class.to_s == "GraphQL::Schema::NonNull" && @sample.class.to_s == "GraphQL::Schema::Argument"
      end

      def failure_message
        if sample.present?
          "expected argument '#{argument_name(sample)}' to be required, " \
          "but it was not required"
        else
          "expected argument to be required, " \
          "but the argument was nil"
        end
      end

      def failure_message_when_negated
        if sample.present?
          "expected argument '#{argument_name(sample)}' to not be required, " \
          "but it was required"
        else
          "expected argument to not be required, " \
          "but the argument was nil"
        end
      end

      def description
        "be required"
      end

      private

      def argument_name(argument)
        argument.respond_to?(:name) && argument.name || argument.inspect
      end
    end
  end
end
