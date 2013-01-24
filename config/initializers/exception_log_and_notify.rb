# ExceptionLogAndNotify.configure do |config|
#   config.environments = [:development, :test, :production]                # Defaults to [:production]
#   # config.after_initialize do
#   #   # This block will be called after the initialization is done.
#   #   # Usefull for interaction with authentication mechanisms, which should
#   #   # only happen when the exception handler is enabled.
#   # end
#   # config.filters = [                                                      # No filters are enabled by default
#   #   :all_404s,
#   #   :no_referer_404s,
#   #   :anon_404s,
#   #   {user_agent_regxp: /\b(ApptusBot|TurnitinBot|DotBot|SiteBot)\b/i},
#   #   {target_url_regxp: /\.php/i},
#   #   {referer_url_regxp: /problematicreferer/i}
#   # ]
#   #
#   config.storage_strategies = [:active_record] # Available options: [:active_record, :rails_log, :remote_url => {:target => 'http://example.com'}]
#   config.exception_db_location = :current # the database where error_messages resides, read from database.yml, defaults to current database
#   config.store_request_info do |storage,request|
#     storage[:target_url] = request.url
#     storage[:referer_url] = request.referer
#     storage[:params] = request.params.inspect
#     storage[:user_agent] = request.user_agent
#   end

#   config.store_exception_info do |storage,exception|
#     storage[:class_name] = exception.class.to_s
#     storage[:message] = exception.to_s
#     storage[:trace] = exception.backtrace.join("\n")
#   end

#   config.store_environment_info do |storage,env|
#     storage[:doc_root] = env['DOCUMENT_ROOT']
#   end

#   config.store_global_info do |storage|
#     storage[:app_name] = Rails.application.class.parent_name
#     storage[:created_at] = Time.zone.now
#   end
#   config.store_user_info = {method: :current_user, field: :name} # Helper method for easier access to current_user

# end
