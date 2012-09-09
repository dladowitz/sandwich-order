class Order < ActiveRecord::Base
  attr_accessible :description, :ordered_by
  validates_presence_of  :description, :ordered_by
  belongs_to :user
  
  def send_email(ordered_by, sandwich_type)
        puts "email sent to david!"

        RestClient.post("https://api:key-903saomu7owoeibd0pur22m-ct109sw0"\
            "@api.mailgun.net/v2/senderbots.mailgun.org/messages",
             :from => 'david_ladowitz@freds-famous-sandwiches.com',
             :to => 'david@ladowitz.com',
             :subject => "What a glorious day for #{ordered_by}, a sandwich is on the way.",
             :text => "Holy crap, a #{sandwich_type} is being made right now just for you. I know, I cant believe it either. Now give us some money")  
  end
  
  #This will get moved to the User mode.
  
  def create_stripe_customer_id(stripeToken)
     description =  "This is a test" # self.name ? self.name : "not given"
     customer = Stripe::Customer.create(
       :card => stripeToken,
       :email => 'david@ladowitz.com',
       :description => description
     )
     # self.stripe_customer_id = customer.id
     # self.save
   end

   def charge_card(amount, user, goal)
     # charge = Stripe::Charge.create(
     #   :amount => amount, # in cents
     #   :currency => "usd",
     #   :customer => user.stripe_customer_id
     # )

     # charges.create
     # Charge.create(:amount => amount, :goal_id => goal.id, :stripe_charge_id => charge.id, :transaction_type => "initial charge")
     Charge.create :amount => amount,
                   :goal_id => goal.id,
                   # :stripe_charge_id => charge.id,
                   :transaction_type => "initial charge"
   end
end


