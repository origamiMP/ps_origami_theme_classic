{* Custom FFT *}

<div class="origami-seller-box">

    {hook h='displayOrigamiSellerBoxTop'}

    <div class="float-right">
        {block name='seller_box_rating'}
            {hook h='displayOrigamiSellerRating' seller=$seller}
        {/block}
    </div>

    <span class="origami-soldby">
        {if $seller->isDropshipping()}{l s='Sold by' mod='origami'}{else}{l s='Sold and shipped by' mod='origami'}{/if}
    </span>
    <span class="origami-seller-box--name">
        <a {if $seller->getSellerPageUrl()}href="{$seller->getSellerPageUrl()}"{/if}>{$seller->getName()}</a>
    </span>


    <div class="origami-seller-box--actions">
        <a class="btn btn-secondary btn-full-width mb-3 btn-large btn-contact-seller" href="{$seller->getSellerContactUrl()}{if !empty($product['id'])}?id_product={$product['id']}{/if}">Poser une question au vendeur</a>
    </div>
</div>