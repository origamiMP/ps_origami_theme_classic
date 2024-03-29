{**
 * CORE ORIGAMI : Shipping multi sellers
 * base theme: classic
 *}
{extends file='parent:checkout/_partials/steps/shipping.tpl'}


{block name='delivery_options'}

  <div class="delivery_options_address">
    {if isset($delivery_options)}
      {foreach $delivery_options as $id_address => $warehouse_list}

        <div class="warehouse_list">
          {foreach $warehouse_list as $id_warehouse => $warehouse}
            <div class="warehouse_carriers_wrapper">

              <div class="warehouse_title">
                <div class="carrier-shipped-by">
                  {if $warehouse.origami_seller->seller_type == 'dropshipping'}
                    {l s='Sold by' d='Shop.Theme.Checkout'}
                  {else}
                    {l s='Sold and sent by' d='Shop.Theme.Checkout'}
                  {/if}
                </div>
                <div class="carrier-seller-title">
                    <span>
                        {if $warehouse.origami_warehouse->origami_seller_id && !empty($warehouse.origami_seller->getName())}
                          {$warehouse.origami_seller->getName()}
                        {elseif !$warehouse.origami_warehouse->origami_seller_id && !empty($warehouse.origami_warehouse->name)}
                          {$warehouse.origami_warehouse->name}
                        {else}
                          {$shop.name}
                        {/if}
                    </span>
                </div>
              </div>

              {* Display the list of products in this package *}
              <div class="warehouse_products">
                <ul class="summary-product-list row">
                  {foreach $warehouse.product_list as $product}
                    <li class="col-sm-6">
                      <div class="summary-product-item">
                        <div title="{$product.name}" class="product-image">
                          <img class="img-fluid" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'small_default')|escape:'html':'UTF-8'}" alt="{$product.name}" width="60" />
                        </div>
                        {*<!--<div class="product-quantity">{$product.quantity}x</div>-->*}
                        <div class="product-name">{$product.name}</div>
                      </div>
                    </li>
                  {/foreach}
                </ul>
              </div>


              <div class="delivery-options">
                {if !empty($warehouse.carrier_list)}
                  {foreach $warehouse.carrier_list as $key => $carrier}
                    {assign var="carrier_selected" value=(isset($selected_delivery_options[$warehouse.key]) && $selected_delivery_options[$warehouse.key] == $key)}
                    <div class="delivery-option {if ($carrier@index % 2)}alternate_{/if}">
                      <div>

                        <input id="delivery_option_{$warehouse.key}_{$carrier@index}" class="delivery_option_radio" type="radio" name="delivery_option[{$id_address|intval}_{$id_warehouse|intval}]" data-key="{$key}" data-id_address="{$id_address|intval}" data-id_warehouse="{$id_warehouse|intval}" value="{$key}"{if $carrier_selected} checked="checked"{/if} style="display:none;" />

                        <div class="row">
                          <div class="col-sm-9">
                              {* if $carrier.logo}
                                  <img src="{$carrier.logo}" alt="{$carrier.name}" />
                              {/if *}
                              {$carrier.name} -
                              <span id='delivery_extra_infos_{$carrier.id}'>
                                {if !empty($warehouse.origami_seller->info.delivery_start_date)}
                                  {$warehouse.origami_seller->info.delivery_start_date}
                                {else}
                                  {$carrier.delay}
                                {/if}
                              </span>
                          </div>
                          <div class="col-sm-3 text-right"><b>{$carrier.price}</b></div>
                        </div>
                      </div>

                      {if !empty($carrier.extraContent)}
                        <div class="ori-carrier-extra-content">
                          {$carrier.extraContent nofilter}
                        </div>
                      {/if}
                    </div>

                    {*<!-- <div class="row carrier-extra-content"{if !$carrier_selected} style="display:none;"{/if}>
                      {$carrier.extraContent nofilter}
                    </div>-->*}

                    <div class="clearfix"></div>

                  {/foreach}
                {else}
                  <p class="alert alert-warning">{l s='Unfortunately, this supplier does not have carriers available for your delivery address.' d='Shop.Theme.Checkout'} {l s='These products will be removed from your cart.' d='Shop.Theme.Checkout'}</p>
                {/if}
              </div> <!-- end delivery-options -->

            </div> <!-- end warehouse_carriers_wrapper -->

          {/foreach}
        </div> <!-- end warehouse_list -->


      {/foreach}
    {/if}
  </div> <!-- end delivery_options_address -->




{/block}

