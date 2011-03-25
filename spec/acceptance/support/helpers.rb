module HelperMethods
  def set_session(id)
    Capybara.instance_variable_set('@session_pool', {
     "#{Capybara.current_driver}#{Capybara.app.object_id}" => $sessions[id]
    })
  end

  def switch_session(id)
    $sessions ||= {}
    $sessions[:default] ||= Capybara.current_session
    $sessions[id]       ||= Capybara::Session.new(Capybara.current_driver, Capybara.app)
    set_session(id)
  end
end

RSpec.configuration.include HelperMethods, :type => :acceptance
