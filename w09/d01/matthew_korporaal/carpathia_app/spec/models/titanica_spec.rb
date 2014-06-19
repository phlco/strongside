require 'spec_helper'

describe Titanica do

  describe '.scrape_url' do

    context "first class passengers" do
      let(:url) { "http://www.encyclopedia-titanica.org/titanic-first-class-passengers/" }

      it "should have the expected output" do
        output = Titanica.scrape_url(url)

        expected_output = [
          {
            name: "ALLEN, Miss Elisabeth Walton",
            age: 29,
            image_url: "http://www.encyclopedia-titanica.org/images/allen_ew_100.jpg",
          },
          {
            name: "ALLISON, Mr Hudson Joshua Creighton",
            age: 30,
            image_url: "http://www.encyclopedia-titanica.org/files/1/hudson-jc-allison-thm.jpg"
          }
        ]

        expect(output).to match(expected_output)
      end
    end

  end

end