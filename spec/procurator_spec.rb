require 'spec_helper'

describe Procurator do
	subject { Procurator.new }
	let(:link) { "http://www.americanas.com.br/produto/121293903/tablet-nokia-lumia-2520-tim-32gb-wi-fi-4g-tela-ips-10.1-windows-8.1-rt-processador-qualcomm-quad-core-2.2ghz-preto?" }
	let(:tags) { "" }
	
	describe '#get_page_html' do		
		let(:output) { subject.get_page_html link }
	
		it 'returns a mechanize page' do
			expect(output.class).to eq Mechanize::Page
		end		
	end
	
	describe '#search' do
		let(:output) { subject.search link, tags }
		
		it 'returns a hash result' do
			expect(output.class).to eq Hash
		end
	end
	
end