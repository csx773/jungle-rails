class UserMailer < ApplicationMailer
    default from: 'no-reply@jungle.com'
   
    def welcome_email(user)
      @user = user
      @url  = 'http://localhost:3000/'
      mail(to: @user.email, subject: 'Welcome to My Jungle Site')
    end

    def order_email(order, user, line_items)
        @order = order
        @user = user
        @line_items = line_items
        @url  = 'http://localhost:3000/'
        mail(to: @user.email, subject: "Jungle Order # #{@order.id}"")

    end

  end
