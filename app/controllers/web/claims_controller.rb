class Web::ClaimsController < Web::ApplicationController
  def new
    claim = Claim.new
  end

  def create
    claim = Claim.new(claim_attrs)

    if claim.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    claim = Claim.find(params[:id])
    render json: claim
  end

  def index
    claims = Claim.all
    render json: claims
  end

  def edit
    claim = Claim.find(params[:id])
  end

  def update
    claim = Claim.find(params[:id])

    if claim.update(claim_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    claim = Claim.find(params[:id])
    claim.destroy
  end

  private

  def claim_attrs
    params.require(:claim).permit(:title, :description)
  end
end