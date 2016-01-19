describe FindRacecoursesService do
  subject        { described_class }
  let(:response) { double(errors: [], result: coords, valid?: true) }
  let(:coords)   { '51.5518497175874,-0.0532444526771821' }

  describe '.run' do
    context 'success' do
      it     { expect(subject.run('E5 8HT').result.size).to eq 5 }

      before { expect(FetchCoordsService).to receive(:run).with('E5 8HT').and_return(response) }

      context 'top result' do
        let(:venue)    { subject.run('E5 8HT').result.first }
        let(:address)  { "Portsmouth Road, Esher, Surrey, KT10 9AJ, United Kingdom" }

        it 'returns expected data' do
          expect(venue.name).to eq 'Sandown Park Racecourse'
          expect(venue.address).to eq address
          expect(venue.coords).to eq '51.373280620643364,-0.3618192672729492'
        end
      end

      context 'second result' do
        let(:venue)   { subject.run('E5 8HT').result[1] }
        let(:address) { "75 High Holborn, London, Greater London, WC1V 6LS., United Kingdom" }

        it 'returns expected data' do
          expect(venue.name).to eq 'Racecourse Association'
          expect(venue.address).to eq address
          expect(venue.coords).to eq '51.51779635241522,-0.11784553527832031'
        end
      end
    end

    context 'errors' do
      context 'postcode missing' do
        it { expect(subject.run('').errors).to eq ['Please supply a valid postcode'] }
      end

      context 'invalid postcode' do
        let(:response) { double(errors: [], result: '', valid?: false)  }

        before { expect(FetchCoordsService).to receive(:run).with('e').and_return(response) }
        it     { expect(subject.run('e').errors).to eq ['Please supply a valid postcode'] }
      end
    end
  end
end
