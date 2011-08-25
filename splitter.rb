require 'yaml'

$endpoints = YAML::load_file("endpoints.yml")

post %r{/receive_commit/?} do
	$endpoints.each do |ep|
		puts "pushing to #{ep}"
		u=URI.parse(ep)
		Net::HTTP.new(u.host,u.port) {|h| h.post(u.path,request.body.read)}
	end
	[200,{},"coo"]
end
