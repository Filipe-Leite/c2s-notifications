require 'redis'

class NotificationsController < ApplicationController

  def index
    @notifications = Notification.all
    render json: @notifications, status: :ok
  end

  def create_task_notification

    @notifications = Notification.new(notifications_params)

    if @notifications.save

      publish_task_on_redis(@notifications[:created_at],
                            notifications_params[:description],
                            @notifications[:email],
                            @notifications[:id],
                            @notifications[:product_id],
                            notifications_params[:task_id],
                            notifications_params[:task_status_id],
                            @notifications[:updated_at],
                            notifications_params[:user_id])
                                    
      render json: @notifications, status: :created
    else
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
    params.permit(:description,:email, :task_id, :user_id, :product_id, :task_status_id)
  end

  def publish_task_on_redis(created_at, description, email, id, product_id, 
                            task_id, task_status_id, updated_at, user_id)

    redis = Redis.new(url: 'redis://localhost:6379/1')
    
    redis.publish('task_updates', {
      created_at: created_at,
      description: description,
      email: email,
      id: id,
      product_id: product_id,
      task_id: task_id, 
      task_status_id: task_status_id,
      updated_at: updated_at,
      user_id: user_id,
    }.to_json)
  end
end
