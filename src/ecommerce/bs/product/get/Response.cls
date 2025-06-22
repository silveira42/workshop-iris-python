Class ecommerce.bs.product.get.Response Extends ecommerce.bs.base.Response
{

Property Product As ecommerce.model.Product(%JSONFIELDNAME = "product");

Storage Default
{
<Data name="ResponseDefaultData">
<Subscript>"Response"</Subscript>
<Value name="1">
<Value>Product</Value>
</Value>
</Data>
<DefaultData>ResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
