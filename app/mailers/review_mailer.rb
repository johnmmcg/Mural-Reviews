class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review

    mail(
      to: review.mural.user.email,
      subject: "New Review for #{review.mural.name}"
    )
  end
end
