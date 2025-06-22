Class ecommerce.bp.product.get.Request Extends Ens.Request
{

Parameter RESPONSECLASSNAME = "ecommerce.bp.product.get.Response";

Property Sku As %Library.String(MAXLEN = "");

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>Sku</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
