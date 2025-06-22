Class ecommerce.bs.product.list.Response Extends ecommerce.bs.base.Response
{

Property ProductList As list Of ecommerce.model.Product(%JSONFIELDNAME = "productList");

Storage Default
{
<Data name="ResponseDefaultData">
<Subscript>"Response"</Subscript>
<Value name="1">
<Value>ProductList</Value>
</Value>
</Data>
<DefaultData>ResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
