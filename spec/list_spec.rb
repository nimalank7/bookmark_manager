require "list"
describe List do
  let(:list) {List.new}
  let(:google) {double :google, url: "http://www.google.com/"}
  it "initializes contents to the empty array" do
    expect(list.contents).to eq []
  end
  it "returns 'http://www.google.com/ when see_list is called" do
    list.contents << google
    expect(list.contents[0]).to eq google
  end
  it "returns 'http://www.google.com/ when see_list is called" do
    list.contents << google
    expect(list.see_list).to eq list.contents
  end
  it 'creates an instance of list and stores it in @list' do
    List.create_instance
    expect(List.read_instance.instance_of? List).to eq true
  end
end
