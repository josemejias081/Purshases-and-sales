# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

      if user.superadmin?
        can :manage, :all
      elsif user.admin?
        

        can :read, Category

        #can :read, Business#el resto de permisos delimitar en las vistas (no mostrar los links en las vistas puede ser usando unless)
        #can :update, Business, user_id: user.id
        can :manage, Business, user_id: user.id

        #can :read, Product
        
        
        #can :manage, Product, business_id: user.businesses
        
        #can :manage, Product, business_id: user.business_ids
        #can :create, Product
        can :manage, Product
        

        

        can :read, User, id: user.id
        can :update, User, id: user.id  

        cannot :index, User

        cannot :destroy, User
      else
        can :read, Business
        can :read, Category
        can :read, Product
        
      end
    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
