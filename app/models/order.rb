class Order < ActiveRecord::Base
  attr_accessible :description, :ordered_by
  validates_presence_of  :description, :ordered_by
  after_create :send_email
  
  def send_email
        puts "email sent to david!"

        RestClient.post("https://api:key-903saomu7owoeibd0pur22m-ct109sw0"\
            "@api.mailgun.net/v2/senderbots.mailgun.org/messages",
             :from => 'david_ladowitz@freds-famous-sandwiches.com',
             :to => 'david@ladowitz.com',
             :subject => 'Dude, youre getting a sandwich',
             :text => 'We ordered you a sandwich. Now give us some money')  
  end
  
end


