require 'redis'
require 'redis/store'
require 'redis/store-with-cas/cas'
require 'redis/store-with-cas/version'
require 'redis/store/marshalling'
require 'redis/store/namespace'
require 'redis/store-with-cas/namespace'

class Redis

  class Store < self
    include Cas
  end

end
