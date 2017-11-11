module Api
  require 'net/http'
  class ItemsController < ApplicationController
    PER_PAGE = 20

    def index
      render json: items_list
    end

    def show
      render json: items_list(params[:page])
    end

    private

    # QiitaのAPIから記事一覧を取得
    # @param  page [Integer] ページ番号
    # @return [String] 記事一覧のjsonデータ
    def items_list(page = 1)
      uri = URI.parse('https://qiita.com/api/v2/items' \
                      '?page=' + page.to_s + \
                      '&per_page=' + PER_PAGE.to_s)
      list = Net::HTTP.get(uri)
      JSON.parse(list)
    end
  end
end
