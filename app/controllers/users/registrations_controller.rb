class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :require_no_authentication, :only => [:cancel ]
  before_filter :require_admin, :only => [:create, :new ]
  def new
    resource = build_resource({})
    respond_with resource
  end

  def create
    build_resource
    if resource.save
      if @user.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        respond_with @user, :location => leaves_path
      else
        set_flash_message :notice, :"signed_up_but_#{@user.inactive_message}" if is_navigational_format?
        respond_with @user, :location => holidays_path
      end
    else
      clean_up_passwords @user
      respond_with @user
    end
  end

  def set_flash_message(key, kind, options={})
    options[:scope] = "devise.#{controller_name}"
    options[:default] = Array(options[:default]).unshift(kind.to_sym)
    options[:resource_name] = resource_name
    options = devise_i18n_options(options) if respond_to?(:devise_i18n_options, true)
    message = "Employee Created Successfully"
    flash[key] = message if message.present?
  end

  def require_admin
    if current_user && current_user.is_admin?
      true
    else
      flash[:notice] = "Contact admin to Create your account"
      redirect_to new_user_session_path
    end
  end

end
