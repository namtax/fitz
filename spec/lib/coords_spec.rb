describe Coords do
  describe '#to_h' do
    subject        { described_class.new(response) }
    let(:response) { double(body: { result: result }.to_json ) }
    let(:result)   { { latitude: 20, longitude: 10 } }

    it { expect(subject.to_h).to eq '20,10' }
  end
end