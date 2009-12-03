class Router
  DEFAULT_ROUTE = {:controller => 'products', :action => 'example'}

  def self.choose(route = {})
    route = DEFAULT_ROUTE.clone if route.blank?
    name = route[:controller].to_s.capitalize
    view = eval("#{name}View")
    controller = eval("#{name}Controller")
    records = controller.new.send(route[:action])
    view.new.send(route[:action], records)
  end
end
