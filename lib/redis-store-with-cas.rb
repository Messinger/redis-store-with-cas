require 'redis'
require 'redis/store'
require 'redis/store-with-cas'

class Redis

  class Store < self
    class StoreWithCas < self
    end
  end

end
