class Spree::Products::PropertiesPresenter < Spree::CommonPresenter

    presents :product_properties

    def properties?
        @product_properties.present?
    end

    def properties
        @product_properties
    end

    def reset_cycle_properties
        reset_cycle('properties')
    end

    class PropertyPresenter < Spree::CommonPresenter

        presents :property

        def property_css_class
            cycle('even', 'odd', :name => "properties")
        end

        def presentation
            @property.property.presentation
        end

        def value
            @property.value
        end
    end
end
