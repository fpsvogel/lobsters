# typed: false

module AuthenticationHelper
  module ControllerHelper
    def stub_login_as user
      session[:u] = user.session_token
    end
  end

  module FeatureHelper
    def stub_login_as user
      page.set_rack_session(u: user.session_token)
    end
  end

  module RequestHelper
    def sign_in user
      post "/login", params: {email: user.email, password: user.password}
    end
  end
end
