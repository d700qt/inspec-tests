# copyright: 2018, The Authors
title "sample section"

# you can also use plain tests
# describe file("/tmp") do
#   it { should be_directory }
# end

# you add controls here
control "tmp-1.0" do                        # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title "Create /tmp directory"             # A human-readable title
  desc "An optional description..."
  describe file("/tmp") do                  # The actual test
    it { should be_directory }
  end
end

control 'bash-retry' do
  # As long as the exit code is 0 fine
  # Parameters for actual test is passed into the script
  describe bash("files/script.sh #{input('max_retries')}") do
    its('exit_status') { should eq 0 }
    #it { should exist }
  end
end
