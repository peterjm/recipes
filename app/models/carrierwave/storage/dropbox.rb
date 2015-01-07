module CarrierWave
  module Storage
    class Dropbox < Abstract

      def store!(file)
        client.put_file(uploader.store_path, file.to_file)
      end

      def retrieve!(file)
        CarrierWave::Storage::Dropbox::File.new(client, uploader.store_path(file), cache: cache)
      end

      private

      def client
        @client ||= Dropbox::Client.new
      end

      def cache
        Rails.cache
      end

      class File
        attr_reader :path, :client, :cache

        def initialize(client, path, cache: nil)
          @client = client
          @path = path
          @cache = cache
        end

        def url
          @url ||= (cached_url || fetched_url)
        end

        def delete
          client.file_delete(path)
        end

        private

        def fetched_url
          url = media['url']
          cache.write(key, url, expires_in: media_expires_in) if cache
          url
        end

        def media_expires_in
          media_expiration_time - Time.now
        end

        def media_expiration_time
          DateTime.parse(media['expires'])
        end

        def media
          @media ||= client.media(path)
        end

        def cached_url
          cache.read(path) if cache
        end
      end
    end
  end
end