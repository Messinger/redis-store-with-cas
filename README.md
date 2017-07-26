# Enhance redis store with Compare-and-Swap methods

__Redis Store With CAS__ enhance the existing [redis-store for Ruby Frameworks](https://github.com/redis-store/redis-store)
with so called Compare-And-Swap. 

This is required for thread-safe-usage of cache systems like [Identity cache](https://github.com/Shopify/identity_cache).

The tests and workflow are build like in [Memcached store for ruby](https://github.com/Shopify/memcached_store)

## Installation

Add the following to your Gemfile

`gem 'redis-store-with-cas`

## Usage

Add a 

`require 'redis-store-with-cas'`

line to your source before first call to `Redis::Store.new`. Now each instance of `Redis::Store` has 
two new methods:

 * `cas`
 * `cas_multi`

## Copyright

2017 Rajko Albrecht - [http://alwins-world.de](http://alwins-world.de)