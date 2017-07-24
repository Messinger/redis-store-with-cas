class Redis
  class Store
    class StoreWithCas < self

      module Cas

        def cas key, ttl=nil
          watch(key) do
            break false unless exists(key)
            value = get(key)
            value = yield value
            ires = multi do |multi|
              multi.set(key,value,{:expire_in => ttl})
            end
            return_value ires
          end
        end

        def cas_multi keys, ttl=nil

        end

        def read_multi *keys
          values = mget(*keys)
          resulthash = {}
          keys.zip(values) { |a,b| resulthash[a.to_s] = b}
          resulthash
        end

        private

        def return_value result
          result.is_a?(Array) && result[0] == 'OK'
        end
      end

    end
  end
end
