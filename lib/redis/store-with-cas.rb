require 'redis'
require 'redis/store'
require 'redis/store/version'
require 'redis/store-with-cas/cas'
require 'redis/store-with-cas/version'

begin
  require 'redis/store/marshalling'
rescue LoadError
  require 'redis/store/serialization'
end

require 'redis/store/namespace'
require 'redis/store-with-cas/namespace'

class Redis

  class Store < self
    include Cas
  end

end
