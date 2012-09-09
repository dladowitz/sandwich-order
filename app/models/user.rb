class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  
  has_many :orders
  
   def create_stripe_customer_id(stripeToken)
      description =  "I like sandwiches" # self.name ? self.name : "not given"
      customer = Stripe::Customer.create(
        :card => stripeToken,
        :email => self.email,
        :description => description
      )
      self.stripe_customer_id = customer.id
      self.save
    end

    def charge_card(user)
      charge = Stripe::Charge.create(
        :amount => 599, # in cents
        :currency => "usd",
        :customer => user.stripe_customer_id
      )
    end
end
