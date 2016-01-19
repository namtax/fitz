describe FetchCoordsService do
  subject { described_class }
  describe '#run' do
    let(:connection) { double }
    let(:response)   { double(code: code, body: body) }
    let(:api_base)   { 'api.postcodes.io' }

    before { allow(Net::HTTP).to receive(:new).with(api_base, 80).and_return(connection) }

    context 'valid postcode' do
      before       { allow(connection).to receive(:get).with(path).and_return(response) }

      let(:path)   { '/postcodes/E5%208HT' }
      let(:coords) { '51.5518497175874,-0.0532444526771821' }
      let(:code)   { '200' }
      let(:body)   { File.read(Rails.root.join('spec/fixtures/coords/success.json')) }

      it { expect(subject.run('E5 8HT').result).to eq (coords) }
    end

    context 'invalid postcode' do
      before       { allow(connection).to receive(:get).with(path).and_return(response) }

      let(:path)   { '/postcodes/E' }
      let(:code)   { 400 }
      let(:body)   { ''}

      it { expect(subject.run('E').errors).to eq (['Please supply a valid postcode']) }
    end

    after { subject.instance_variable_set(:@connection, nil) }
  end
end