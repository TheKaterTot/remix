require_relative '../loader'
require_relative '../remix'

describe 'Loader' do
    let(:file) {'spec/fixtures/sample.txt'}
    let(:instance) {Loader.new(file)}
    let(:remix) {Remix.new("weather,id=05 temperature=8.8 1569474754000000000")}

    describe 'initialize' do
        context 'with proper file' do
            it 'loads file into an array of remixes' do
                expect(instance.blob.last.fields).to eq(remix.fields)
            end
        end
    end
end