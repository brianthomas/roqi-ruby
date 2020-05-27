require 'spec_helper'

describe "Subjects" do

  describe "GET /subjects" do
    it "should display some subjects" do

      visit subjects_path
      page.should have_content 'top subject'

    end
  end

end
