class UserMailer < ApplicationMailer
    default from: 'no-reply@jungle.com'
   
    def welcome_email(user)
      @user = user
      @url  = 'http://localhost:3000/'
      mail(to: @user.email, subject: 'Welcome to My Jungle Site')
    end

    def order_email(order, line_items)
        @order = order
        @line_items = line_items
        @email = order.email
        @url  = 'http://localhost:3000/'
        mail(to: @email, subject: "Jungle Order # #{@order.id}")

    end

  end
