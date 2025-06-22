Class ecommerce.bp.sale.create.Response Extends Ens.Response
{

Property SaleModel As ecommerce.model.Sale;

Storage Default
{
<Data name="ResponseDefaultData">
<Subscript>"Response"</Subscript>
<Value name="1">
<Value>SaleModel</Value>
</Value>
</Data>
<DefaultData>ResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
