require 'rails_helper'

RSpec.describe 'Book' do
  describe 'CreateBook' do
    it '正常系' do
      query_string = <<-GRAPHQL
mutation {
  createBook(input: { params: {title: "New Book"}}) {
    book {
      id
      title
    }
  }
}
      GRAPHQL
      result = ApiSchema.execute(query_string, context: {}, variables: {} )
      expect(result['data']['createBook']['book']['title']).to eq('New Book')
    end
  end

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
      expect(result['data']['updateBook']['book']['title']).to eq('Update Book')
    end
  end

  describe 'DeleteBook' do  
    let!(:book) { create(:book) }
    it '正常系' do
      query_string = <<-GRAPHQL
mutation {
  deleteBook(input: {id: #{book.id}} ) {
    id
  }
}
      GRAPHQL
      result = ApiSchema.execute(query_string, context: {}, variables: {})
      expect(result['data']['deleteBook']['id']).to eq(book.id.to_s)
    end
  end
end
