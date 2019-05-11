module RSpec
  module GraphqlMatchers
    class HaveGraphqlName
      attr_reader :sample, :expected, :graphql_name

      def initialize(expected)
        @expected = expected
      end

      def matches?(actual_sample)
        @sample = actual_sample
        return false if @sample.nil?
        @graphql_name = @sample.graphql_name
        @graphql_name == @expected.to_s
      end

      def failure_message
        if sample.present?
          "expected '#{sample}' to have graphql name '#{expected}', " \
          "but it was '#{graphql_name}'"
        else
          "expected to have graphql name '#{expected}', " \
          "but it was nil"
        end
      end

      def graphql_name
        "have graphql name '#{expected}'"
      end
    end
  end
end
