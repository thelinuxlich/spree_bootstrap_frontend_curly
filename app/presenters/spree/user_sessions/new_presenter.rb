class Spree::UserSessions::NewPresenter < Spree::CommonPresenter

    presents :body_id, default: nil

    def setup!
        @body_id = 'login'
    end

    def login
        render partial: 'spree/shared/login'
    end

    def session_class
        request.path == spree.login_path ? "col-md-offset-3" : ""
    end
end
