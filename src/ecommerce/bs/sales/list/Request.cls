Class ecommerce.bs.sale.list.Request Extends ecommerce.bs.base.Request
{

Parameter RESPONSECLASSNAME = "ecommerce.bs.sale.list.Response";

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
