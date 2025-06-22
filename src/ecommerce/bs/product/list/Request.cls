Class ecommerce.bs.product.list.Request Extends ecommerce.bs.base.Request
{

Parameter RESPONSECLASSNAME = "ecommerce.bs.product.list.Response";

Property Lang As %Library.String [ InitialExpression = "pt" ];

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>Lang</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
