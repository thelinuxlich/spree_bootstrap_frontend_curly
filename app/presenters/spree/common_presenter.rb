class Spree::CommonPresenter < Curly::Presenter

    presents :taxon, default: nil
    presents :taxonomies, default: nil
    presents :products, default: nil
    presents :searcher, default: nil
    presents :body_id, default: nil

    def current_user
        spree_current_user
    end

    def current_user?
        spree_current_user.present?
    end

    def my_account_link
        link_to Spree.t(:my_account), spree.account_path, :class => "button"
    end

    def logout_link
        link_to Spree.t(:logout), spree.logout_path
    end

    def continue_shopping_link
        link_to Spree.t(:continue_shopping), products_path, :class => 'btn btn-default'
    end

    def back_to_store_link
        link_to Spree.t(:back_to_store), spree.root_path, :class => "button"
    end

    def continue_shopping_url
        products_path
    end

    def message(type)
        flash type
    end

    def alert?
        flash[:alert].present?
    end

    def login_link
        link_to Spree.t(:login), spree.login_path
    end

    def home_link
        link_to Spree.t(:home), spree.root_path
    end

    def create_new_account_link
        link_to Spree.t(:create_a_new_account), spree.signup_path
    end

    def forgot_password_link
        link_to Spree.t(:forgot_password), spree.recover_password_path
    end

    def cart_link
        link_to_cart
    end

    def products_path
        spree.products_path
    end

    def update_cart_url
        update_cart_path
    end

    def empty_cart_url
        empty_cart_path
    end

    def create_new_session_path
        spree.create_new_session_path
    end

    def keywords
        params[:keywords]
    end

    def keywords?
        params[:keywords].present?
    end

    def logo_img
        logo
    end

    def secure_token
        raw "<div style='display: none'><input type='hidden' name='authenticity_token' value='#{form_authenticity_token}'></div>"
    end

    def yebo_link
        link_to 'Yebo', 'http://www.yebo.com.br/'
    end

    def login_as_existing_link
        link_to Spree.t(:login_as_existing), spree.login_path
    end

    def t(text)
        Spree.t text
    end

    def title_text
        title
    end

    def page_class
        body_class
    end

    def page_id
        @body_id
    end

    def locale
        I18n.locale
    end
end
