require 'rspec/matchers'
require 'rspec/graphql_matchers/be_nullable'
require 'rspec/graphql_matchers/be_required'
require 'rspec/graphql_matchers/be_of_type'
require 'rspec/graphql_matchers/be_a_connection'
require 'rspec/graphql_matchers/accept_arguments'
require 'rspec/graphql_matchers/have_a_field'
require 'rspec/graphql_matchers/have_description'
require 'rspec/graphql_matchers/have_mutation'
require 'rspec/graphql_matchers/have_node_type'
require 'rspec/graphql_matchers/have_graphql_name'
require 'rspec/graphql_matchers/have_value'
require 'rspec/graphql_matchers/have_orphan_types'
require 'rspec/graphql_matchers/have_possible_types'
require 'rspec/graphql_matchers/have_field_class'
require 'rspec/graphql_matchers/have_object_class'
require 'rspec/graphql_matchers/have_input_object_class'
require 'rspec/graphql_matchers/implement'
require 'rspec/graphql_matchers/prepare_with'

module RSpec
  module Matchers
    def be_a_connection
      RSpec::GraphqlMatchers::BeAConnection.new
    end

    def be_required
      RSpec::GraphqlMatchers::BeRequired.new
    end

    def be_nullable
      RSpec::GraphqlMatchers::BeNullable.new
    end

    def be_of_type(expected)
      RSpec::GraphqlMatchers::BeOfType.new(expected)
    end

    def accept_arguments(expected_args)
      RSpec::GraphqlMatchers::AcceptArguments.new(expected_args)
    end
    alias accept_argument accept_arguments

    def have_orphan_types(*expected)
      RSpec::GraphqlMatchers::HaveOrphanTypes.new(expected)
    end

    def have_possible_types(*expected)
      RSpec::GraphqlMatchers::HavePossibleTypes.new(expected)
    end

    def have_field_class(expected)
      RSpec::GraphqlMatchers::HaveFieldClass.new(expected)
    end

    def have_object_class(expected)
      RSpec::GraphqlMatchers::HaveObjectClass.new(expected)
    end

    def have_input_object_class(expected)
      RSpec::GraphqlMatchers::HaveInputObjectClass.new(expected)
    end

    def have_value(expected)
      RSpec::GraphqlMatchers::HaveValue.new(expected)
    end

    def have_description(expected)
      RSpec::GraphqlMatchers::HaveDescription.new(expected)
    end

    def have_mutation(expected)
      RSpec::GraphqlMatchers::HaveMutation.new(expected)
    end

    def have_graphql_name(expected)
      RSpec::GraphqlMatchers::HaveGraphqlName.new(expected)
    end

    def have_node_type(expected)
      RSpec::GraphqlMatchers::HaveNodeType.new(expected)
    end

    def prepare_with(result, ctx, &block)
      RSpec::GraphqlMatchers::PrepareWith.new(result, ctx, block)
    end

    # rubocop:disable Style/PredicateName
    def have_a_field(field_name)
      RSpec::GraphqlMatchers::HaveAField.new(field_name)
    end
    alias have_field have_a_field

    def implement(*interface_names)
      RSpec::GraphqlMatchers::Implement.new(interface_names.flatten)
    end
  end
end
