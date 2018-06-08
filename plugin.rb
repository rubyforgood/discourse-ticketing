# name: discourse-ticketing
# about: Ticketing system for Discourse
# version: 0.1
# authors:
# url: https://github.com/angusmcleod/discourse-ticketing

add_admin_route 'ticketing.title', 'ticketing'

Discourse::Application.routes.append do
  get '/admin/plugins/ticketing' => 'admin/plugins#index', constraints: StaffConstraint.new
end

