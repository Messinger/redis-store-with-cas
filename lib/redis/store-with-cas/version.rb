require 'redis/store'

class Redis
  class StoreWithCas < Store
    VERSION = '0.0.3'
  end
end
