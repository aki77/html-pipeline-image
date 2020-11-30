RSpec.describe HTML::Pipeline::ImageLinkFilter do
  subject { HTML::Pipeline::ImageLinkFilter.new(text, context).call.to_s }

  let(:context) do
    {}
  end

  context 'jpeg' do
    let(:text) { 'https://example.com/test.jpg' }

    it { is_expected.to eq '<a href="https://example.com/test.jpg"><img src="https://example.com/test.jpg" alt=""></a>' }
  end

  context 'png' do
    let(:text) { 'https://example.com/test.png' }

    it { is_expected.to eq '<a href="https://example.com/test.png"><img src="https://example.com/test.png" alt=""></a>' }
  end

  context 'http' do
    let(:text) { 'http://example.com/test.png' }

    it { is_expected.to eq 'http://example.com/test.png' }
  end

  context 'http with https_only: false' do
    let(:text) { 'http://example.com/test.png' }

    let(:context) do
      { https_only: false }
    end

    it { is_expected.to eq '<a href="http://example.com/test.png"><img src="http://example.com/test.png" alt=""></a>' }
  end

  context 'png in code tags' do
    let(:text) { '<code>https://example.com/test.png</code>' }

    it { is_expected.to eq '<code>https://example.com/test.png</code>' }
  end

  context 'svg' do
    let(:text) { 'https://example.com/test.svg' }

    it { is_expected.to eq 'https://example.com/test.svg' }
  end

  context 'svg with image_extensions: %w[png svg]' do
    let(:text) { 'https://example.com/test.svg' }

    let(:context) do
      { image_extensions: %w[png svg] }
    end

    it { is_expected.to eq '<a href="https://example.com/test.svg"><img src="https://example.com/test.svg" alt=""></a>' }
  end
end
