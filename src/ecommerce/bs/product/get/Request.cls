Class ecommerce.bs.product.get.Request Extends ecommerce.bs.base.Request
{

Parameter RESPONSECLASSNAME = "ecommerce.bs.product.get.Response";

Property Sku As %Library.String(MAXLEN = "");

Property Lang As %Library.String;

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>Sku</Value>
</Value>
<Value name="2">
<Value>Lang</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
