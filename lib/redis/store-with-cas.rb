require 'redis'
require 'redis/store'
require 'redis/store_with_cas/cas'
require 'redis/store_with_cas/version'
require 'redis/store/marshalling'
require 'redis/store/namespace'
require 'redis/store_with_cas/namespace'

class Redis

  class StoreWithCas < Store
    include Cas
  end

end
