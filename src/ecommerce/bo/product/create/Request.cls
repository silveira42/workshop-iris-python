Class ecommerce.bo.product.create.Request Extends Ens.Request
{

Parameter RESPONSECLASSNAME = "ecommerce.bo.product.create.Response";

Property ProductModel As ecommerce.model.Product;

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>ProductModel</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
