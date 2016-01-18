describe FindRacecoursesService do
  subject { described_class }
  describe '.run' do
    it { expect(subject.run('E5 8HT').size).to eq 2 }

    context 'top result' do
      let(:venue)   { subject.run('E5 8HT').first }
      let(:address) { ["Portsmouth Road", "Esher", "Surrey", "KT10 9AJ", "United Kingdom"] }

      it 'returns expected data' do
        expect(venue.name).to eq 'Sandown Park Racecourse'
        expect(venue.address).to eq address
      end
    end

    context 'second result' do
      let(:venue)   { subject.run('E5 8HT').last }
      let(:address) { ["75 High Holborn", "London", "Greater London", "WC1V 6LS.", "United Kingdom"] }

      it 'returns expected data' do
        expect(venue.name).to eq 'Racecourse Association'
        expect(venue.address).to eq address
      end
    end
  end
end
