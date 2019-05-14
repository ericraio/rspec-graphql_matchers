module RSpec
  module GraphqlMatchers
    class PrepareWith
      attr_reader :sample, :id, :ctx, :block

      def initialize(id, ctx, &block)
        @id  = id
        @ctx = ctx
        @block = block;
      end

      def matches?(actual_sample)
        @sample = actual_sample
        return false if @sample.nil?
        results = @sample.prepare.call(id, ctx)
        @block.call(results)
      end

      def failure_message
        if sample.present?
          "expected field '#{field_name(sample)}' to prepare"
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
