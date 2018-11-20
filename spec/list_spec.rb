require "list"
require 'pg'

describe List do
  let(:list) {List.new}
  it "returns rs when see_list is called" do
    expect(List.see_list.instance_of? PG::Result).to eq true
  end

end
