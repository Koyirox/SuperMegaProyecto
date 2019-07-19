# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    #   
    #   if user.admin?
    #      can :manage, :all
    #   else
    #      can :read, :create, :update, :all
    #   end
    #
    #   user ||= User.new # guest user (not logged in)
    #   can :destroy, Post, user_id: user.id
    #   can :read, Post
    #   can :create, Post
    #   can :create, Comment #cualquiera puede crear un comentario
    #   can :destroy, Comment, user_id: user.id
    #   can :destroy, [Post, Comment], user_id: user.id
      if user.email != 'jesenio@master.cl'
        
        can :create, Podcast, user_id: user.id
        can :read, Podcast, user_id: user.id
        can :destroy, Podcast, user_id: user.id
    
        can :create, Comment, user_id: user.id
        can :read, Comment, user_id: user.id
        can :destroy, Comment, user_id: user.id
               


        else    
         can :manage, :all
      end
    end
  end