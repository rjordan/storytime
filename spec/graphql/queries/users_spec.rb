require "rails_helper"

RSpec.describe StorytimeSchema, type: :model do
  let(:graphql_result) do
    res = described_class.execute(
      query,
      variables: variables,
      context: context
    )
    expect(res["errors"]).to be_nil
    res
  end
  let(:context) do
    {}
  end
  let(:variables) do
    {}
  end
  let(:query) do
    <<~GRAPHQL
      query {
        users (first: #{per_page}) {
          pageInfo {
            startCursor
            endCursor
            hasNextPage
            hasPreviousPage
          }
          nodes {
            id
            name
            email
          }
        }
      }
    GRAPHQL
  end
  let(:per_page) { 1 }
  let(:valid_result) do
    {
      "pageInfo" => {
        "startCursor" => instance_of(String),
        "endCursor" => instance_of(String),
        "hasNextPage" => true,
        "hasPreviousPage" => false
      },
      "nodes" => users[0...per_page].map do |u|
        {
          "id" => u.id,
          "name" => u.name,
          "email" => u.email
        }
      end
    }
  end
  let!(:users) { FactoryBot.create_list(:user, per_page * 2) }

  it { expect(graphql_result["data"]["users"]).to match(valid_result) }
end
