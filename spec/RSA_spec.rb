require_relative '../lib/RSA.rb'

RSpec.describe RSA do

	n = 8
	e = 1
	d = 11

  let(:rsa) { RSA.new(n, e, d) }

  it "make random key" do
    p rsa.new_key, RSA.new(n, e, d).new_key
    expect(rsa.new_key).not_to eq(RSA.new(n, e, d).new_key)
  end

  it "return n" do
    expect(rsa.n()).to eq(n)
  end

  it "return e" do
    expect(rsa.e()).to eq(e)
  end

  it "return d" do
    expect(rsa.d()).to eq(d)
  end

#  context "encrypting messages" do
#   it "encrypts strings" do
#		p rsa.encrypt('abcd')
#      expect(rsa.decrypt(rsa.encrypt('abcd'))).to eq('abcd')
#    end
#  end

#  context "decrypting messages" do
#    it "decrypts strings" do
#      expect(rsa.decrypt([97])).to eq('a')
#    end

#    it "decrypts messages" do
#      expect(rsa.decrypt([82, 83, 65])).to eq('RSA')
#    end
#  end
end
