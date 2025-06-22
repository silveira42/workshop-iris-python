Class ecommerce.bs.product.create.Response Extends ecommerce.bs.base.Response
{

Property ProductModel As ecommerce.model.Product(%JSONFIELDNAME = "product");

Storage Default
{
<Data name="ResponseDefaultData">
<Subscript>"Response"</Subscript>
<Value name="1">
<Value>ProductModel</Value>
</Value>
</Data>
<DefaultData>ResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
