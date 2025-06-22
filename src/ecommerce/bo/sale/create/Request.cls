Class ecommerce.bo.sale.create.Request Extends Ens.Request
{

Parameter RESPONSECLASSNAME = "ecommerce.bo.sale.create.Response";

Property SaleModel As ecommerce.model.Sale;

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>SaleModel</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
