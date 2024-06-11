module Api
  module V1

    class ArticlesController < BaseController

      before_action :set_article, only: [:update, :show]

      def create
        if params[:article].present?
          @article = current_user.articles.new(article_params)

          if @article.save!
            render json: {
              code: 200,
              status: true,
              message: "Article created successfully.",
              data: @article.as_json
            }, status: :ok
          else
            render json: {
              code: 500,
              status: false,
              message: "Something went wrong, please try again.",
              data: {}
            }, status: :internal_server_error
          end
        else
          render json: {
            code: 500,
            status: false,
            message: "Please pass valid params",
            data: {}
          }, status: :internal_server_error
        end
      end

      def update
      end

      def show
      end

      private

      def article_params
        params.require(:article).permit(:title, :body, :image)
      end
      
      def set_article
        @article = Article.find(params[:id])
      end

    end
  end
end