class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(leads_file)
    CSV.foreach(params[leads_file].path, headers: true) do |song|
      Song.create(title: song[0], artist_name: song[1])
    end
  end
end
