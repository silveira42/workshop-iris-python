Class ecommerce.bp.product.create.Request Extends Ens.Request
{

Parameter RESPONSECLASSNAME = "ecommerce.bp.product.create.Response";

Property ProductSchema As ecommerce.schema.ProductCreate;

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>ProductSchema</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
