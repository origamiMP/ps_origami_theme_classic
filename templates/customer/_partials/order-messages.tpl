{**
 * CORE ORIGAMI : Origami messages list + form in order detail
 *}
{block name='order_messages_table'}
    {hook h="displayOrigamiOrderMessages" order=$order}
{/block}
{block name='order_message_form'}
    {hook h="displayOrigamiContactForm" order=$order}
{/block}