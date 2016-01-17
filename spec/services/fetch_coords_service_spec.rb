describe FetchCoordsService do
  subject { described_class }
  describe '#run' do
    let(:coords) { { lat: 51.5518497175874, long: -0.0532444526771821 } }
    it { expect(subject.run('E5 8HT')).to eq (coords) }
  end
end