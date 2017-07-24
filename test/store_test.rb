require 'test_helper'

describe Redis::Store::StoreWithCas do
  def setup
    @store  = Redis::Store::StoreWithCas.new :namespace => 'storetest'
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

  def test_cas_multi_with_empty_set
    refute @store.cas_multi { |_hash| flunk }
  end


  def test_read_multi
    @store.set('k1','m1')
    @store.set('k2','m2')
    assert_equal({"k1" => "m1","k2" => "m2"},@store.read_multi("k1","k2"))
  end

  def test_cas_multi
    @store.set('foo', 'bar')
    @store.set('fud', 'biz')
    assert_equal true, (@store.cas_multi('foo', 'fud') do |hash|
      assert_equal({ "foo" => "bar", "fud" => "biz" }, hash)
      { "foo" => "baz", "fud" => "buz" }
    end)
    assert_equal({ "foo" => "baz", "fud" => "buz" }, @store.read_multi('foo', 'fud'))
  end

  def test_cas_multi_with_cache_miss
    assert(@store.cas_multi('not_exist') do |hash|
      assert hash.empty?
      {}
    end)
  end


end
