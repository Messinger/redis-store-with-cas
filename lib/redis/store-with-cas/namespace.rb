class Redis
  class Store < self
    # Add namespaced methods missing in #Redis::Store
    module Namespace
      # redis.watch for a list of keys respecting the namespace for keys of the
      # Redis::Store instance
      # @parameter keys Array a list of keys to watch
      # @see Redis::Store::watch in redis-store-gem
      # @see Redis::watch in redis-gem
      def watch *keys
        if keys.any?
          super(*keys.map {|key| interpolate(key) })
        end
      end
    end
  end
end
