class BankAccountsController < ApplicationController
  authorize_resource

  def new
    @bank_account = BankAccount.new
  end

  def create
    @bank_account = BankAccount.new(bank_account_params.merge(student: current_student))
    unless @bank_account.save
      render :new
    end
  end

private

  def bank_account_params
    params.require(:bank_account).permit(:account_uri, :verification_uri)
  end
  # def bank_account_params
  #   params.require(:bank_account).permit(:stripe_token)
  # end
end
