module MyAuth
  module Base
    class Adapter
      attr_accessor :controller
      def initialize(controller)
        self.controller = controller
      end
      
      def cookies
        controller.send(:cookies)
      end
      
      def session
        controller.send(:session)
      end
      
      module Implementation
        def self.included(klass)
          klass.prepend_before_filter :activate_my_auth
        end
        
        private
        
        def activate_my_auth
          MyAuth::Foundation.controller = Adapter.new(self)
        end
      end
        
    end
  end
end