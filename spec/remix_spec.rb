require_relative '../remix'

describe 'Remix' do
    let(:data) {"weather,location=us-midwest temperature=82 1465839830100400200"}
    let(:data2) {"weather,location=us-midwest,id=4 temperature=82,wind=13 1465839830100400200"}
    let(:instance) {Remix.new(data)}
    let(:instance2) {Remix.new(data2)}
    
    describe ".measurement" do
        context 'with measurement' do
            it 'finds the measurement' do
                expect(instance.measurement).to eq("weather")
            end
        end

        context 'without measurement' do
            let(:data) {"location=us-midwest temperature=82 1465839830100400200"}
            it 'finds no measurement when there is none' do
                expect(instance.measurement).to eq(nil)
            end
        end
    end

    describe ".tags" do 
        context 'with tags' do
            it 'finds the tags' do 
                expect(instance.tags).to eq({"location" => ["us-midwest"]})
            end

            it 'finds multiple tags' do
                expect(instance2.tags).to eq({"location" => ["us-midwest"], "id" => ["4"]})
            end
        end
    end

    describe ".fields" do
        context 'with fields' do
            it 'finds the fields' do
                expect(instance.fields).to eq({"temperature" => ["82"]})
            end
            it 'finds multiple fields' do
                expect(instance2.fields).to eq({"temperature" => ["82"], "wind" => ["13"]})
            end
        end
    end

    describe ".timestamp" do
        context 'with timestamp' do
            it 'finds the timestamp' do
                expect(instance.time).to eq("1465839830100400200")
            end
        end
    end

    describe ".update_time" do
        context 'with new time' do
            it 'replaces the time' do
                t = "1573508173170660019"
                instance.update_time(t)
                expect(instance.time).to eq(t)
            end
        end
    end

    describe ".line_protocol" do
        context 'with remix object' do
            it 'turns remix into line protocol' do
                expect(instance.line_protocol).to eq(data)
            end
        end
    end
end