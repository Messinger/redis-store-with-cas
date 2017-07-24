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

        def cas_multi *keys
          #options = extract_options keys
          return if keys.empty?
          watch(*keys) do
            values = read_multi(*keys)
            options = extract_options keys
            valuehash = yield values
            ires = multi do |multi|
              valuehash.map do |name,value|
                multi.set(name,value,options) if values.key?(name)
              end
            end
            true
          end
        end

        def read_multi *keys
          options = extract_options keys
          keys = keys.select {|k| exists(k)}
          return {} if keys.empty?
          values = mget(*(keys+[options]))
          resulthash = {}
          keys.zip(values) { |a,b| resulthash[a.to_s] = b} unless values.nil?
          resulthash
        end

        private

        def return_value result
          result.is_a?(Array) && result[0] == 'OK'
        end

        def extract_options array
          if array.last.is_a?(Hash) && array.last.instance_of?(Hash)
            array.pop
          else
            {}
          end
        end
      end

    end
  end
end
