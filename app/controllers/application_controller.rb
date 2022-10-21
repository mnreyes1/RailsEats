class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_ability
    if current_restaurante
      @current_ability ||= RestauranteAbility.new(current_restaurante)
    else
      @current_ability ||= UserAbility.new(current_user)
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:nombre, :direccion, :imagen, :email, :password, :password_confirmation, :telefono) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:photo, :email, :nombre, :direccion, :imagen, :password, :password_confirmation, :current_password, :telefono, :valoracion) }
  end
end

class UserAbility
  include CanCan::Ability
  def initialize(user)
    can :read, [Comentario, Plato, Restaurante]
    if user.present?
      can :manage, [Comentario, Order], user_id: user.id
      can :manage, User, id: user.id
      can :pedir_plato, Plato
      if user.admin?
        can :manage, :all
      end
    end
  end
end

class RestauranteAbility
  include CanCan::Ability
  def initialize(restaurante)
    if restaurante.present?
      can :manage, [Plato, Order], restaurante_id: restaurante.id
      can :read, Comentario, restaurante_id: restaurante.id
      can :manage, Restaurante, id: restaurante.id
    end
  end
end
