require 'time'
require 'date'

module B2bCenterApi
  module WebService
    module TypeCast
      module ClassMethods
        def convert(obj, obj_type)
          return obj if obj.nil?
          case obj_type
          when :string then obj
          when :integer then obj.to_i
          when :float then obj.to_f
          when :date then Date.parse(obj)
          when :time then Time.parse(obj)
          when :boolean then to_boolean(obj)
          else obj
          end
        end

        def to_boolean(obj)
          return obj if obj.nil?
          obj == '1' ? true : false
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end
