module MyAuth

  class Engine < Rails::Engine

    initializer "team_page.load_app_instance_data" do |app|
      MyAuth.setup do |config|
        config.app_root = app.root
      end
    end

    initializer "team_page.load_static_assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end

  end

end