require 'redis/store'

class Redis
  class StoreWithCas < Store
    VERSION = '0.0.1'
  end
end
