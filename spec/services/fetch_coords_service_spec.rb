describe FetchCoordsService do
  subject { described_class }
  describe '#run' do
    context 'valid postcode' do
      let(:coords) { '51.5518497175874,-0.0532444526771821' }
      it { expect(subject.run('E5 8HT').result).to eq (coords) }
    end

    context 'invalid postcode' do
      let(:coords) { '51.5518497175874,-0.0532444526771821' }
      it { expect(subject.run('E').errors).to eq (['Please supply a valid postcode']) }
    end
  end
end