---
title: Rack::Tidy and Devise in the Rack Middleware Stack
author: Joel
layout: post
permalink: /2010/09/25/racktidy-and-devise-in-the-rack-middleware-stack/index.html
categories:
  - Web Development
---
# 

After quite a bit of digging around, and a little help from mr. [Jose Valim][1] at [Plataformatec][2], I realized that the combination of the [Devise][3] authentication gem, along with [Rack-Tidy][4], aren’t quite so friendly with each other. The main culprit here, I would say is the Tidy gem. Why? Because the essence of its existence is to re-arrange the markup handed back from the app-server. So some things get lost in the shuffle during all that house-cleaning (please, correct me if I’m wrong).

 [1]: http://github.com/josevalim
 [2]: http://plataformatec.com.br/
 [3]: http://github.com/plataformatec/devise
 [4]: http://github.com/webficient/rack-tidy

I had a hunch that with a little musical chairs in the middleware stack, we could find a solution that would allow all pieces to live harmoniously. Luckily, I was right. The trick is to make sure Tidy is inserted into the stack before ActionDispatch::Flash (*because Rack::Tidy was killing the flash messages returned from Devise/Warden*) and before Warden::Manager (*the rack authentication layer beneath Devise*). The resulting stack, for me, looks like so (important bits in bold):

`use ActionDispatch::Static
use Rack::Lock
use ActiveSupport::Cache::Strategy::LocalCache
use Rack::Runtime
use Rails::Rack::Logger
use ActionDispatch::ShowExceptions
use ActionDispatch::RemoteIp
use Rack::Sendfile
use ActionDispatch::Callbacks
use ActionDispatch::Cookies
use ActionDispatch::Session::CookieStore
use ActionDispatch::ParamsParser
use Rack::MethodOverride
use ActionDispatch::Head
use ActionDispatch::BestStandardsSupport
use Rack::Tidy
use ActionDispatch::Flash
use Warden::Manager
use Sass::Plugin::Rack
run MyApp::Application.routes`

And is accomplished with this code instead the app initialization process (application.rb):

`config.middleware.delete ActionDispatch::Flash   # remove from current position
config.middleware.insert_before Warden::Manager, ActionDispatch::Flash # add it right back in before Warden
config.middleware.insert_before ActionDispatch::Flash, Rack::Tidy, 'indent-spaces' => 2 # finally, add in Rack:Tidy before ActionDispatch::Flash.`

The resulting stack looks like it’s working quite well for now.
