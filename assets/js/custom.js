
$(function() {
    console.log("origami theme");

    /*
     * checkout delivery step
     */
    if($('#checkout-delivery-step').length) {

        $('.delivery_option_radio').on('change', function() {
            carrierExtraInfosVisibility($(this).parents('.delivery-options'));
        });

        function carrierExtraInfosVisibility($wrapper) {
            $wrapper.find('.delivery_option_radio:not(:checked)').parents('.delivery-option').removeClass('selected');
            $wrapper.find('.delivery_option_radio:not(:checked)').parents('.delivery-option').find('.ori-carrier-extra-content:not(.always-display)').hide();
            $wrapper.find('.delivery_option_radio:checked').parents('.delivery-option').find('.ori-carrier-extra-content').show();
            $wrapper.find('.delivery_option_radio:checked').parents('.delivery-option').addClass('selected');
        }

        // init
        $('.delivery-options').each(function() {
            carrierExtraInfosVisibility($(this));
        });

        $('.delivery-option').on('click', function() {
            let $radio = $(this).find('.delivery_option_radio');
            $radio.prop("checked", true).change();
            carrierExtraInfosVisibility($(this).parents('.delivery-options'));
        });
    }
});
