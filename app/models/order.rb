class Order < ActiveRecord::Base
  attr_accessible :description, :ordered_for
  validates_presence_of  :description, :ordered_for
  belongs_to :user
  
  def send_email(ordered_by, sandwich_type)
        puts "email sent to david!"

        RestClient.post("https://api:key-903saomu7owoeibd0pur22m-ct109sw0"\
            "@api.mailgun.net/v2/senderbots.mailgun.org/messages",
             :from => 'david_ladowitz@freds-famous-sandwiches.com',
             :to => 'david@ladowitz.com',
             :subject => "What a glorious day for #{ordered_by}, a sandwich is on the way.",
             :text => "Holy crap, a #{sandwich_type} sandwich is being made right now just for you. I know, I know, I cant believe it either. \n
\n
We charged you $5.99 so the Fredlings can buy shoes. \n
Thanks for supporting them.")  
  end
  
  def send_fax(sandwich)
    pamfaxr = PamFaxr.new :username => 'david@ladowitz.com', :password => 'L@dowitz12'
    pamfaxr.create_fax_job
    
    case sandwich
    when "BALT"
      pamfaxr.add_remote_file('http://freds-sandwiches.herokuapp.com/Balt.pdf')
    when "Tomcat"
      pamfaxr.add_remote_file('http://freds-sandwiches.herokuapp.com/Tomcat.pdf')
    when "Jessie"
      pamfaxr.add_remote_file('http://freds-sandwiches.herokuapp.com/Jessie.pdf')
    else
       pamfaxr.add_remote_file('http://freds-sandwiches.herokuapp.com/Caprese.pdf')
    end
    
    pamfaxr.add_recipient('+14154526640')
    loop do
      fax_state = pamfaxr.get_state
      break if fax_state['FaxContainer']['state'] == 'ready_to_send'
      sleep 5
    end
    pamfaxr.send_fax
  end
  
 
end


