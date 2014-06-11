class Spree::Shared::ErrorMessagesPresenter < Spree::CommonPresenter

    presents :target

    def errors?
        @target && @target.errors.any?
    end

    def errors_count
        Spree.t(:errors_prohibited_this_record_from_being_saved, :count => @target.errors.count)
    end

    def errors_disclaimer
        Spree.t(:there_were_problems_with_the_following_fields)
    end

    def errors
        render :partial => "spree/shared/error", collection: @target.errors.full_messages, as: "error"
    end
end
