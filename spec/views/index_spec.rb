module Venues
  describe Index do
    describe '#map_src' do
      let(:venue)   { double(coords: "51.412051,-0.679543") }
      let(:venue2)  { double(coords: "51.489190,-0.630199") }
      let(:venue3)  { double(coords: "51.373280,-0.361819") }
      let(:venue4)  { double(coords: "51.488865,-0.636091") }
      let(:venue5)  { double(coords: "51.396849,-1.307029") }
      let(:venues)  { [venue, venue2, venue3, venue4, venue5] }

      let(:map_src) do
        "https://maps.googleapis.com/maps/api/staticmap?size=600x300&maptype=roadmap" \
        "&markers=color:blue|label:A|51.412051,-0.679543" \
        "&markers=color:green|label:B|51.489190,-0.630199" \
        "&markers=color:red|label:C|51.373280,-0.361819" \
        "&markers=color:purple|label:D|51.488865,-0.636091" \
        "&markers=color:yellow|label:E|51.396849,-1.307029"
      end

      before do
        subject.instance_variable_set(:@venues, venues)
        allow(subject).to receive(:valid_search?).and_return(true)
      end

      it 'generates correct url for google maps' do
        expect(URI).to receive(:escape).with(map_src)
        subject.map_src
      end
    end
  end
end