require 'redis'

class NotificationsController < ApplicationController

  def index
    @notifications = Notification.all
    render json: notifications, status: :ok
  end

  def create_task_notification

    @notifications = Notification.new(notifications_params)

    if @notifications.save

      redis = Redis.new(url: 'redis://localhost:6379/1')
      
      redis.set('latest_task_update', { 
        task_id: notifications_params[:task_id], 
        description: notifications_params[:description]
      }.to_json)

      redis.publish('task_updates', { 
        task_id: notifications_params[:task_id], 
        description: notifications_params[:description]
      }.to_json)
                                    
      render json: @notifications, status: :created
    else
      p "Errors: #{@notifications.errors.full_messages}"
      render json: @notifications.errors, status: :unprocessable_entity
    end
  end

  def create_product_notification

    @notifications = Notification.new(notifications_params)

    if @notifications.save
      render json: @notifications, status: :created
    else
      render json: @notifications.errors, status: :unprocessable_entity
    end
  end

  private

  def notifications_params
    params.permit(:description,:email, :task_id, :user_id, :product_id)
  end
end
