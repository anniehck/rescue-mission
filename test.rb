# Add to spec/support/factory_girl.rb ??
Rspec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

<% unless @question.user.nil? %>
  Asked by: <%= @question.user.username %>
<% end %>
