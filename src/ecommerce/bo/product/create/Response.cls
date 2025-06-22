Class ecommerce.bo.product.create.Response Extends Ens.Response
{

Property ProductModel As ecommerce.model.Product;

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
