Class ecommerce.bs.sale.create.Request Extends ecommerce.bs.base.Request
{

Parameter RESPONSECLASSNAME = "ecommerce.bs.sale.create.Response";

Property Body As %Library.String(MAXLEN = "");

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>Body</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
