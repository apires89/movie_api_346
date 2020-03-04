class Api::V1::MoviesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]

  def index
    @movies = policy_scope(Movie)
  end

  def show
    @movie = Movie.find(params[:id])
    authorize @movie
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user = current_user
    authorize @movie
    if @movie.save
      render :show
    else
      render_error
    end
  end

  def update
    @movie = Movie.find(params[:id])
    authorize @movie
    if @movie.update(movie_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    authorize @movie
    if @movie.destroy
      render :index
    else
      render_error
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title,:rating)
  end

  def render_error
    render json: { errors: @movie.errors.full_messages },
     status: :unprocessable_entity
  end
end
