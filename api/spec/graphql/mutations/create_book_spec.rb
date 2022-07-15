require 'rails_helper'

RSpec.describe Mutations::CreateBook do
  describe 'CreateBook' do
    it 'loads samples' do
      query_string = <<-GRAPHQL
mutation {
  createBook(input: {params: {title: "New Book"}}) {
    book {
      id
      title
    }
  }
}
      GRAPHQL
      result = ApiSchema.execute(query_string, context: {}, variables: {} )
      puts result.inspect
      expect(result['data']['createBook']['book']['title']).to eq('New Book')
    end
  end
end
