require 'redis'
require 'redis/store'
require 'redis/store-with-cas'

class Redis

  class StoreWithCas < Store
  end

end
