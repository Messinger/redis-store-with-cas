class Redis
  class Store
    class StoreWithCas < self

      module Cas

        def cas key, ttl=nil
          res = watch(key) do
            value = get(key)
            break false if value.nil?
            value = yield value
            ires = multi do |multi|
              multi.set(key,value,{:expire_in => ttl})
            end
            return_value ires
          end
          res
        end

        def cas_multi keys, ttl=nil

        end

        private

        def return_value result
          result.is_a?(Array) && result[0] == 'OK'
        end
      end

    end
  end
end
