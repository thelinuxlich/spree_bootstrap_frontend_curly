class Spree::Products::ImagePresenter < Spree::CommonPresenter

    presents :product

    def product_img
        product_image(@product, :itemprop => "image")
    end
end
