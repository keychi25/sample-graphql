require 'rails_helper'

RSpec.describe Mutations::CreateBook do
  describe 'UpdateBook' do  
    let!(:book) { create(:book) }
    it '正常系' do
      query_string = <<-GRAPHQL
mutation {
  updateBook(input: { id: #{book.id}, params: {title: "Update Book"}}) {
    book {
      id
      title
    }
  }
}
      GRAPHQL
      variables = { id: book.id, params: {title: 'updated book'} }
      result = ApiSchema.execute(query_string, context: {}, variables: {})
      p result.inspect
      expect(result['data']['updateBook']['book']['title']).to eq('Update Book')
    end
  end
end
