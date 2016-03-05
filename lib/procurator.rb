require "procurator/version"
require "mechanize"

class Procurator
	def get_page_html link
		agent = Mechanize.new
		page = agent.get(link)
		agent.shutdown
		
		return page
	end
	
	def search link, tags
		html = get_page_html link
		
		result = Hash.new
		
		tags.each do |t|		
			begin
				result[t[0]] = html.search(t[1]).to_s
			rescue => ex
				result[t[0]] = "Nokogiri parsing error"
			end
		end
		result
	end
end
