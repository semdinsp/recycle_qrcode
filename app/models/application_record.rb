class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  self.implicit_order_column = :created_at
  
  def log_message(msgs,logtype=:debug)  #msgs should be hash  logtype :info :warn etc
      logm = {time: Time.now, model: self.class.name }.merge(msgs)
      Rails.logger.send(logtype,logm)   # was puts
      $stdout.flush if Rails.env.development?
      logm
    end
end
