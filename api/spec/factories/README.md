# RSpecについて

# サンプル

```ruby:hoge_spec.rb
describe 'テストの対象' do
  context '特定の条件の内容' do
    example 'アウトプットの内容' do
      ...テスト処理...
    end

    it "is 〜" do ...テスト処理... end

    it { should_be 〜 } 
  end
end
```