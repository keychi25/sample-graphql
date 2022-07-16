require 'rails_helper'

RSpec.describe Queries::Books do
  let!(:book) { create(:book) }
  describe 'Books' do
    it '正常系' do
      query_string = <<-GRAPHQL
{
  book(id: #{book.id}) {
    id
    title
  }
}
      GRAPHQL
      variables = { id: book.id }
      result = ApiSchema.execute(query_string, context: {}, variables: {})
      puts result.inspect
      expect((result['data']['book']['id'])).to eq(book.id.to_s)  
    end
  end
end
