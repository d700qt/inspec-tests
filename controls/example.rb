# copyright: 2018, The Authors
title "sample section"

# you can also use plain tests
describe file("/tmp") do
  it { should be_directory }
end

# you add controls here
control "tmp-1.0" do                        # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title "Create /tmp directory"             # A human-readable title
  desc "An optional description..."
  describe file("/tmp") do                  # The actual test
    it { should be_directory }
  end
end

control 'check_error_logs' do
  # Check if there are any error logs
  describe bash('files/script.sh') do
    its('stdout') { should eq "2" }
    it { should exist }
  end
end
