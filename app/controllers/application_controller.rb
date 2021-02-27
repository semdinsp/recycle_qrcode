class ApplicationController < ActionController::Base
    before_action :entry_log_message

    def log_message(msgs, logtype=:debug)  #msgs should be hash   logtype warn info
      logm = {time: Time.now, controller: self.class.name }.merge(msgs)
      Rails.logger.send(logtype,logm)   # was puts
      if Rails.env.development?
         puts logm
         $stdout.flush
       end
      logm
    end

    def entry_log_message
      log_message({message: "--------> ENTRY [#{params['action']}]", params: params}, :info)
    end

end
