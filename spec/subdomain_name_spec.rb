RSpec.describe SubdomainName do
  it 'is a Name' do
    expect(described_class['foo']).to be_a(described_class::Name)
  end
end
