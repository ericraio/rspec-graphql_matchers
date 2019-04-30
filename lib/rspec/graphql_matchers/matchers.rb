require 'rspec/matchers'
require 'rspec/graphql_matchers/be_nullable'
require 'rspec/graphql_matchers/be_required'
require 'rspec/graphql_matchers/be_of_type'
require 'rspec/graphql_matchers/be_a_connection'
require 'rspec/graphql_matchers/accept_arguments'
require 'rspec/graphql_matchers/have_a_field'
require 'rspec/graphql_matchers/have_description'
require 'rspec/graphql_matchers/have_value'
require 'rspec/graphql_matchers/implement'

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

    def have_value(expected)
      RSpec::GraphqlMatchers::HaveValue.new(expected)
    end

    def have_description(expected)
      RSpec::GraphqlMatchers::HaveDescription.new(expected)
    end

    # rubocop:disable Style/PredicateName
    def have_a_field(field_name)
      RSpec::GraphqlMatchers::HaveAField.new(field_name)
    end
    alias have_field have_a_field
    def have_an_input_field(field_name)
      RSpec::GraphqlMatchers::HaveAField.new(field_name, :input_fields)
    end
    alias have_input_field have_an_input_field
    def have_a_return_field(field_name)
      RSpec::GraphqlMatchers::HaveAField.new(field_name, :return_fields)
    end
    alias have_return_field have_a_return_field

    def implement(*interface_names)
      RSpec::GraphqlMatchers::Implement.new(interface_names.flatten)
    end
  end
end
