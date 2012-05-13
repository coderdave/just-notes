class NoteSweeper < ActionController::Caching::Sweeper
	observe Note

	def sweep(note)
		FileUtils.rm_rf "#{page_cache_directory}/users/#{note.user_id}.html"
	end	

	alias_method :after_update, :sweep
	alias_method :after_create, :sweep
	alias_method :after_destroy, :sweep

end