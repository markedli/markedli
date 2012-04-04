require 'spec_helper'

describe Bookmark do

describe Bookmark do

it { should accept_values_for(:url, "janedoe", "jd", "jd23", "j_d") }
it { should_not accept_values_for(:url, “”, “j”, nil)}

it { should accept_values_for(:title, "test", "tt", "t11", "t_est") }
it { should_not accept_values_for(:title, "”, “j”, nil)}

it { should accept_values_for(:description, "testing","balh blah blah", "jd 125", "jd_123", nil) }

end
