class User < ActiveRecord::Base
    acts_as_authentic do |c|
    end

    def active?
      active
    end

    def deliver_password_reset_instructions!
      reset_perishable_token!  
      Notifier.deliver_password_reset_instructions(self)  
    end
end
