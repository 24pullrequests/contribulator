Octokit.middleware =  Faraday::RackBuilder.new do |builder|
  builder.use Faraday::HttpCache,
              shared_cache: false,
              serializer: Marshal,
              logger: Rails.logger
  builder.use Octokit::Response::RaiseError
  builder.adapter Faraday.default_adapter
end unless Rails.env.test?
