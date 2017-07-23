class Redis
  class Store
    class StoreWithCas < self

      module Cas

        def cas key, ttl=nil

        end

        def cas_multi keys, ttl=nil

        end

      end

    end
  end
end
