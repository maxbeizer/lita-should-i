require "spec_helper"

describe Lita::Handlers::ShouldI, lita_handler: true do
  it { is_expected.to route_command("should I first or second?").to :should_i }

  it "greets anyone that says hi to it" do
    send_command "should I first or second?"
    expect(replies.last).to start_with "You should"
  end
end
