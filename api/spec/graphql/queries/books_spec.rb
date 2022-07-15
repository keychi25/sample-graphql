require 'rails_helper'

RSpec.describe Queries::Books do
  describe 'Books' do
    it '正常系' do
      query_string = <<-GRAPHQL
{
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
