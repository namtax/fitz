describe FetchCoordsService do
  subject { described_class }
  describe '#run' do
    let(:coords) { '51.5518497175874,-0.0532444526771821' }
    it { expect(subject.run('E5 8HT')).to eq (coords) }
  end
end