module ApplicationHelper
  
  def broadcast(channel, &block)
    message = {:channel => channel, :data => capture(&block)}
    uri = URI.parse("http://my-faye-server.herokuapp.com/faye")
    Net::HTTP.post_form(uri, :message => message.to_json)
  end

end
