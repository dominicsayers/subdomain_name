RSpec.describe SubdomainName::Name do
  context 'when the name is invalid' do
    subject { described_class.new('-foobar-') }

    it { is_expected.not_to be_valid }
  end

  context 'when the name is valid and not reserved' do
    context 'when the name is not an IDN' do
      subject(:name) { described_class.new('foobar') }

      it { is_expected.to be_valid }
      it { is_expected.not_to be_reserved }
      it { is_expected.not_to be_idn }

      it 'has the same ASCII version' do
        expect(name.to_ascii).to eq('foobar')
      end

      it 'has the same Unicode version' do
        expect(name.to_unicode).to eq('foobar')
      end
    end

    context 'when the name is an IDN in Unicode' do
      subject(:name) { described_class.new('räksmörgås') }

      it { is_expected.to be_valid }
      it { is_expected.not_to be_reserved }
      it { is_expected.to be_idn }

      it 'has an ASCII version with the ACE prefix' do
        expect(name.to_ascii).to match(/^#{described_class::ACE_PREFIX}/)
      end

      it 'has the same Unicode version' do
        expect(name.to_unicode).to eq('räksmörgås')
      end
    end

    context 'when the name is an IDN in ASCII' do
      subject(:name) { described_class.new('xn--rksmrgs-5wao1o') }

      it { is_expected.to be_valid }
      it { is_expected.not_to be_reserved }
      it { is_expected.to be_idn }

      it 'has the same ASCII version' do
        expect(name.to_ascii).to eq('xn--rksmrgs-5wao1o')
      end

      it 'has the expected Unicode version' do
        expect(name.to_unicode).to eq('räksmörgås')
      end
    end
  end

  context 'when the name is valid and reserved' do
    subject { described_class.new('www') }

    it { is_expected.to be_valid }
    it { is_expected.to be_reserved }
  end
end
