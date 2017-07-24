require 'test_helper'

describe Redis::Store::StoreWithCas do
  def setup
    @store  = Redis::Store::StoreWithCas.new
    @client = @store.instance_variable_get(:@client)
  end

  def teardown
    @store.flushdb
    @store.quit
  end

  def test_cas
    @store.set('foo', 'baz')
    assert(@store.cas('foo') do |value|
      assert_equal 'baz', value
      'bar'
    end)
    assert_equal 'bar', @store.get('foo')
  end

  def test_cas_with_cache_miss
    refute @store.cas('not_exist') { |_value| flunk }
  end

  def test_cas_with_conflict
    @store.set('foo', 'bar')
    refute @store.cas('foo') { |_value|
      @store.set('foo', 'baz')
      'biz'
    }
    assert_equal 'baz', @store.get('foo')
  end

end
