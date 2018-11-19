require "list"
describe List do
  let(:list) {List.new}
  let(:google) {double :google, url: "http://www.google.com/"}
  it "initializes contents to the empty array" do
    expect(list.contents).to eq []
  end
  it "returns 'http://www.google.com/ when see_list is called" do
    list.contents << google
    expect { list.see_list }.to output("http://www.google.com/\n").to_stdout
  end
end
