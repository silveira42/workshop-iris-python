Class ecommerce.bp.sale.create.Request Extends Ens.Request
{

Parameter RESPONSECLASSNAME = "ecommerce.bp.sale.create.Response";

Property SaleSchema As ecommerce.schema.SaleCreate;

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>SaleSchema</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
