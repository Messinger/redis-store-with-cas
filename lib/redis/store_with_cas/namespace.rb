class Redis
  class Store < self
    module Namespace
      def watch *keys
        if keys.any?
          super(*keys.map {|key| interpolate(key) })
        end
      end
    end
  end
end
