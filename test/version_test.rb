require 'test_helper'

describe Redis::Store::StoreWithCas::VERSION do
  it 'returns current version' do
    Redis::Store::StoreWithCas::VERSION.wont_equal nil
  end
end