class StaticPagesController < ApplicationController
  def home
    @twoPartyPreferred = AecDatum.getTwoPartyPreferred
  end

  def help
  end

  def about
  end

  def contact
  end
end
