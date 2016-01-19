describe Venue do
  subject     { described_class }
  let(:json)  { File.read(Rails.root.join('spec/fixtures/success.json')) }

  describe '.create' do
    it { expect(subject.create(json).size).to eq 2 }

    context 'top response' do
      let(:venue)   { subject.create(json).first }
      let(:address) { "Portsmouth Road, Esher, Surrey, KT10 9AJ, United Kingdom" }

      it 'returns expected data' do
        expect(venue.name).to eq 'Sandown Park Racecourse'
        expect(venue.lat).to eq 51.373280620643364
        expect(venue.long).to eq -0.3618192672729492
        expect(venue.address).to eq address
      end
    end

    context 'second response' do
      let(:venue)   { subject.create(json).last }
      let(:address) { "75 High Holborn, London, Greater London, WC1V 6LS., United Kingdom" }

      it 'returns expected data' do
        expect(venue.name).to eq 'Racecourse Association'
        expect(venue.lat).to eq  51.51779635241522
        expect(venue.long).to eq -0.11784553527832031
        expect(venue.address).to eq address
      end
    end
  end
end


