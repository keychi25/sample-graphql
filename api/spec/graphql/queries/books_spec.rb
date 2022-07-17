require 'rails_helper'

RSpec.describe Queries::Books do
  describe 'Books' do
    context "正常系" do
      it '空配列を返すこと' do
        query_string = <<-GRAPHQL
query getBooks {
  books {
    id
    title
  }
}
        GRAPHQL
        result = ApiSchema.execute(query_string, context: {}, variables: {})
        expect(result['data']['books']).to eq([])
      end
    end
  end
end
