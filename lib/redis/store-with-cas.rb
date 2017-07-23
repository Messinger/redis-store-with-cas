require 'redis'
require 'redis/store'
require 'redis/store_with_cas/cas'
require 'redis/store_with_cas/version'
require 'redis/store/marshalling'
require 'redis/store/namespace'

class Redis
  class Store < self
    class StoreWithCas < self
      include Cas
    end
  end
end

